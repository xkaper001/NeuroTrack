import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'dart:io' show Platform;

import 'package:therapist/presentation/home/home_screen.dart';

final supabase = Supabase.instance.client;

class GoogleSignInButton extends StatefulWidget {
  const GoogleSignInButton({super.key});

  @override
  _GoogleSignInButtonState createState() => _GoogleSignInButtonState();
}

class _GoogleSignInButtonState extends State<GoogleSignInButton> {
  Future<void> _handleGoogleSignIn(BuildContext context) async {
    try {
      if (kIsWeb) {
        await _handleWebSignIn(context);
      } else {
        await _handleMobileSignIn(context);
      }
    } catch (error) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Sign in failed: $error')),
        );
      }
    }
  }

  Future<void> _handleWebSignIn(BuildContext context) async {
    final supabaseUrl = dotenv.env['SUPABASE_URL'] ??
        (throw Exception("Supabase URL not found in .env"));

    await supabase.auth.signInWithOAuth(
      OAuthProvider.google,
      redirectTo: kIsWeb
          ? "$supabaseUrl/auth/v1/callback"
          : 'com.mycompany.cbtdiary://login-callback/',
      authScreenLaunchMode:
          kIsWeb ? LaunchMode.platformDefault : LaunchMode.externalApplication,
    );

    _handlePostSignIn(context);
  }

  Future<void> _handleMobileSignIn(BuildContext context) async {
    // Get client IDs from environment variables
    debugPrint('I am here');
    final webClientId = dotenv.env['GOOGLE_WEB_CLIENT_ID'] ??
        (throw Exception("WEB_CLIENT_ID not found in .env"));
    final iosClientId = dotenv.env['GOOGLE_IOS_CLIENT_ID'];
    
final GoogleSignIn googleSignIn = GoogleSignIn(
      clientId: Platform.isIOS ? iosClientId : null,
      serverClientId: webClientId,
      scopes: ['email', 'profile'],
    );

    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    if (googleUser == null) throw 'Sign in cancelled';

    final GoogleSignInAuthentication googleAuth = 
        await googleUser.authentication;

    if (googleAuth.idToken == null) throw 'No ID Token found';
    if (googleAuth.accessToken == null) throw 'No Access Token found';

     await supabase.auth.signInWithIdToken(
      provider: OAuthProvider.google,
      idToken: googleAuth.idToken!,
      accessToken: googleAuth.accessToken,
    );

    _handlePostSignIn(context);
  }

  void _handlePostSignIn(BuildContext context) {
    final session = supabase.auth.currentSession;
    if (session == null || !mounted) return;

    final userMetadata = session.user.userMetadata;
    final fullName = userMetadata?['full_name'] ?? 'User';
    final email = session.user.email ?? 'No email';

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Welcome $fullName!'),
        duration: const Duration(seconds: 2),
      ),
    );

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
          onPressed: () => _handleGoogleSignIn(context),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            elevation: 2,
            padding: const EdgeInsets.symmetric(vertical: 12),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/google_logo.png',
                height: 24,
                width: 24,
              ),
              const SizedBox(width: 10),
              const Text(
                'Continue with Google',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'dart:io' show Platform;
import 'package:therapist/presentation/home/home_screen.dart';

class AuthProvider extends ChangeNotifier {
  
  final supabase = Supabase.instance.client;
   bool _isAuthenticated = false;

  bool get isAuthenticated => _isAuthenticated;

  void login() {
    _isAuthenticated = true;
    notifyListeners();
  }

  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      if (kIsWeb) {
        await _handleWebSignIn(context);
      } else {
        await _handleMobileSignIn(context);
      }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Sign in failed: $error')),
      );
    }
  }

  Future<void> _handleWebSignIn(BuildContext context) async {
    final supabaseUrl = dotenv.env['SUPABASE_URL'] ??
        (throw Exception("Supabase URL not found in .env"));

    await supabase.auth.signInWithOAuth(
      OAuthProvider.google,
      redirectTo: "$supabaseUrl/auth/v1/callback",
      authScreenLaunchMode: LaunchMode.platformDefault,
    );

    _handlePostSignIn(context);
  }

  Future<void> _handleMobileSignIn(BuildContext context) async {
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
    if (session == null) return;

    final userMetadata = session.user.userMetadata;
    final fullName = userMetadata?['full_name'] ?? 'User';

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
}

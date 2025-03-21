import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patient/presentation/auth/personal_details_screen.dart';
import 'package:patient/presentation/home/home_screen.dart';
import 'package:patient/provider/auth_provider.dart';
import 'package:provider/provider.dart';
import '../widgets/google_signin_button.dart';
import '../widgets/welcome_header.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  late Timer _timer;
  bool hasNavigated = false;

  final List<OnboardingContent> _contents = [
    OnboardingContent(
      image: 'assets/illustration.png',
      title: 'Daily Activities',
      description: 'Personalized Daily Activities, Tracked Effortlessly!',
    ),
    OnboardingContent(
      image: 'assets/illustration1.png',
      title: 'Therapy Goals ',
      description: 'Personalized Daily Activities, Tracked Effortlessly!',
    ),
    OnboardingContent(
      image: 'assets/illustration2.png',
      title: 'Health Tracking',
      description: 'Monitor your health metrics with ease and accuracy!',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_currentPage < _contents.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0; // Reset to first page when reaching the end
      }
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    WidgetsBinding.instance.addPersistentFrameCallback((_) {
      if(!mounted) {
        return;
      }
      
      final authProvider = context.read<AuthProvider>();
      final AuthNavigationStatus navigationStatus = authProvider.navigationStatus;

      void showSignInError(String error) {
        // TODO: create a genric method to show snackbar
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(error),
          ),
        );
      }

      if(!hasNavigated && !navigationStatus.isUnknown) {
        if (navigationStatus.isError) {
          showSignInError(authProvider.signInErrorMessage);
          authProvider.resetStateInFailure();
          return;
        }
        hasNavigated = true;
        _handleNavigation(navigationStatus);
      }
    });
  }

  void _handleNavigation(AuthNavigationStatus status) {
    Widget nextScreen;

    if (status.isHome) {
      nextScreen = const HomeScreen(userName: 'Mohd Jasir Khan');
    } else if (status.isPersonalDetails) {
      nextScreen = const PersonalDetailsScreen();
    } else {
      return;
    }

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => nextScreen),
    );
  }

  void _signInWithGoogle() {
    Provider.of<AuthProvider>(context,listen: false).signInWithGoogle();
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<AuthProvider>(context,listen: true);
    return Scaffold(
      body: Column(
        children: [
          // Custom Welcome Header
          const WelcomeHeader(),

          // Carousel and bottom content
          Expanded(
            child: Stack(
              children: [
                // PageView for carousel
                PageView.builder(
                  controller: _pageController,
                  itemCount: _contents.length,
                  onPageChanged: (int page) {
                    setState(() {
                      _currentPage = page;
                    });
                  },
                  itemBuilder: (context, index) {
                    return _buildCarouselItem(_contents[index]);
                  },
                ),

                // Pagination dots
                Positioned(
                  bottom: 120,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      _contents.length,
                      (index) => _buildDot(index),
                    ),
                  ),
                ),

                // Google Sign-in Button
                Positioned(
                  bottom: 40,
                  left: 0,
                  right: 0,
                  child: GoogleSignInButton(
                    onPressed: () => _signInWithGoogle(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCarouselItem(OnboardingContent content) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Illustration
        Image.asset(content.image, height: 200),
        const SizedBox(height: 35),
        Text(
          content.title,
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.blueAccent,
          ),
        ),
        const SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            content.description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
        ),
        const SizedBox(height: 60), // Space for dots and button
      ],
    );
  }

  Widget _buildDot(int index) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.only(right: 5),
      height: 8,
      width: 8,
      decoration: BoxDecoration(
        color: _currentPage == index ? Colors.blueAccent : Colors.grey.shade300,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}

// Model class for onboarding content
class OnboardingContent {
  final String image;
  final String title;
  final String description;

  OnboardingContent({
    required this.image,
    required this.title,
    required this.description,
  });
}

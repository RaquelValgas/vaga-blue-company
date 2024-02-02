import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vaga_blue_company/presentation/login/login_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      duration: 5000,
      splash: './assets/images/logo.png',
      nextScreen: const LoginPage(),
      splashIconSize: 200,
      splashTransition: SplashTransition.rotationTransition,
    );
  }
}

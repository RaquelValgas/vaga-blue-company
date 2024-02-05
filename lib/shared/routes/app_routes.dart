import 'package:flutter/material.dart';
import 'package:vaga_blue_company/presentation/graphic/graphics_page.dart';
import 'package:vaga_blue_company/presentation/health-card/health_card_page.dart';
import 'package:vaga_blue_company/presentation/home/home_page.dart';
import 'package:vaga_blue_company/presentation/login/login_page.dart';
import 'package:vaga_blue_company/presentation/splash/splash_page.dart';

class AppRoutes {
  static const splash = '/splash';
  static const login = '/login';
  static const home = '/home';
  static const healthCard = '/health-card ';
  static const graphics = '/graphics';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
        return MaterialPageRoute(
          builder: (context) => const SplashPage(),
        );
      case AppRoutes.login:
        return MaterialPageRoute(
          builder: (context) => const LoginPage(),
        );
      case AppRoutes.home:
        return MaterialPageRoute(
          builder: (context) => const HomePage(),
        );
      case AppRoutes.healthCard:
        return MaterialPageRoute(
          builder: (context) => const HealthCardPage(),
        );
      case AppRoutes.graphics:
        return MaterialPageRoute(
          builder: (context) => const GraphicsPage(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(
              child: Text('Página não encontrada'),
            ),
          ),
        );
    }
  }
}

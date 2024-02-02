import 'package:flutter/material.dart';
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
        return MaterialPageRoute(builder: (context) => const SplashPage());
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

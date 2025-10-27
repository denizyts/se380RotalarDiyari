import 'package:flutter/material.dart';
import '../screens/auth.dart';
import '../screens/HomePage.dart';

class AppRoutes {
  static const String auth = '/auth';
  static const String home = '/home';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case auth:
        return MaterialPageRoute(builder: (_) => const AuthPage());
      case home:
        return MaterialPageRoute(builder: (_) => const HomePage());
      default:
        return MaterialPageRoute(builder: (_) => const AuthPage());
    }
  }
}

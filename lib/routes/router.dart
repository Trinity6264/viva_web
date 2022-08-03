import 'package:flutter/material.dart';
import 'package:viva_web/views/auth/login_view.dart';
import 'package:viva_web/views/dashboard/dashboard.dart';

class VivaRoute {
  static const dashboard = '/dashboard';
  static const login = '/';

  Route<dynamic> onGeneratedRoutes(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return MaterialPageRoute(
          builder: (context) => const LoginView(),
        );
      case dashboard:
        return MaterialPageRoute(
          builder: (context) => const DashBoard(),
        );

      default:
        throw const FormatException('Route not found');
    }
  }

}


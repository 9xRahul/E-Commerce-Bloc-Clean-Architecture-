import 'package:clean_architecture_with_bloc/core/routes/route_names.dart';
import 'package:clean_architecture_with_bloc/presentation/login/screens/login_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.login:
        return MaterialPageRoute(
          builder: (BuildContext context) => LoginScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(body: Text("No routes found")),
        );
    }
  }
}

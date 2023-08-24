import 'package:flutter/material.dart';

import '../features/favorite/presentation/pages/favorite_page.dart';
import '../features/home/presentation/pages/home_page.dart';
import 'routing_variables.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case Navigation.homePage:
        return MaterialPageRoute(builder: (_) => HomePage());
      case Navigation.favoritePage:
        return MaterialPageRoute(builder: (_) => FavoritePage());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}

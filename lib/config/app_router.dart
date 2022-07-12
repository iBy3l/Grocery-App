import 'package:flutter/material.dart';
import '../model/models.dart';
import '/ui/screens/screens.dart';

class AppRouter {
  ///////////////////////////////////////////////

  static const String intro = '/intro';
  static const String login = '/login';
  static const String home = '/home';
  static const String catalog = '/catalog';
  static const String product = '/product';
  static const String cart = '/cart';
  static const String checkout = '/checkout';
  static const String favoritesList = '/favorites';
  ///////////////////////////////////////////////////

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    print('This is route $settings.name');

    switch (settings.name) {
      case intro:
        return MaterialPageRoute(builder: (_) => const IntroPage());
      case checkout:
        return MaterialPageRoute(builder: (_) => const CheckoutScreen());
      case login:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case home:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case catalog:
        return MaterialPageRoute(
          builder: (_) => CatalogScreen(
            category: settings.arguments as Category,
          ),
        );
      case product:
        return MaterialPageRoute(
          builder: (_) => ProductScreen(
            product: settings.arguments as Product,
            descri: const [],
          ),
        );
      case cart:
        return MaterialPageRoute(builder: (_) => const CartScreen());
      case favoritesList:
        return MaterialPageRoute(builder: (_) => const FavoritesListScreen());
      default:
        return _erroRoute();
    }
  }

  static Route _erroRoute() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: '/error'),
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
      ),
    );
  }
}

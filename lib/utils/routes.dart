import 'package:flutter/material.dart';
import '../core/home_page.dart';
import '../core/search_page.dart';
import '../core/splash_screen.dart';

class Routes {
  static final GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();
  get navigatorKey {
    return navKey;
  }

  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const SplashCreenShowTrack());
      case '/home':
        return MaterialPageRoute(builder: (_) => const HomePage());
      case '/search':
        return MaterialPageRoute(builder: (_) => const SearchPage());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('Nenhuma rota definida para ${settings.name}'),
                  ),
                ));
    }
  }
}

import 'package:bento_challenge/screens/app_pages.dart';
import 'package:bento_challenge/screens/product/product_screen.dart';
import 'package:bento_challenge/screens/splash/splash_screen.dart';
import 'package:bento_challenge/utils/app_colors.dart';
import 'package:bento_challenge/utils/app_routes.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.splashScreen,
      onGenerateRoute: _generateRoute,
      theme: ThemeData.light().copyWith(
        colorScheme: const ColorScheme.light()
            .copyWith(surface: AppColors.white, surfaceTint: AppColors.white),
        menuTheme: MenuThemeData(
            style: MenuStyle(
                backgroundColor: WidgetStateProperty.all(AppColors.white))),
      ),
    );
  }

  Route _generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _buildPageRoute(const SplashScreen(), settings);
      case '/pages':
        return _buildPageRoute(const AppPages(), settings);
      case '/product':
        return _buildPageRoute(
            ProductScreen(
                id: (settings.arguments as Map<String, dynamic>)["id"]
                    as String),
            settings);
      default:
        return _buildPageRoute(const SplashScreen(), settings);
    }
  }

  PageRouteBuilder _buildPageRoute(Widget page, RouteSettings settings) {
    return PageRouteBuilder(
      settings: settings,
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: DecoratedBoxTransition(
            position: DecorationPosition.background,
            decoration: DecorationTween(
              begin: BoxDecoration(color: Colors.black.withOpacity(0.5)),
              end: const BoxDecoration(color: Colors.transparent),
            ).animate(animation),
            child: child,
          ),
        );
      },
    );
  }
}

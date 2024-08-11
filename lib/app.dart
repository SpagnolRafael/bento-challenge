import 'package:bento_challenge/screens/home/home_screen.dart';
import 'package:bento_challenge/screens/splash/splash_screen.dart';
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
      // routes: {
      //   AppRoutes.splashScreen: (context) => const SplashScreen(),
      //   AppRoutes.homeScreen: (context) => const HomeScreen(),
      // },
    );
  }

  Route _generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _buildPageRoute(const SplashScreen(), settings);
      case '/home':
        return _buildPageRoute(const HomeScreen(), settings);
      default:
        return _buildPageRoute(const HomeScreen(), settings);
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

        // // Exemplo de transição slide from right
        // return SlideTransition(
        //   position: Tween<Offset>(
        //     begin: const Offset(1.0, 0.0),
        //     end: Offset.zero,
        //   ).animate(animation),
        //   child: child,
        // );
      },
    );
  }
}

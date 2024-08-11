import 'package:bento_challenge/utils/app_colors.dart';
import 'package:bento_challenge/utils/app_routes.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(seconds: 2)).then((_) {
        Navigator.pushReplacementNamed(context, AppRoutes.homeScreen);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.redLogo,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Image.asset('assets/images/splash_bg.jpg'),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 90),
                child: LinearProgressIndicator(),
              ),
            ],
          )
        ],
      ),
    );
  }
}

import 'package:bento_challenge/shareds/app_bar.dart';
import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  final Widget body;
  final bool hasAppBar;
  const AppScaffold({super.key, required this.body, this.hasAppBar = false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              if (hasAppBar) ...[
                const CustomAppBar(),
                const SizedBox(height: 10),
              ],
              Expanded(child: body),
            ],
          ),
        ),
      ),
    );
  }
}

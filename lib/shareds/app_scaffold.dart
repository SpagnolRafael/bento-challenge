import 'package:bento_challenge/shareds/app_bar.dart';
import 'package:flutter/material.dart';

class AppScaffold extends StatefulWidget {
  final Widget body;
  final Widget? bottomNavigationBar;
  final bool hasAppBar;

  const AppScaffold({
    super.key,
    required this.body,
    this.hasAppBar = false,
    this.bottomNavigationBar,
  });

  @override
  State<AppScaffold> createState() => _AppScaffoldState();
}

class _AppScaffoldState extends State<AppScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SafeArea(
            bottom: false,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  if (widget.hasAppBar) ...[
                    const CustomAppBar(),
                    const SizedBox(height: 10),
                  ],
                  Expanded(child: widget.body),
                ],
              ),
            ),
          ),
          if (widget.bottomNavigationBar != null) widget.bottomNavigationBar!
        ],
      ),
    );
  }
}

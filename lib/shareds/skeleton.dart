import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class AppSkeleton extends StatelessWidget {
  final bool isLoading;
  final Widget child;

  const AppSkeleton({super.key, required this.isLoading, required this.child});

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 600), // Duração do efeito de fade
      transitionBuilder: (Widget child, Animation<double> animation) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
      child: isLoading
          ? Shimmer.fromColors(
              key: const ValueKey(
                  'shimmer'), // Chave única para o widget shimmer
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.white,
              child: child,
            )
          : child,
    );
  }
}

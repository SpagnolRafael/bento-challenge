import 'package:flutter/material.dart';

class AppErrorWidget extends StatelessWidget {
  final void Function()? onTryAgain;
  const AppErrorWidget({super.key, this.onTryAgain});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        const Icon(Icons.warning, size: 100, color: Colors.red),
        const Text('An error ocurred.'),
        if (onTryAgain != null)
          TextButton(onPressed: onTryAgain, child: const Text('Try Again')),
      ],
    );
  }
}

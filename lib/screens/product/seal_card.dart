import 'package:flutter/material.dart';

class SealCard extends StatelessWidget {
  final String title;
  final String icon;
  const SealCard({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(5),
          height: 45,
          width: 45,
          decoration: const BoxDecoration(
              color: Color(0xffC7F4C5), shape: BoxShape.circle),
          child: Center(child: Image.asset(icon)),
        ),
        const SizedBox(height: 6),
        Text(title),
      ],
    );
  }
}

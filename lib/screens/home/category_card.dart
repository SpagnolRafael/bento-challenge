import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String title;
  final String icon;
  final bool isSelected;
  const CategoryCard(
      {super.key,
      required this.title,
      required this.isSelected,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color:
                isSelected ? const Color(0xffe6faf0) : const Color(0xfff5f5f5),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Image.asset(icon),
        ),
        const SizedBox(height: 6),
        Text(
          title,
          style: const TextStyle(
            color: Color(0xff001a4b),
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}

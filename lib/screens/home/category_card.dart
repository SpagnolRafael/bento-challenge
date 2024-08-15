import 'package:bento_challenge/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String title;
  final String icon;
  final bool isSelected;
  final void Function() onTap;
  const CategoryCard(
      {super.key,
      required this.title,
      required this.isSelected,
      required this.icon,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            padding: const EdgeInsets.all(12),
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: isSelected ? AppColors.grey40 : AppColors.grey50,
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
      ),
    );
  }
}

import 'package:bento_challenge/utils/app_colors.dart';
import 'package:bento_challenge/utils/app_textstyle.dart';
import 'package:flutter/material.dart';

class ActionCard extends StatelessWidget {
  const ActionCard({super.key, required this.title, required this.icon});

  final String title;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Row(
            children: [
              const SizedBox(width: 20),
              Text(title,
                  style: AppTextStyle.poppins.copyWith(
                      fontSize: 18,
                      color: AppColors.blue900,
                      fontWeight: FontWeight.w900)),
            ],
          ),
          Align(alignment: Alignment.bottomRight, child: icon),
        ],
      ),
    );
  }
}

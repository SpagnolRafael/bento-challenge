import 'package:bento_challenge/utils/app_colors.dart';
import 'package:bento_challenge/utils/app_textstyle.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Delivery',
                style: AppTextStyle.poppins.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: AppColors.blue800,
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Bacangan, Sambit',
                      style: AppTextStyle.roboto.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w200,
                        color: AppColors.grey800,
                      )),
                  const SizedBox(width: 5),
                  const Icon(Icons.keyboard_arrow_down_rounded,
                      color: AppColors.grey800, size: 18),
                ],
              )
            ],
          ),
        ),
        const AppAvatar(),
      ],
    );
  }
}

class AppAvatar extends StatelessWidget {
  const AppAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 30,
      decoration:
          const BoxDecoration(shape: BoxShape.circle, color: AppColors.primary),
      child: Image.asset('assets/images/avatar-user.png'),
    );
  }
}

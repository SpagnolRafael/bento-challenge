import 'package:bento_challenge/utils/app_colors.dart';
import 'package:bento_challenge/utils/app_textstyle.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final VoidCallback? onTap;
  final bool isLoading;
  final double? height;
  final double? width;
  final Color? color;
  final String? text;
  final TextStyle? style;
  final BorderRadius? borderRadius;
  final Widget? icon;

  const AppButton._({
    this.onTap,
    this.height,
    this.width,
    this.color,
    this.text,
    this.style,
    this.borderRadius,
    required this.isLoading,
    this.icon,
  });

  factory AppButton.primary(
          {VoidCallback? onTap,
          required String text,
          bool isLoading = false,
          Color color = AppColors.primary,
          Color? textColor = AppColors.primary,
          Widget? icon}) =>
      AppButton._(
        isLoading: isLoading,
        onTap: isLoading ? null : onTap,
        width: double.infinity,
        height: 44,
        color: isLoading ? AppColors.primary : color,
        text: text,
        style:
            AppTextStyle.roboto.copyWith(color: textColor ?? AppColors.white),
        icon: icon,
        borderRadius: BorderRadius.circular(25),
      );

  factory AppButton.action({
    VoidCallback? onTap,
    required Widget icon,
    Color color = AppColors.grey50,
    bool isLoading = false,
  }) =>
      AppButton._(
        isLoading: isLoading,
        icon: icon,
        color: color,
        onTap: onTap,
      );

  @override
  Widget build(BuildContext context) => GestureDetector(
        child: InkWell(
          onTap: onTap,
          child: Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
                color: onTap == null ? AppColors.grey : color,
                shape: icon != null ? BoxShape.circle : BoxShape.rectangle,
                borderRadius: borderRadius),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (isLoading)
                  Center(
                      child: Transform.scale(
                          scale: 0.5, child: const CircularProgressIndicator()))
                else
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (text != null) Text(text!, style: style),
                      if (icon != null)
                        Padding(padding: const EdgeInsets.all(8), child: icon!),
                    ],
                  )
              ],
            ),
          ),
        ),
      );
}

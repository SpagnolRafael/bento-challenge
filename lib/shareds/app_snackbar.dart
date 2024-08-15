import 'package:bento_challenge/utils/app_colors.dart';
import 'package:bento_challenge/utils/app_textstyle.dart';
import 'package:flutter/material.dart';

enum SnackType { success, error, warning }

class AppSnackbar {
  const AppSnackbar();

  static show({
    required BuildContext context,
    required SnackType type,
    String? message,
    Function? callback,
    Widget? rightAction,
    VoidCallback? onActionPressed,
    VoidCallback? doAfterDismissed,
    Widget? richTextWidget,
    Widget? content,
    double? bottomMargin,
    double? width,
    Duration onScreenDuration = const Duration(seconds: 5),
  }) async {
    Widget icon;
    Color? backgroundIconColor;
    Color? borderColor;
    TextStyle? textStyle = AppTextStyle.roboto.copyWith(color: AppColors.black);

    switch (type) {
      case SnackType.success:
        icon = const Icon(Icons.check, color: AppColors.blue800);
        backgroundIconColor = AppColors.primary;
        borderColor = AppColors.blue800;
      case SnackType.error:
        icon = const Icon(Icons.close_rounded, color: AppColors.black);
        backgroundIconColor = AppColors.redLogo;
        borderColor = AppColors.redLogo;
      case SnackType.warning:
        icon = const Icon(Icons.warning_amber, color: AppColors.blue800);
        backgroundIconColor = Colors.yellow;
        borderColor = Colors.yellow;
    }

    OverlayState? overlayState = Overlay.of(context);
    late OverlayEntry overlay;
    overlay = OverlayEntry(
      maintainState: true,
      builder: (context) {
        return Positioned(
          bottom: bottomMargin ?? MediaQuery.of(context).viewInsets.bottom,
          child: SafeArea(
            child: Material(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: borderColor!, width: 2),
                  color: AppColors.white,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.black.withOpacity(0.4),
                      offset: const Offset(0, 10),
                      blurRadius: 15,
                      spreadRadius: -9,
                    )
                  ],
                ),
                width: width ?? MediaQuery.of(context).size.width,
                height: 65,
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: callback != null && richTextWidget == null
                      ? () {
                          overlay.remove();
                          callback();
                        }
                      : () {},
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: double.infinity,
                        width: 60,
                        color: backgroundIconColor,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: icon,
                        ),
                      ),
                      Expanded(
                        child: richTextWidget ??
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: content ??
                                  (message == null
                                      ? const SizedBox.shrink()
                                      : Text(message, style: textStyle)),
                            ),
                      ),
                      if (rightAction != null && onActionPressed != null)
                        InkWell(
                          onTap: () {
                            onActionPressed();
                            overlay.remove();
                          },
                          child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: rightAction),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
    overlayState.insert(overlay);
    await Future.delayed(onScreenDuration);
    try {
      overlay.remove();
      if (doAfterDismissed != null) doAfterDismissed();
    } catch (_) {}
  }
}

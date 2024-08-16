import 'package:bento_challenge/utils/app_colors.dart';
import 'package:bento_challenge/utils/app_textstyle.dart';
import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

class AppTutorial {
  static GlobalKey gKeyProductBanner = GlobalKey(debugLabel: 'product-banner');
  static GlobalKey gKeyProductFavorite =
      GlobalKey(debugLabel: 'product-favorite');
  static GlobalKey gKeyHomeBanner = GlobalKey(debugLabel: 'home-banner');
  static GlobalKey gKeyHomeProduct = GlobalKey(debugLabel: 'home-product');
  static GlobalKey gKeyHomeCategories =
      GlobalKey(debugLabel: 'home-categories');
  static GlobalKey gKeyNavBar = GlobalKey(debugLabel: 'nav-bar');

  static Future<void> home(BuildContext context) async {
    return TutorialCoachMark(
      onFinish: () => showDialog(
        context: context,
        barrierDismissible: true,
        barrierColor: AppColors.black.withOpacity(.8),
        builder: (context) => GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Dialog(
            backgroundColor: Colors.transparent,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Features until here:',
                    style: AppTextStyle.roboto.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.white),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  "Until this moment, some features were executed like the loading was a skeleton (shimmer effect) that matches perfectly with the built screen design, so you can't see the transition because it changes with a fade effect, showing the component content.",
                  textAlign: TextAlign.justify,
                  style: AppTextStyle.roboto.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                      color: AppColors.white),
                ),
                const SizedBox(height: 6),
                Text(
                  'Splash screen customized',
                  textAlign: TextAlign.start,
                  style: AppTextStyle.roboto.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                      color: AppColors.white),
                ),
                const SizedBox(height: 6),
                Text(
                  'Application icon customized.',
                  textAlign: TextAlign.start,
                  style: AppTextStyle.roboto.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                      color: AppColors.white),
                ),
                const SizedBox(height: 6),
                Text(
                  'Animated carrousel.',
                  textAlign: TextAlign.start,
                  style: AppTextStyle.roboto.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                      color: AppColors.white),
                ),
                const SizedBox(height: 6),
                Text(
                  'Animated bottom navigation bar with "sliver effect".',
                  textAlign: TextAlign.start,
                  style: AppTextStyle.roboto.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                      color: AppColors.white),
                ),
                const SizedBox(height: 10),
                Text(
                  'Tap on a product in the grid icon to see that the page navigation transitions work smoothly with a fade effect.',
                  textAlign: TextAlign.justify,
                  style: AppTextStyle.roboto.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                      color: AppColors.white),
                ),
                const SizedBox(height: 5),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    'Skip',
                    style: AppTextStyle.roboto.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: AppColors.white),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      skipWidget: const SizedBox(),
      targets: [
        TargetFocus(
            radius: 10,
            identify: 'home-banner-idtf',
            keyTarget: gKeyHomeBanner,
            shape: ShapeLightFocus.RRect,
            enableOverlayTab: true,
            contents: [
              TargetContent(
                align: ContentAlign.bottom,
                builder: (context, controller) => Column(
                  children: [
                    Text(
                      'Animated Carrousel',
                      style: AppTextStyle.roboto.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColors.white),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'This carousel has a timer that automatically changes the images so the user can see the most important things about the app, like promotions. If the user wants to see the image in more detail, they can tap on the image, and it will be displayed until the user closes the visualization screen by tapping the button at the top.',
                      textAlign: TextAlign.justify,
                      style: AppTextStyle.roboto.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                          color: AppColors.white),
                    ),
                    Image.asset('assets/images/love-phone.png',
                        width: 150, height: 250),
                  ],
                ),
              ),
            ]),
        TargetFocus(
            radius: 10,
            identify: 'home-categories-idtf',
            keyTarget: gKeyHomeCategories,
            shape: ShapeLightFocus.RRect,
            enableOverlayTab: true,
            contents: [
              TargetContent(
                align: ContentAlign.bottom,
                builder: (context, controller) => Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      'assets/images/reload.png',
                      width: 200,
                      height: 200,
                      color: AppColors.grey800,
                    ),
                    Column(
                      children: [
                        Text(
                          'Categories',
                          style: AppTextStyle.roboto.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: AppColors.white),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          'When the user taps on a specific category, the app will fetch recommendations that fit the selected category, and the grid will be redefined. Remember that the app data is a mockup, so the products will be the same, but the grid will change as if it were new.',
                          textAlign: TextAlign.justify,
                          style: AppTextStyle.roboto.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                              color: AppColors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ]),
        TargetFocus(
            radius: 10,
            identify: 'bottom-nav-bar',
            keyTarget: gKeyNavBar,
            shape: ShapeLightFocus.RRect,
            enableOverlayTab: true,
            contents: [
              TargetContent(
                align: ContentAlign.top,
                builder: (context, controller) => Column(
                  children: [
                    Text(
                      'Animated Bottom Navigation Bar',
                      style: AppTextStyle.roboto.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColors.white),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'The bottom navigation bar has a wave animation when you choose a new page, and it has a "sliver effect" that hides the bar when you scroll the screen to see more items on the grid, making the user experience more pleasant as they browse the recommended products.',
                      textAlign: TextAlign.justify,
                      style: AppTextStyle.roboto.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                          color: AppColors.white),
                    ),
                    const SizedBox(height: 10),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: RotatedBox(
                        quarterTurns: 3,
                        child: Image.asset('assets/images/hand-click.png',
                            color: AppColors.grey350, width: 150, height: 250),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
      ],
    ).show(context: context);
  }

  static Future<void> product(BuildContext context) async {
    return TutorialCoachMark(
      onFinish: () => showDialog(
        context: context,
        barrierDismissible: true,
        barrierColor: AppColors.black.withOpacity(.8),
        builder: (context) => GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Dialog(
            backgroundColor: Colors.transparent,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Thanks for your attention until here.',
                    style: AppTextStyle.roboto.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.white),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'Now the features tutorial is finished, and if you want to see it again, go back to the home screen and tap on "ORDER AGAIN" to restart the tutorial. To restart the product screen tutorial, tap on "Add to Cart." Feel free to navigate the app and see the animations in action.',
                  textAlign: TextAlign.justify,
                  style: AppTextStyle.roboto.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                      color: AppColors.white),
                ),
                const SizedBox(height: 6),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    'Skip',
                    style: AppTextStyle.roboto.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: AppColors.white),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      skipWidget: const SizedBox(),
      targets: [
        TargetFocus(
            radius: 10,
            identify: 'product-favorite-idtf',
            keyTarget: gKeyProductFavorite,
            shape: ShapeLightFocus.Circle,
            enableOverlayTab: true,
            contents: [
              TargetContent(
                align: ContentAlign.bottom,
                builder: (context, controller) => Column(
                  children: [
                    Text(
                      'Animated Favorite',
                      style: AppTextStyle.roboto.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColors.white),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'When the favorite icon is tapped, it will beat like a heart, making the experience of favoriting items more enjoyable.',
                      textAlign: TextAlign.justify,
                      style: AppTextStyle.roboto.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                          color: AppColors.white),
                    ),
                    Image.asset('assets/images/favorite-tutorial.png',
                        width: 150, height: 250),
                  ],
                ),
              ),
            ]),
        TargetFocus(
            radius: 10,
            identify: 'product-banner-idtf',
            keyTarget: gKeyProductBanner,
            shape: ShapeLightFocus.RRect,
            enableOverlayTab: true,
            contents: [
              TargetContent(
                align: ContentAlign.bottom,
                builder: (context, controller) => Column(
                  children: [
                    Text(
                      'Animated Carrousel',
                      style: AppTextStyle.roboto.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColors.white),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'This carousel has a timer that automatically changes the images so the user can see the most important things about the app, like promotions. If the user wants to see the image in more detail, they can tap on the image, and it will be displayed until the user closes the visualization screen by tapping the button at the top right corner.',
                      textAlign: TextAlign.justify,
                      style: AppTextStyle.roboto.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                          color: AppColors.white),
                    ),
                    Image.asset('assets/images/love-phone.png',
                        width: 150, height: 250),
                  ],
                ),
              ),
            ]),
      ],
    ).show(context: context);
  }
}

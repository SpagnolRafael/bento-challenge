import 'package:bento_challenge/utils/app_colors.dart';
import 'package:bento_challenge/utils/app_routes.dart';
import 'package:bento_challenge/utils/app_textstyle.dart';
import 'package:flutter/material.dart';

class HomeGridCard extends StatelessWidget {
  final bool isLoading;
  final String id;
  final String? image;
  final String name;
  final num value;
  final num rating;
  const HomeGridCard(
      {super.key,
      required this.isLoading,
      required this.id,
      this.image,
      required this.name,
      required this.value,
      required this.rating});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isLoading
          ? null
          : () => Navigator.pushNamed(context, AppRoutes.productScreen,
              arguments: {"id": id}),
      child: Card(
        color: AppColors.beige100,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                if (image != null)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Center(
                        child: Image.asset(
                          image!,
                          height: 110,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadiusDirectional.only(
                        bottomEnd: Radius.circular(15),
                        bottomStart: Radius.circular(15)),
                    color: AppColors.white,
                  ),
                  padding: const EdgeInsets.only(
                      left: 10, right: 10, top: 5, bottom: 5),
                  child: Center(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: Text(
                                isLoading
                                    ? '*******'
                                    : '${name.split(' ').firstOrNull ?? ''} ',
                                style: AppTextStyle.roboto
                                    .copyWith(fontWeight: FontWeight.bold))),
                        Text(isLoading ? '\$**.**' : '\$$value',
                            style: AppTextStyle.roboto
                                .copyWith(color: AppColors.black)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: 8,
              right: 8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Icon(Icons.star, color: Colors.orange, size: 14),
                  const SizedBox(width: 3),
                  Text(rating.toString(),
                      style: AppTextStyle.poppins
                          .copyWith(fontSize: 12, fontWeight: FontWeight.w600)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

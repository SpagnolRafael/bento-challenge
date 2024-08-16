import 'package:bento_challenge/models/dto/category_dto.dart';
import 'package:bento_challenge/screens/product/components/seal_card.dart';
import 'package:bento_challenge/shareds/skeleton.dart';
import 'package:bento_challenge/utils/app_colors.dart';
import 'package:flutter/material.dart';

class SealComponent extends StatelessWidget {
  final bool isLoading;
  final List<CategoryDto> categories;
  const SealComponent(
      {super.key, required this.isLoading, required this.categories});

  @override
  Widget build(BuildContext context) {
    return AppSkeleton(
      isLoading: isLoading,
      child: Container(
        height: 95,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColors.grey100,
        ),
        child: Center(
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: categories
                  .map((e) => SealCard(title: e.name, icon: e.image))
                  .toList()),
        ),
      ),
    );
  }
}

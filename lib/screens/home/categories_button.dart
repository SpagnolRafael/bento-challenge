import 'package:bento_challenge/models/dto/category_dto.dart';
import 'package:bento_challenge/screens/home/category_card.dart';
import 'package:bento_challenge/shareds/skeleton.dart';
import 'package:bento_challenge/utils/app_colors.dart';
import 'package:bento_challenge/utils/app_textstyle.dart';
import 'package:flutter/material.dart';

class CategoriesButton extends StatelessWidget {
  final String? selected;
  final bool isLoading;
  final List<CategoryDto> categories;
  final void Function(CategoryDto category) onFilterChange;
  const CategoriesButton(
      {super.key,
      this.selected,
      required this.categories,
      required this.isLoading,
      required this.onFilterChange});

  @override
  Widget build(BuildContext context) {
    final items = isLoading
        ? List.generate(
            5,
            (index) =>
                CategoryDto(name: '******', image: 'assets/icons/milk.png'))
        : categories;

    return AppSkeleton(
      isLoading: isLoading,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Shop by category',
              style: AppTextStyle.poppins.copyWith(
                  color: AppColors.blue800,
                  fontWeight: FontWeight.w900,
                  fontSize: 16)),
          const SizedBox(height: 15),
          SizedBox(
            height: 110,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: items.length,
              separatorBuilder: (context, index) => const SizedBox(width: 10),
              itemBuilder: (context, index) {
                return CategoryCard(
                  onTap: () => onFilterChange(items[index]),
                  title: items[index].name,
                  icon: items[index].image,
                  isSelected: selected == items[index].name,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

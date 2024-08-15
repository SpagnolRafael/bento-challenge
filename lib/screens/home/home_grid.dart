import 'package:bento_challenge/models/dto/recommendation_dto.dart';
import 'package:bento_challenge/screens/home/home_grid_card.dart';
import 'package:bento_challenge/shareds/app_error_widget.dart';
import 'package:bento_challenge/shareds/skeleton.dart';
import 'package:bento_challenge/utils/app_colors.dart';
import 'package:bento_challenge/utils/app_grid_delegate.dart';
import 'package:bento_challenge/utils/app_textstyle.dart';
import 'package:flutter/material.dart';

class HomeGrid extends StatefulWidget {
  final List<RecommendationDto> recommendations;
  final bool isLoading;
  final void Function()? onError;
  const HomeGrid(
      {super.key,
      required this.recommendations,
      required this.isLoading,
      required this.onError});

  @override
  State<HomeGrid> createState() => _HomeGridState();
}

class _HomeGridState extends State<HomeGrid> {
  @override
  Widget build(BuildContext context) {
    final items = widget.isLoading
        ? List.generate(
            4,
            (index) => RecommendationDto(
                id: '',
                name: '*****',
                rating: 0,
                value: 0,
                image: "assets/icons/milk.png"))
        : widget.recommendations;

    return AppSkeleton(
      isLoading: widget.isLoading,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'Today\'s Special',
                  style: AppTextStyle.poppins.copyWith(
                    color: AppColors.blue800,
                    fontWeight: FontWeight.w900,
                    fontSize: 16,
                  ),
                ),
              ),
              Text('See all',
                  style: AppTextStyle.roboto.copyWith(
                      color: AppColors.primary, fontWeight: FontWeight.bold))
            ],
          ),
          const SizedBox(height: 15),
          if (widget.onError != null)
            Center(child: AppErrorWidget(onTryAgain: widget.onError))
          else
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: GridView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: FixedHeightSliverGridDelegate(
                  crossAxisCount: 2,
                  itemHeight: 188,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return HomeGridCard(
                    isLoading: widget.isLoading,
                    id: items[index].id,
                    name: items[index].name,
                    image: items[index].image,
                    rating: items[index].rating,
                    value: items[index].value,
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}

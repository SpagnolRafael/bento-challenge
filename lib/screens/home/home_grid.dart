import 'package:bento_challenge/models/dto/recommendation_dto.dart';
import 'package:bento_challenge/shareds/skeleton.dart';
import 'package:bento_challenge/utils/app_colors.dart';
import 'package:bento_challenge/utils/app_grid_delegate.dart';
import 'package:bento_challenge/utils/app_routes.dart';
import 'package:bento_challenge/utils/app_textstyle.dart';
import 'package:flutter/material.dart';

class HomeGrid extends StatefulWidget {
  final List<RecommendationDto> recommendations;
  final bool isLoading;
  const HomeGrid(
      {super.key, required this.recommendations, required this.isLoading});

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
                    color: AppColors.blue900,
                    fontWeight: FontWeight.w900,
                    fontSize: 16,
                  ),
                ),
              ),
              Text('See all',
                  style: AppTextStyle.roboto.copyWith(color: AppColors.primary))
            ],
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: GridView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: FixedHeightSliverGridDelegate(
                crossAxisCount: 2,
                itemHeight: 220,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: items.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: widget.isLoading
                      ? null
                      : () => Navigator.pushNamed(
                          context, AppRoutes.productScreen,
                          arguments: {"id": items[index].name}),
                  child: Card(
                    color: AppColors.beige100,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Stack(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            if (items[index].image != null)
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Image.asset(
                                    items[index].image!,
                                    width: double.infinity,
                                  ),
                                ),
                              ),
                            Text(widget.isLoading
                                ? '******* \$**.**'
                                : '${items[index].name} \$${items[index].value}'),
                          ],
                        ),
                        Positioned(
                          top: 8,
                          right: 8,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                items[index].rating.toString(),
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Icon(
                                Icons.star,
                                color: Colors.orange,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

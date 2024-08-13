import 'dart:async';

import 'package:bento_challenge/models/dto/banner_dto.dart';
import 'package:bento_challenge/shareds/carrousel_index.dart';
import 'package:bento_challenge/utils/app_colors.dart';
import 'package:flutter/material.dart';

class BannerCarrousel extends StatefulWidget {
  final List<BannerDto> banners;
  final double? height;
  const BannerCarrousel({super.key, required this.banners, this.height});

  @override
  State<BannerCarrousel> createState() => _BannerCarrouselState();
}

class _BannerCarrouselState extends State<BannerCarrousel> {
  late PageController controller;
  late Timer _timer;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    controller = PageController(initialPage: 0);
    if (widget.banners.isNotEmpty) {
      _timer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
        if (currentIndex < widget.banners.length - 1) {
          currentIndex++;
        } else {
          currentIndex = 0;
        }

        controller.animateToPage(
          currentIndex,
          duration: const Duration(milliseconds: 500),
          curve: Curves.linear,
        );
        setState(() {});
      });
    }
  }

  @override
  void dispose() {
    if (widget.banners.isNotEmpty) _timer.cancel();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.banners.isEmpty) {
      return Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.grey,
              borderRadius: BorderRadius.circular(10),
            ),
            width: double.infinity,
            height: widget.height ?? 200,
          ),
          const SizedBox(height: 10),
          const CarrouselIndex(lenght: 1, current: 0),
        ],
      );
    }
    return Column(
      children: [
        SizedBox(
          height: widget.height ?? 160,
          child: PageView.builder(
            controller: controller,
            itemCount: widget.banners.length,
            onPageChanged: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  widget.banners[index].url,
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 10),
        CarrouselIndex(
          lenght: widget.banners.length,
          current: currentIndex,
        ),
      ],
    );
  }
}

import 'package:bento_challenge/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CarrouselIndex extends StatefulWidget {
  final int lenght;
  final int current;

  const CarrouselIndex(
      {super.key, required this.lenght, required this.current});

  @override
  State<CarrouselIndex> createState() => _CarrouselIndexState();
}

class _CarrouselIndexState extends State<CarrouselIndex> {
  late final ScrollController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) => _controller.animateTo(
        widget.current * 8,
        duration: const Duration(milliseconds: 300),
        curve: Curves.linear));
    return Center(
      child: SizedBox(
        height: 6,
        width: 48,
        child: ListView.separated(
          controller: _controller,
          physics: const ClampingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            bool isCurrent = widget.current == index;
            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.linear,
              height: 8,
              width: isCurrent ? 22 : 6,
              decoration: BoxDecoration(
                borderRadius: isCurrent
                    ? BorderRadius.circular(2)
                    : BorderRadius.circular(100),
                color: isCurrent
                    ? AppColors.primary
                    : AppColors.grey800.withOpacity(.1),
              ),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(width: 2),
          itemCount: widget.lenght,
        ),
      ),
    );
  }
}

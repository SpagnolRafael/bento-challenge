import 'package:bento_challenge/screens/product/components/animated_favorite/favorite_bloc.dart';
import 'package:bento_challenge/screens/product/components/animated_favorite/favorite_event.dart';
import 'package:bento_challenge/screens/product/components/animated_favorite/favorite_state.dart';
import 'package:bento_challenge/shareds/app_snackbar.dart';
import 'package:bento_challenge/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class AnimatedFavoriteIcon extends StatefulWidget {
  final String? productId;
  const AnimatedFavoriteIcon({super.key, this.productId});

  @override
  State<AnimatedFavoriteIcon> createState() => _AnimatedFavoriteIconState();
}

class _AnimatedFavoriteIconState extends State<AnimatedFavoriteIcon>
    with TickerProviderStateMixin {
  final bloc = GetIt.I.get<FavoriteBloc>();
  late AnimationController _controller;
  late Animation<double> _animation;
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    if (widget.productId != null) {
      bloc.add(
          UpdateFavoriteStatusEvent(firstLoading: true, id: widget.productId!));
    }
    _controller = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);

    _animation = Tween<double>(begin: 1.0, end: 1.6)
        .chain(CurveTween(curve: Curves.easeInOutCubic))
        .animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: widget.productId == null
            ? null
            : () => bloc.add(UpdateFavoriteStatusEvent(id: widget.productId!)),
        child: BlocConsumer<FavoriteBloc, FavoriteState>(
          bloc: bloc,
          listener: (context, state) {
            if (state is FavoriteStatusSuccess) {
              isFavorite = state.isFavorite;
            }
            if (state is UpdateFavoriteStatusLoading) {
              _controller
                  .forward()
                  .then((_) async => await _controller.reverse());
            }
            if (state is FavoriteStatusError) {
              AppSnackbar.show(
                  context: context,
                  type: SnackType.error,
                  content: const Text(
                      'An error occurred trying to set this product as favorite!'));
            }
          },
          builder: (context, state) {
            return state is FavoriteStatusLoading
                ? Transform.scale(
                    scale: .5,
                    child: const SizedBox(
                        height: 16,
                        width: 16,
                        child: CircularProgressIndicator(strokeWidth: 1)))
                : ScaleTransition(
                    scale: _animation,
                    child: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: isFavorite ? AppColors.redLogo : AppColors.black,
                      size: 16,
                    ),
                  );
          },
        ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

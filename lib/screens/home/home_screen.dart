import 'package:bento_challenge/models/dto/home_dto.dart';
import 'package:bento_challenge/models/dto/recommendation_dto.dart';
import 'package:bento_challenge/screens/home/action_card.dart';
import 'package:bento_challenge/screens/home/categories_button.dart';
import 'package:bento_challenge/screens/home/home_bloc.dart';
import 'package:bento_challenge/screens/home/home_event.dart';
import 'package:bento_challenge/screens/home/home_grid.dart';
import 'package:bento_challenge/screens/home/home_state.dart';
import 'package:bento_challenge/services/app_tutorial.dart';
import 'package:bento_challenge/shareds/app_error_widget.dart';
import 'package:bento_challenge/shareds/app_scaffold.dart';
import 'package:bento_challenge/shareds/app_snackbar.dart';
import 'package:bento_challenge/shareds/banner_carrousel.dart';
import 'package:bento_challenge/shareds/skeleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class HomeScreen extends StatefulWidget {
  final ScrollController controller;
  const HomeScreen({super.key, required this.controller});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _selectedCategory = '';
  final bloc = GetIt.I.get<HomeBloc>();
  HomeDto? data;
  void Function()? _onTryAgain;
  List<RecommendationDto> _recommendations = [];
  @override
  void initState() {
    super.initState();
    bloc.add(LoadHomeDataEvent());
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      hasAppBar: true,
      body: BlocConsumer<HomeBloc, HomeState>(
        bloc: bloc,
        listener: (context, state) {
          if (state is HomeStateSuccess) {
            data = state.data;
            _recommendations = data?.recommendations ?? [];
            _selectedCategory = '';
            AppTutorial.home(context);
          }
          if (state is HomeStateGridError) {
            _onTryAgain = state.onTryAgain;
            AppSnackbar.show(
                context: context,
                type: SnackType.error,
                content: const Text('An error occurred, try again'));
          }
          if (state is HomeStateError) {
            _onTryAgain = state.onTryAgain;
            AppSnackbar.show(
                context: context,
                type: SnackType.error,
                content: const Text('An error occurred, try again'));
          }

          if (state is HomeStateGridSuccess) {
            _recommendations = state.recommendations;
          }
          if (state is HomeStateGridLoading || state is HomeStateLoading) {
            _onTryAgain = null;
          }
        },
        builder: (context, state) {
          bool isLoading =
              state is HomeStateInitial || state is HomeStateLoading;
          if (state is HomeStateError) {
            return Center(child: AppErrorWidget(onTryAgain: _onTryAgain));
          }
          return SingleChildScrollView(
            controller: widget.controller,
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: AppSkeleton(
                        isLoading: state is HomeStateInitial ||
                            state is HomeStateLoading,
                        child: GestureDetector(
                          onTap: () => AppTutorial.home(context),
                          child: ActionCard(
                            title: 'ORDER\nAGAIN',
                            icon: Image.asset('assets/images/food-bag.png',
                                height: 60),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: AppSkeleton(
                        isLoading: state is HomeStateInitial ||
                            state is HomeStateLoading,
                        child: ActionCard(
                          title: 'LOCAL\nSHOP',
                          icon: Image.asset('assets/images/store.png',
                              height: 60),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                AppSkeleton(
                  isLoading: isLoading,
                  key: AppTutorial.gKeyHomeBanner,
                  child: BannerCarrousel(
                    banners: data?.banners ?? [],
                  ),
                ),
                const SizedBox(height: 20),
                CategoriesButton(
                    key: AppTutorial.gKeyHomeCategories,
                    onFilterChange: (category) {
                      _selectedCategory = category.name;
                      bloc.add(UpdateRecommendationsHomeEvent(
                          category: category.name));
                    },
                    selected: _selectedCategory,
                    categories: data?.categories ?? [],
                    isLoading: isLoading),
                const SizedBox(height: 20),
                HomeGrid(
                  key: AppTutorial.gKeyHomeProduct,
                  onError: isLoading ? null : _onTryAgain,
                  isLoading: isLoading || state is HomeStateGridLoading,
                  recommendations: _recommendations,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

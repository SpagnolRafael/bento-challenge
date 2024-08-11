import 'package:bento_challenge/models/dto/home_dto.dart';
import 'package:bento_challenge/screens/home/action_card.dart';
import 'package:bento_challenge/screens/home/categories_button.dart';
import 'package:bento_challenge/screens/home/home_bloc.dart';
import 'package:bento_challenge/screens/home/home_event.dart';
import 'package:bento_challenge/screens/home/home_grid.dart';
import 'package:bento_challenge/screens/home/home_state.dart';
import 'package:bento_challenge/shareds/app_scaffold.dart';
import 'package:bento_challenge/shareds/banner_carrousel.dart';
import 'package:bento_challenge/shareds/skeleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _selectedCategory = '';
  final bloc = GetIt.I.get<HomeBloc>();
  HomeDto? data;
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
            _selectedCategory = '';
          }
        },
        builder: (context, state) {
          bool isLoading =
              state is HomeStateInitial || state is HomeStateLoading;
          return SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: AppSkeleton(
                        isLoading: state is HomeStateInitial ||
                            state is HomeStateLoading,
                        child: ActionCard(
                          title: 'ORDER\nAGAIN',
                          icon: Image.asset('assets/images/food-bag.png',
                              height: 60),
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
                const SizedBox(height: 15),
                AppSkeleton(
                  isLoading: isLoading,
                  child: BannerCarrousel(banners: data?.banners ?? []),
                ),
                const SizedBox(height: 20),
                CategoriesButton(
                    selected: _selectedCategory,
                    categories: data?.categories ?? [],
                    isLoading: isLoading),
                const SizedBox(height: 20),
                HomeGrid(
                    isLoading: isLoading,
                    recommendations: data?.recommendations ?? []),
              ],
            ),
          );
        },
      ),
    );
  }
}

import 'package:bento_challenge/models/dto/home_dto.dart';
import 'package:bento_challenge/models/dto/recommendation_dto.dart';

class HomeState {
  factory HomeState.initial() => HomeStateInitial();
  factory HomeState.loading() => HomeStateLoading();
  factory HomeState.gridLoading() => HomeStateGridLoading();
  factory HomeState.gridSuccess(
          {required List<RecommendationDto> recommendations}) =>
      HomeStateGridSuccess(recommendations: recommendations);
  factory HomeState.success({required HomeDto data}) =>
      HomeStateSuccess(data: data);
  factory HomeState.error({required void Function() onTryAgain}) =>
      HomeStateError(onTryAgain: onTryAgain);
  factory HomeState.gridError({required void Function() onTryAgain}) =>
      HomeStateGridError(onTryAgain: onTryAgain);
}

class HomeStateInitial implements HomeState {}

class HomeStateLoading implements HomeState {}

class HomeStateGridLoading implements HomeState {}

class HomeStateGridError implements HomeState {
  final void Function() onTryAgain;
  HomeStateGridError({required this.onTryAgain});
}

class HomeStateGridSuccess implements HomeState {
  final List<RecommendationDto> recommendations;
  HomeStateGridSuccess({required this.recommendations});
}

class HomeStateSuccess implements HomeState {
  final HomeDto data;
  HomeStateSuccess({required this.data});
}

class HomeStateError implements HomeState {
  final void Function() onTryAgain;
  HomeStateError({required this.onTryAgain});
}

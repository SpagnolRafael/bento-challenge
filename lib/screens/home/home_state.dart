import 'package:bento_challenge/models/dto/home_dto.dart';

class HomeState {
  factory HomeState.initial() => HomeStateInitial();
  factory HomeState.loading() => HomeStateLoading();
  factory HomeState.success({required HomeDto data}) =>
      HomeStateSuccess(data: data);
  factory HomeState.error({required void Function() onTryAgain}) =>
      HomeStateError(onTryAgain: onTryAgain);
}

class HomeStateInitial implements HomeState {}

class HomeStateLoading implements HomeState {}

class HomeStateSuccess implements HomeState {
  final HomeDto data;
  HomeStateSuccess({required this.data});
}

class HomeStateError implements HomeState {
  final void Function() onTryAgain;
  HomeStateError({required this.onTryAgain});
}

import 'package:bento_challenge/data/repository/product_repository.dart';
import 'package:bento_challenge/screens/product/components/favorite_state.dart';
import 'package:bento_challenge/screens/product/favorite_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final ProductRepository _repository;
  FavoriteBloc(this._repository) : super(FavoriteState.favoriteLoading()) {
    on<UpdateFavoriteStatusEvent>(
        (event, emit) => _updateFavoriteStatus(event, emit));
  }
  Future<void> _updateFavoriteStatus(
      UpdateFavoriteStatusEvent event, Emitter<FavoriteState> emit) async {
    try {
      if (!event.firstLoading) emit(FavoriteState.updateFavoriteLoading());
      final isFavorite = await _repository.isFavorite(
          id: event.id, firstLoading: event.firstLoading);
      emit(FavoriteState.favoriteSuccess(isFavorite: isFavorite));
    } catch (e) {
      emit(FavoriteState.favoriteError());
    }
  }
}

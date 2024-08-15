class FavoriteState {
  factory FavoriteState.favoriteLoading() => FavoriteStatusLoading();
  factory FavoriteState.favoriteError() => FavoriteStatusError();
  factory FavoriteState.updateFavoriteLoading() =>
      UpdateFavoriteStatusLoading();
  factory FavoriteState.favoriteSuccess({required bool isFavorite}) =>
      FavoriteStatusSuccess(isFavorite: isFavorite);
}

class FavoriteStatusLoading implements FavoriteState {}

class FavoriteStatusError implements FavoriteState {}

class UpdateFavoriteStatusLoading implements FavoriteState {}

class FavoriteStatusSuccess implements FavoriteState {
  final bool isFavorite;
  FavoriteStatusSuccess({required this.isFavorite});
}

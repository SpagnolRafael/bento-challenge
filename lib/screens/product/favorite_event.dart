class FavoriteEvent {}

class UpdateFavoriteStatusEvent implements FavoriteEvent {
  final String id;
  final bool firstLoading;
  UpdateFavoriteStatusEvent({this.firstLoading = false, required this.id});
}

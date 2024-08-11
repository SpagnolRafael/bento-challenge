class HomeEvent {}

class LoadHomeDataEvent implements HomeEvent {
  final String? category;
  LoadHomeDataEvent({this.category});
}

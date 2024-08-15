class HomeEvent {}

class LoadHomeDataEvent implements HomeEvent {}

class UpdateRecommendationsHomeEvent implements HomeEvent {
  final String category;
  UpdateRecommendationsHomeEvent({required this.category});
}

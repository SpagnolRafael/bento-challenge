import 'package:bento_challenge/data/repository/home_repository.dart';
import 'package:bento_challenge/screens/home/home_event.dart';
import 'package:bento_challenge/screens/home/home_state.dart';
import 'package:bloc/bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository _repository;
  HomeBloc(this._repository) : super(HomeState.initial()) {
    on<LoadHomeDataEvent>((event, emit) => _loadHomeData(event, emit));
    on<UpdateRecommendationsHomeEvent>(
        (event, emit) => _updateGridRecommendations(event, emit));
  }

  HomeEvent? previousEvent;

  @override
  void onEvent(HomeEvent event) {
    previousEvent = event;
    super.onEvent(event);
  }

  void retry() {
    if (previousEvent != null) {
      add(previousEvent!);
    }
  }

  Future<void> _updateGridRecommendations(
      UpdateRecommendationsHomeEvent event, Emitter<HomeState> emit) async {
    try {
      emit(HomeState.gridLoading());
      final recommendations = await _repository.getHomeRecommendationsData(
          category: event.category);
      emit(HomeState.gridSuccess(recommendations: recommendations));
    } catch (error) {
      emit(HomeState.gridError(onTryAgain: retry));
    }
  }

  Future<void> _loadHomeData(
      LoadHomeDataEvent event, Emitter<HomeState> emit) async {
    try {
      emit(HomeState.loading());
      final data = await _repository.getHomeData();
      emit(HomeState.success(data: data));
    } catch (error) {
      emit(HomeState.error(onTryAgain: retry));
    }
  }
}

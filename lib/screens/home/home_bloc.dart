import 'package:bento_challenge/data/repository/home_repository.dart';
import 'package:bento_challenge/screens/home/home_event.dart';
import 'package:bento_challenge/screens/home/home_state.dart';
import 'package:bloc/bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository _repository;
  HomeBloc(this._repository) : super(HomeState.initial()) {
    on<LoadHomeDataEvent>((event, emit) => _loadHomeData(event, emit));
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

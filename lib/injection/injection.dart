import 'package:bento_challenge/data/repository/home_repository.dart';
import 'package:bento_challenge/screens/home/home_bloc.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  _repositoryInitialize();
  _blocInitialize();
}

void _repositoryInitialize() {
  getIt.registerSingleton<HomeRepository>(HomeRepository());
  // getIt.registerFactory<FirebaseStorageRepository>(() => FirebaseStorageRepository(getIt(), getIt()));
}

void _blocInitialize() {
  getIt.registerSingleton<HomeBloc>(HomeBloc(getIt()));
}

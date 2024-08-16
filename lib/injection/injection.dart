import 'package:bento_challenge/data/repository/home_repository.dart';
import 'package:bento_challenge/data/repository/product_repository.dart';
import 'package:bento_challenge/screens/home/home_bloc.dart';
import 'package:bento_challenge/screens/product/components/animated_favorite/favorite_bloc.dart';
import 'package:bento_challenge/screens/product/product_bloc.dart';
import 'package:bento_challenge/services/shared_preferences_service.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  await _servicesInitialize();
  _repositoryInitialize();
  _blocInitialize();
}

void _repositoryInitialize() {
  getIt.registerSingleton<HomeRepository>(HomeRepository());
  getIt.registerSingleton<ProductRepository>(ProductRepository(getIt()));
}

void _blocInitialize() {
  getIt.registerSingleton<HomeBloc>(HomeBloc(getIt()));
  getIt.registerSingleton<ProductBloc>(ProductBloc(getIt()));
  getIt.registerFactory<FavoriteBloc>(() => FavoriteBloc(getIt()));
}

Future<void> _servicesInitialize() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  getIt.registerSingleton<Storage>(Preferences(preferences));
}

import 'package:bento_challenge/data/repository/product_repository.dart';
import 'package:bento_challenge/screens/product/product_event.dart';
import 'package:bento_challenge/screens/product/product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository _repository;
  ProductBloc(this._repository) : super(ProductState.initial()) {
    on<GetProductEvent>((event, emit) => _getProduct(event, emit));
  }
  ProductEvent? previousEvent;

  @override
  void onEvent(ProductEvent event) {
    previousEvent = event;
    super.onEvent(event);
  }

  void retry() {
    if (previousEvent != null) {
      add(previousEvent!);
    }
  }

  Future<void> _getProduct(
      GetProductEvent event, Emitter<ProductState> emit) async {
    try {
      emit(ProductState.loading());
      final product = await _repository.getProductData(id: event.id);
      emit(ProductState.success(product: product));
    } catch (e) {
      emit(ProductState.error(onTryAgain: retry));
    }
  }
}

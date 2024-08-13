import 'package:bento_challenge/models/dto/product_dto.dart';

class ProductState {
  factory ProductState.initial() => ProductStateInitial();
  factory ProductState.loading() => ProductStateLoading();
  factory ProductState.success({required ProductDto product}) =>
      ProductStateSuccess(product: product);
  factory ProductState.error({required void Function() onTryAgain}) =>
      ProductStateError(onTryAgain: onTryAgain);
}

class ProductStateInitial implements ProductState {}

class ProductStateLoading implements ProductState {}

class ProductStateSuccess implements ProductState {
  final ProductDto product;
  ProductStateSuccess({required this.product});
}

class ProductStateError implements ProductState {
  final void Function() onTryAgain;
  ProductStateError({required this.onTryAgain});
}

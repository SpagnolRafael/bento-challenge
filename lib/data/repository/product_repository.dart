import 'dart:convert';

import 'package:bento_challenge/data/mock/product_data.dart';
import 'package:bento_challenge/models/dto/product_dto.dart';
import 'package:bento_challenge/services/shared_preferences_service.dart';

class ProductRepository {
  final Storage _prefs;
  ProductRepository(this._prefs);
  Future<ProductDto> getProductData({required String id}) async {
    await Future.delayed(const Duration(seconds: 2));
    final response = json.decode(ProductData.json(id));
    return ProductDto.fromMap(response);
  }

  Future<bool> isFavorite(
      {required String id, required bool firstLoading}) async {
    bool? isFavorite = await _prefs.get(key: id, type: bool);
    isFavorite ??= false;
    if (firstLoading) return isFavorite;
    await _prefs.post(key: id, data: !isFavorite);
    return !isFavorite;
  }
}

import 'dart:convert';

import 'package:bento_challenge/data/mock/product_data.dart';
import 'package:bento_challenge/models/dto/product_dto.dart';

class ProductRepository {
  Future<ProductDto> getProductData({required String id}) async {
    await Future.delayed(const Duration(seconds: 2));
    final response = json.decode(ProductData.json(id));
    return ProductDto.fromMap(response);
  }
}

import 'dart:convert';

import 'package:bento_challenge/models/dto/category_dto.dart';
import 'package:flutter/foundation.dart';

class ProductDto {
  final String id;
  final List<String>? images;
  final String name;
  final num value;
  final num? discount;
  final num? rating;
  final List<CategoryDto> categories;
  final String? description;
  final String shop;
  ProductDto({
    required this.id,
    this.images,
    required this.name,
    required this.value,
    this.discount,
    this.rating,
    required this.categories,
    this.description,
    required this.shop,
  });

  ProductDto copyWith({
    String? id,
    List<String>? images,
    String? name,
    num? value,
    num? discount,
    num? rating,
    List<CategoryDto>? categories,
    String? description,
    String? shop,
  }) {
    return ProductDto(
      id: id ?? this.id,
      images: images ?? this.images,
      name: name ?? this.name,
      value: value ?? this.value,
      discount: discount ?? this.discount,
      rating: rating ?? this.rating,
      categories: categories ?? this.categories,
      description: description ?? this.description,
      shop: shop ?? this.shop,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'images': images,
      'name': name,
      'value': value,
      'discount': discount,
      'rating': rating,
      'categories': categories.map((x) => x.toMap()).toList(),
      'description': description,
      'shop': shop,
    };
  }

  factory ProductDto.fromMap(Map<String, dynamic> map) {
    return ProductDto(
      id: map['id'] as String,
      images: map['images'] != null
          ? List<String>.from(
              (map['images'] as List<dynamic>).map((e) => e.toString()))
          : null,
      name: map['name'] as String,
      value: map['value'] as num,
      discount: map['discount'] != null ? map['discount'] as num : null,
      rating: map['rating'] != null ? map['rating'] as num : null,
      categories: List<CategoryDto>.from(
        (map['categories'] as List<dynamic>).map<CategoryDto>(
          (x) => CategoryDto.fromMap(x as Map<String, dynamic>),
        ),
      ),
      description:
          map['description'] != null ? map['description'] as String : null,
      shop: map['shop'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductDto.fromJson(String source) =>
      ProductDto.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProductDto(id: $id, images: $images, name: $name, value: $value, discount: $discount, rating: $rating, categories: $categories, description: $description, shop: $shop)';
  }

  @override
  bool operator ==(covariant ProductDto other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        listEquals(other.images, images) &&
        other.name == name &&
        other.value == value &&
        other.discount == discount &&
        other.rating == rating &&
        listEquals(other.categories, categories) &&
        other.description == description &&
        other.shop == shop;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        images.hashCode ^
        name.hashCode ^
        value.hashCode ^
        discount.hashCode ^
        rating.hashCode ^
        categories.hashCode ^
        description.hashCode ^
        shop.hashCode;
  }
}

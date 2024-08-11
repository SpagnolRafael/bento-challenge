import 'dart:convert';

import 'package:bento_challenge/models/dto/banner_dto.dart';
import 'package:bento_challenge/models/dto/category_dto.dart';
import 'package:bento_challenge/models/dto/recommendation_dto.dart';
import 'package:flutter/foundation.dart';

class HomeDto {
  final List<BannerDto> banners;
  final List<CategoryDto> categories;
  final String defaultCategory;
  final List<RecommendationDto> recommendations;
  HomeDto({
    required this.banners,
    required this.categories,
    required this.defaultCategory,
    required this.recommendations,
  });

  HomeDto copyWith({
    List<BannerDto>? banners,
    List<CategoryDto>? categories,
    String? defaultCategory,
    List<RecommendationDto>? recommendations,
  }) {
    return HomeDto(
      banners: banners ?? this.banners,
      categories: categories ?? this.categories,
      defaultCategory: defaultCategory ?? this.defaultCategory,
      recommendations: recommendations ?? this.recommendations,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'banners': banners.map((x) => x.toMap()).toList(),
      'categories': categories.map((x) => x.toMap()).toList(),
      'default_category': defaultCategory,
      'recommendations': recommendations.map((x) => x.toMap()).toList(),
    };
  }

  factory HomeDto.fromMap(Map<String, dynamic> map) {
    return HomeDto(
      banners: List<BannerDto>.from(
        (map['banners'] as List<dynamic>).map<BannerDto>(
          (x) => BannerDto.fromMap(x as Map<String, dynamic>),
        ),
      ),
      categories: List<CategoryDto>.from(
        (map['categories'] as List<dynamic>).map<CategoryDto>(
          (x) => CategoryDto.fromMap(x as Map<String, dynamic>),
        ),
      ),
      defaultCategory: map['default_category'] as String,
      recommendations: List<RecommendationDto>.from(
        (map['recommendations'] as List<dynamic>).map<RecommendationDto>(
          (x) => RecommendationDto.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory HomeDto.fromJson(String source) =>
      HomeDto.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'HomeDto(banners: $banners, categories: $categories, defaultCategory: $defaultCategory, recommendations: $recommendations)';
  }

  @override
  bool operator ==(covariant HomeDto other) {
    if (identical(this, other)) return true;

    return listEquals(other.banners, banners) &&
        listEquals(other.categories, categories) &&
        other.defaultCategory == defaultCategory &&
        listEquals(other.recommendations, recommendations);
  }

  @override
  int get hashCode {
    return banners.hashCode ^
        categories.hashCode ^
        defaultCategory.hashCode ^
        recommendations.hashCode;
  }
}

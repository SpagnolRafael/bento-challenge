import 'dart:convert';

import 'package:bento_challenge/data/mock/home_data.dart';
import 'package:bento_challenge/models/dto/home_dto.dart';
import 'package:bento_challenge/models/dto/recommendation_dto.dart';

class HomeRepository {
  Future<HomeDto> getHomeData() async {
    await Future.delayed(const Duration(seconds: 2));
    final response = json.decode(HomeData.json());
    return HomeDto.fromMap(response);
  }

  Future<List<RecommendationDto>> getHomeRecommendationsData(
      {required String category}) async {
    await Future.delayed(const Duration(seconds: 2));
    final response = json.decode(HomeData.json(category: category));
    return List.from(response)
        .map((e) => RecommendationDto.fromMap(e))
        .toList();
  }
}

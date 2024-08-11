import 'dart:convert';

import 'package:bento_challenge/data/mock/home_banner_data.dart';
import 'package:bento_challenge/models/dto/home_dto.dart';

class HomeRepository {
  Future<HomeDto> getHomeData() async {
    await Future.delayed(const Duration(seconds: 2));
    final response = json.decode(HomeBannerData.json);
    return HomeDto.fromMap(response);
  }
}

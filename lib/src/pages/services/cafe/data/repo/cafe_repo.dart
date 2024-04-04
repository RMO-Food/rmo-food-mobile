import 'dart:convert';

import 'package:rmo_food/infrastructure/endpoints.dart';
import 'package:rmo_food/infrastructure/repository/http_api_repo_impl.dart';
import 'package:rmo_food/src/pages/services/cafe/data/model/cafe.dart';

abstract class CafeRepository {
  Future<CafeModel?> fetchCafeList();
}

class CafeRepositoryImpl implements CafeRepository {
  final HttpApiRepoImpl _httpApiRepoImpl = HttpApiRepoImpl();
  @override
  Future<CafeModel?> fetchCafeList({int? limit = 0, int? offset = 0}) async {
    try {
      final response = await _httpApiRepoImpl.fetchApiRepo(
          query: {"limit": limit.toString(), "offset": offset.toString()},
          path: URLConst.CAFE_LIST);
      Map<String, dynamic> responseBody = jsonDecode(response);
      CafeModel cafeModel = CafeModel.fromJson(responseBody);
      return cafeModel;
    } catch (e) {
      return null;
    }
  }
}

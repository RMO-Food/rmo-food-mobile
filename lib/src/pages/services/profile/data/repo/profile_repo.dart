import 'dart:convert';

import 'package:rmo_food/infrastructure/endpoints.dart';
import 'package:rmo_food/infrastructure/repository/http_api_repo_impl.dart';
import 'package:rmo_food/src/pages/services/profile/data/model/profile.dart';

abstract class ProfileRepo {
  Future<dynamic> fetchProfile();
}

class ProfileRepImpl implements ProfileRepo {
  final HttpApiRepoImpl _httpApiRepoImpl = HttpApiRepoImpl();
  @override
  Future<dynamic> fetchProfile() async {
    try {
      final response =
          await _httpApiRepoImpl.fetchApiRepo(path: URLConst.PROFILE);
      ProfileData profileData =
          ProfileData.fromJson(jsonDecode(response)['data']);
      return profileData;
    } on String catch (e) {
      throw e.toString();
    } catch (e) {
      throw e.toString();
    }
  }
}

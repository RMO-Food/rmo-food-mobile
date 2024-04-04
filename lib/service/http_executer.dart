import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rmo_food/bloc/authentication/authentication_cubit.dart';
import 'package:rmo_food/config/routes_generate.dart';
import 'package:rmo_food/constants.dart';
import 'package:rmo_food/core/dependencies/shared_pref.dart';
import 'package:rmo_food/infrastructure/data/http_execute_dto.dart';
import 'package:rmo_food/infrastructure/endpoints.dart';
import 'package:rmo_food/infrastructure/model/login_token.dart';
import 'package:rmo_food/infrastructure/model/user.dart';
import 'package:rmo_food/infrastructure/response/error.dart';
import 'package:rmo_food/service/i_server.dart';

class HttpExecuter {
  static IServerStrategy? _iServerStrategy;
  static late HttpClient _client;
  int retryCount = 0;

  HttpExecuter() {
    _client = HttpClient();
    // _client.badCertificateCallback =
    //     ((X509Certificate cert, String host, int port) => true);
    _client.connectionTimeout = const Duration(seconds: 10);
  }

  static void init(IServerStrategy iServerStrategy) {
    _iServerStrategy = iServerStrategy;
  }

  Future<bool> refreshToken() async {
    try {
      final Uri finalUrl =
          Uri.http(_iServerStrategy!.url, URLConst.REFRESH_TOKEN);
      final HttpClientRequest request = await _client
          .openUrl("POST", finalUrl)
          .timeout(_client.connectionTimeout!)
        ..headers.contentType = ContentType.json;
      final data =
          LoginToken.fromJson(jsonDecode(SharedPref.getToken!)).refreshToken;
      request.write(jsonEncode({"refresh": data}));
      final HttpClientResponse response = await request.close();

      if (response.statusCode != 200) return false;

      final responseBody = await response.transform(utf8.decoder).join();
      Map<String, dynamic> verifiedToken = jsonDecode(responseBody);
      verifiedToken.addAll({"refresh": data});
      SharedPref.setToken(jsonEncode(verifiedToken));
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> verifyToken() async {
    try {
      final Uri finalUrl =
          Uri.http(_iServerStrategy!.url, URLConst.VERIFY_TOKEN);
      final HttpClientRequest request = await _client
          .openUrl("POST", finalUrl)
          .timeout(_client.connectionTimeout!)
        ..headers.contentType = ContentType.json;
      final data =
          LoginToken.fromJson(jsonDecode(SharedPref.getToken!)).accessToken;
      request.write(jsonEncode({"token": data}));
      final HttpClientResponse response = await request.close();
      if (response.statusCode == 200) return true;
      return await refreshToken();
    } catch (e) {
      return false;
    }
  }

  Future<dynamic> finalExecution(HttpGetOrPostDataDto httpRequestData) async {
    try {
      final Uri? finalUrl;
      if (httpRequestData.query != null && httpRequestData.query!.isNotEmpty) {
        finalUrl = Uri.http(
            _iServerStrategy!.url, httpRequestData.path, httpRequestData.query);
      } else {
        // final url = Uri.parse(_iServerStrategy!.url);
        finalUrl = Uri.http(_iServerStrategy!.url, httpRequestData.path);
      }
      final HttpClientRequest request = await _client
          .openUrl(httpRequestData.method!, finalUrl)
          .timeout(_client.connectionTimeout!);

      request.headers.contentType = ContentType.json;
      await _setAuthorizationHeader(request);

      if (httpRequestData.data != null && httpRequestData.method != 'GET') {
        request.write(httpRequestData.data);
      }

      final HttpClientResponse response = await request.close();

      final String responseString =
          await response.transform(utf8.decoder).join();
      if (response.statusCode == 401 || response.statusCode == 402) {
        final isRefreshed = await refreshToken();
        if (!isRefreshed) {
          _logOut();
        } else {
          if (retryCount < 3) {
            retryCount += 1;
            return finalExecution(httpRequestData);
          }
        }
      }
      return responseString;
    } on SocketException catch (e) {
      log(e.toString());
      return json.encode(
          {'detail': "Unable to Fetch Service.Please check your internet"});
    } catch (e) {
      log(e.toString());
      return json.encode({'detail': RMOConst.defaultError});
    }
  }

  Future<dynamic> loginExecution(User user) async {
    late final String responseString;
    try {
      final Uri? finalUrl;
      finalUrl = Uri.http(_iServerStrategy!.url, URLConst.LOGIN);
      final HttpClientRequest request =
          await _client.openUrl(URLConst.POST_METHOD, finalUrl);

      request.headers.contentType = ContentType.json;
      request.write(user.toMap());

      final HttpClientResponse response = await request.close();

      responseString = await response.transform(utf8.decoder).join();
      if (response.statusCode != 200) throw responseString;
      SharedPref.setToken(responseString);
      return responseString;
    } on SocketException catch (error) {
      return jsonEncode(
          {'detail': "Unable to Fetch Service.Please check your internet"});
    } catch (e) {
      return ErrorRes.error(jsonDecode(responseString));
    }
  }

  Future _setAuthorizationHeader(HttpClientRequest request,
      {bool? isRefresh = false}) async {
    final LoginToken token;
    final String bearerToken;
    if (SharedPref.getToken != null) {
      token = LoginToken.fromJson(jsonDecode(SharedPref.getToken!));
      bearerToken =
          "Bearer ${isRefresh! ? token.refreshToken : token.accessToken}";
      request.headers.set(RMOConst.AUTHORIZATION, bearerToken);
    }
  }

  _logOut() {
    BlocProvider.of<AuthenticationCubit>(
            GeneratedRoute.navigatorKey.currentContext!)
        .loggedOut();
  }
}

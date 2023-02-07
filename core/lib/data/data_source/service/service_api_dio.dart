import 'dart:async';
import 'package:core/utils/spref_key.dart';
import 'package:core/utils/url.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ServiceApi {
  final Dio _dio = Dio();

  Future get({required String url, Map<String, dynamic>? parameter}) async {
    final response = await _dio
        .get(ApiUrl.baseUrl + url, queryParameters: parameter)
        .timeout(const Duration(minutes: 1));
    return response.data;
  }

  Future postData(
      {required String urlPath,
      required dynamic body,
      Map<String, dynamic>? parameter}) async {
    final Response response = await _dio.post(
      ApiUrl.baseUrl + urlPath,
      data: body,
      queryParameters: parameter,
    );
    return response.data;
  }

  Future put(
      {required String urlPath,
      required dynamic body,
      Map<String, dynamic>? parameter}) async {
    final Response response = await _dio.put(
      ApiUrl.baseUrl + urlPath,
      data: body,
      queryParameters: parameter,
    );

    return response.data;
  }

  Future setToken(String value) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString(SPrefKey.token, value);
  }

  Future getToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final String? token = pref.getString(SPrefKey.token);
    return token;
  }
}

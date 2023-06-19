import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ApiModel {
  final dio = Dio();
  final String baseUrl;

  ApiModel({required this.baseUrl});

  Future<Map<String, dynamic>> fetchApi(
      {String? route, String? id, String? whichId, String? token}) async {
    debugPrint("$id, $whichId, $token");
    if (route == null || route == '') {
      return throw Exception("need a route to fetch");
    }

    final apiEndpoint = baseUrl + (route.isEmpty ? "" : route);

    Map<String, dynamic> baseRequestOptions = {
      'method': "GET",
      'headers': <String, dynamic>{},
      'queryParameters': <String, dynamic>{},
    };

    if (id != null && whichId != null) {
      baseRequestOptions = {
        ...baseRequestOptions,
        'queryParameters': <String, dynamic>{whichId: id},
      };
    }

    if (token != null) {
      baseRequestOptions = {
        ...baseRequestOptions,
        'headers': <String, dynamic>{'Authorization': "Bearer $token"},
      };
    }

    try {
      final res = await dio.get(apiEndpoint,
          queryParameters: baseRequestOptions['queryParameters'],
          options: Options(
              method: baseRequestOptions['method'],
              headers: baseRequestOptions['headers']));

      return res.data;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Map<String, dynamic>> postApi(
      {Map<String, dynamic>? jsonData, String? route}) async {
    if (route == null || route == '') {
      return throw Exception("need a route to post");
    }
    final apiEndPoint = baseUrl + (route.isEmpty ? "" : route);

    try {
      // print(jsonData);
      final res = await dio.post(apiEndPoint, data: jsonData);
      // print(res.data);
      return res.data;
    } catch (e) {
      throw Exception("from sign in $e");
    }
  }
}

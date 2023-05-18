import 'dart:convert';

import 'package:dio/dio.dart';

class ApiModel {
  final dio = Dio();
  final String baseUrl;

  ApiModel({required this.baseUrl});

  Future<Map<String, dynamic>> fetchApi({String? route}) async {
    if (route == null || route == '') {
      return throw Exception("need a route to fetch");
    }
    final apiEndpoint = baseUrl + (route.isEmpty ? "" : route);
    try {
      final res = await dio.get(apiEndpoint);
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
      final res = await dio.post(apiEndPoint, data: jsonData);
      // print(res.data);
      return res.data;
    } catch (e) {
      throw Exception(e);
    }
  }
}

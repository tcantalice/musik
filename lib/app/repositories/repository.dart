import 'dart:convert';
import 'package:dio/dio.dart';

abstract class Repository {
  final Dio _dio;

  const Repository([this._dio]);

  get(String method, Map<String, dynamic> parameters) async {
    return await _dio
        .get(method, queryParameters: parameters)
        .then((response) => _getBody(json.decode(response.data)));
  }

  _getBody(data) {
    return data['message']['body'];
  }
}

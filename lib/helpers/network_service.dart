import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class NetworkService {
  static Future<dynamic> sendGetRequest(
      {required String endPoint,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers}) async {
    Response response;

    try {
      response = await Dio().get(
        endPoint,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
      print(response.data);
      return response.data;
    } catch (e) {
      print(e);
      throw e;
    }
  }

  static Future<dynamic> sendPostRequest(
      {required String endPoint,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? postData}) async {
    var response;
    try {
      response = await Dio().post(
        endPoint,
        data: postData,
        queryParameters: queryParameters,
      );
      print(response.data);
      return response.data;
    } catch (e) {
      if (e is DioError) {
        print(e.message);
      }
      print(e);
      throw e;
    }
  }
}

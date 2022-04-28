import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class NetworkService {
  static Future<dynamic> sendGetRequest(
      {required String endPoint, Map<String, dynamic>? queryParameters}) async {
    Response response;
    try {
      response = await Dio().get(
        endPoint,
        queryParameters: queryParameters,
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
      required BuildContext context,
      Map<String, dynamic>? postData}) async {
    var response;
    try {
      response = await Dio().post(
        endPoint,
        data: postData,
      );
      print(response.data);
      return response.data;
    } catch (e) {
      print(e);
      throw e;
    }
  }
}

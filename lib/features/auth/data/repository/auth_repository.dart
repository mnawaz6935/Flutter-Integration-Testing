import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_patrol_testing_framework/features/auth/data/models/login_response.dart';

final dio = Dio();

class AuthRepository {
  static Future<LoginResponse?> loginAction(
      {String? username, String? password}) async {
    try {
      var body = {'username': username, 'password': password};
      var response =
          await dio.post('https://dummyjson.com/auth/login', data: body);
      return loginResponseFromJson(json.encode(response.data));
    } on DioException catch (e) {
      debugPrint('Error Login ${e.message}');
    }
    return null;
  }
}

import 'package:flutter/material.dart';
import '/config/decoders.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserApiService extends NyApiService {
  UserApiService({BuildContext? buildContext})
      : super(buildContext, decoders: modelDecoders);

  @override
  String get baseUrl => getEnv('API_BASE_URL');

  /// Example API Request
  Future<dynamic> login(String emailOrPhone, String password) async {
    try {
      var response = await http.post(
        Uri.parse(baseUrl + "/auth/signin/"),
        headers: <String, String>{
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: {
          'emailOrPhone': emailOrPhone,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        // Handle successful login
        print(jsonDecode(response.body));
        print(response.statusCode);
        print('login successful');
        print('POST request was successful.');
      } else {
        // Handle errors or unsuccessful login
        print(jsonDecode(response.body));
        print(response.statusCode);
        print('login failed');
      }
      return response.statusCode;
    } catch (e) {
      print('Error occurred: $e');
      return null;
    }
  }
}

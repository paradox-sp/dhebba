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
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'emailorphone': emailOrPhone,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        print(jsonResponse);
        if (jsonResponse['success'] != null) {
          print('Login Successful: User ID is ${jsonResponse['user_id']}');
          return jsonResponse;
        } else {
          print('Failed to login: ${jsonResponse['error']}');
        }
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      print('Exception caught: $e');
    }
  }
}

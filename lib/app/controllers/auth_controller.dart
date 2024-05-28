// lib/app/controllers/auth_controller.dart
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';
import '../models/user.dart';
import '../networking/user_api_service.dart';

class LoginController extends NyController {
  // final UserApiService _apiService = UserApiService();

  Future<void> login(
      BuildContext context, String email, String password) async {
    var response =
        await api<UserApiService>((request) => request.login(email, password));
    // User? user = await response;
    // print(user?.userId);
    // 3 - Save the user to Nylo
    // await Auth.set(user);

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      print(jsonResponse);
      if (jsonResponse['success'] != null) {
        print('Login Successful: User ID is ${jsonResponse['user_id']}');
        Navigator.pushReplacementNamed(context, '/nav');
        // print(jsonResponse['user_id']);
        // return jsonResponse['user_id'];
        print(jsonResponse);
        User? user = User.fromJson(jsonResponse);
        print(user);
        print(user.userId);
        await Auth.set(user);
      } else {
        print('Failed to login: ${jsonResponse['error']}');
      }
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}

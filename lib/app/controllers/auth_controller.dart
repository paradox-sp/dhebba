// lib/app/controllers/auth_controller.dart
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/resources/pages/nav_page.dart';
import 'package:flutter_app/resources/pages/signin_page.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nylo_framework/nylo_framework.dart';
import '../models/user.dart';
import '../networking/user_api_service.dart';

class LoginController extends NyController {
  // final UserApiService _apiService = UserApiService();

  Future<void> login(
      BuildContext context, String email, String password) async {
    var response =
        await api<UserApiService>((request) => request.login(email, password));
    // print('responses:${response.body}');
    // User? user = await response.body;
    // print(user?.userId);
    // 3 - Save the user to Nylo
    // await Auth.set(user);

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      print(jsonResponse);
      Fluttertoast.showToast(msg: '${jsonResponse}');
      if (jsonResponse['success'] != null) {
        print('Login Successful: User ID is ${jsonResponse['user_id']}');
        // print(jsonResponse['user_id']);
        // return jsonResponse['user_id'];
        print(jsonResponse);
        User? user = User.fromJson(jsonResponse);
        print(user);
        print(user.userId);
        print(user.success);
        // NyStorage.store("userid", "${user.userId}");
        await Auth.login(user);
        routeTo(NavPage.path);
        // Navigator.pushReplacementNamed(context, '/nav');
      } else {
        print('Failed to login: ${jsonResponse['error']}');
      }
    } else {
      print('Request failed with status: ${response.statusCode}.');
      Fluttertoast.showToast(msg: '${response.statusCode}');
    }
  }
}

class SignupController extends NyController {
  Future<void> signup(BuildContext context, String firstName, String lastName,
      String number, String email, String password1, String password2) async {
    var response = await api<UserApiService>((request) => request.signup(
        firstName, lastName, number, email, password1, password2));
    // print(response);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      print(jsonResponse);
      Fluttertoast.showToast(msg: '${jsonResponse}');
      if (jsonResponse['success'] != null) {
        // Navigator.pushReplacementNamed(context, '/signin');
        routeTo(SigninPage.path,
            navigationType: NavigationType.pushAndForgetAll);
      }
    } else {
      print('Request failed with status: ${response.statusCode}.');
      Fluttertoast.showToast(msg: '${response.statusCode}');
    }
  }
}

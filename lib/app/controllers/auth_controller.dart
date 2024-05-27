// lib/app/controllers/auth_controller.dart
import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';
import '../networking/auth_service.dart';
// import '../networking/user_api_service.dart';

class AuthController extends BaseController {
  AuthService _authService = AuthService();

  Future<void> loginUser(BuildContext context) async {
    bool success =
        (await _authService.login('9860488769', '123456789')) as bool;
    if (success) {
      Navigator.pushNamed(context, '/nav');
    } else {
      // Handle login failure
    }
  }
}

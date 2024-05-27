// lib/app/networking/auth_service.dart
import 'package:nylo_framework/nylo_framework.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthService {
  static const String _baseUrl = 'http://192.168.1.4:8000/auth/signin/';
  Future<bool> login(String emailOrPhone, String password) async {
    try {
      // Making a POST request to the API
      http.Response response = await http.post(
        Uri.parse(_baseUrl),
        headers: <String, String>{
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: {
          'emailorphone': emailOrPhone,
          'password': password,
        },
      );
      return response.statusCode == 200;
    } catch (e) {
      print('Error occurred: $e');
      rethrow;
    }
  }

  Future<bool> register(String email, String password) async {
    // Implement registration logic here
    return true;
  }

  Future<void> logout() async {
    // Implement logout logic here
  }
}

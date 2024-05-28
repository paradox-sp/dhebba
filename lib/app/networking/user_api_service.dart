import 'package:flutter/material.dart';
import 'package:flutter_app/app/models/user.dart';
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
      return response;

      // if (response.statusCode == 200) {
      //   var jsonResponse = jsonDecode(response.body);
      //   print(jsonResponse);
      //   if (jsonResponse['success'] != null) {
      //     print('Login Successful: User ID is ${jsonResponse['user_id']}');
      //     // print(jsonResponse['user_id']);

      //     return jsonResponse['user_id'];
      //   } else {
      //     print('Failed to login: ${jsonResponse['error']}');
      //   }
      // } else {
      //   print('Request failed with status: ${response.statusCode}.');
      // }
    } catch (e) {
      print('Exception caught: $e');
    }
  }

  Future<dynamic> getUserDetail() async {
    try {
      int userid = await NyStorage.read("userid");
      print(userid);
      var response = await http.get(
        Uri.parse(baseUrl + '/fare/user/${userid}'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      if (response.statusCode == 200) {
        print(jsonDecode(response.body));
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to load user detail');
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<dynamic> signup(String firstName, String lastName, String number,
      String email, String password1, String password2) async {
    try {
      var response = await http.post(
        Uri.parse(baseUrl + "/auth/signup/"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'firstname': firstName,
          'lastname': lastName,
          'number': number,
          'email': email,
          'password1': password1,
          'password2': password2,
        }),
      );
      return response;
    } catch (e) {
      // Handle exception
      print(e);
      return null;
    }
  }
}

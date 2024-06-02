import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';
import '/config/decoders.dart';

class PostmanCollectionAuthApiService extends NyApiService {
  PostmanCollectionAuthApiService({BuildContext? buildContext})
      : super(buildContext, decoders: modelDecoders);

  @override
  String get baseUrl => getEnv('API_BASE_URL');

  //POST
  /// http://127.0.0.1:8000/auth/signup/
  Future<dynamic> postSignup() async => await network(
      request: (request) => request.post("/auth/signup/"),
      baseUrl: "http://127.0.0.1:8000");

  //GET
  /// http://127.0.0.1:8000/auth/signout/
  Future<dynamic> getLogout() async => await network(
      request: (request) => request.get("/auth/signout/"),
      baseUrl: "http://127.0.0.1:8000");

  //POST
  /// http://127.0.0.1:8000/auth/signin/
  Future<dynamic> postSignin() async => await network(
        request: (request) => request.post("/auth/signin/"),
        // baseUrl: "http://127.0.0.1:8000"
      );

  //POST
  /// http://127.0.0.1:8000/auth/resetPassword/9487cad5-0f9d-4b24-9453-c11329e1cae0
  Future<dynamic> postResetPassword() async => await network(
      request: (request) => request
          .post("/auth/resetPassword/9487cad5-0f9d-4b24-9453-c11329e1cae0"),
      baseUrl: "http://127.0.0.1:8000");

  //POST
  /// http://127.0.0.1:8000/auth/forgetPassword/
  Future<dynamic> postForgetPass() async => await network(
      request: (request) => request.post("/auth/forgetPassword/"),
      baseUrl: "http://127.0.0.1:8000");
}

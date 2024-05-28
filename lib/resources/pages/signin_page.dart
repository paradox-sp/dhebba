import 'package:flutter/material.dart';
import 'package:flutter_app/app/networking/user_api_service.dart';
import 'package:nylo_framework/nylo_framework.dart';
import '../../app/controllers/auth_controller.dart';
import '../../app/models/user.dart';

class SigninPage extends NyStatefulWidget {
  static const path = '/signin';

  SigninPage({super.key}) : super(path, child: _SigninPageState());
}

class _SigninPageState extends NyState<SigninPage> {
  final _tfEmail = TextEditingController();
  final _tfPassword = TextEditingController();
  final _loginController = LoginController();

  // final AuthController _authController = AuthController();

  @override
  init() async {}

  /// Use boot if you need to load data before the [view] is rendered.
  // @override
  // boot() async {
  //
  // }

  // _login() async {
  //   print("Sign-in method called");
  //   // 1 - Example register via an API Service
  //   User? user = await api<UserApiService>(
  //       (request) => request.login(_tfEmail.text, _tfPassword.text));

  //   // 2 - Returns the users session token
  //   print(user?.token);

  //   // 3 - Save the user to Nylo
  //   await Auth.set(user);
  // }

  @override
  Widget view(BuildContext context) {
    User? user = Auth.user<User>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _tfEmail,
                decoration: InputDecoration(
                  labelText: 'Email or Phone',
                  hintText: 'Enter your email or phone number',
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _tfPassword,
                decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: 'Enter your password',
                ),
                obscureText: true,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _loginController.login(
                      context, _tfEmail.text, _tfPassword.text);
                },
                child: Text('Sign In'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

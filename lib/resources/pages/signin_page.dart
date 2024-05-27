import 'package:flutter/material.dart';
import 'package:flutter_app/app/networking/user_api_service.dart';
import 'package:nylo_framework/nylo_framework.dart';
// import '../../app/controllers/auth_controller.dart';
import '../../app/models/user.dart';

class SigninPage extends NyStatefulWidget {
  static const path = '/signin';

  SigninPage({super.key}) : super(path, child: _SigninPageState());
}

class _SigninPageState extends NyState<SigninPage> {
  final TextEditingController _tfEmail = TextEditingController();
  final TextEditingController _tfPassword = TextEditingController();
  bool _isLoading = false; // Define _isLoading variable

  get emailOrPhoneController => null;

  get passwordController => null;
  // final AuthController _authController = AuthController();

  @override
  init() async {}

  /// Use boot if you need to load data before the [view] is rendered.
  // @override
  // boot() async {
  //
  // }

  _login() async {
    print("Sign-in method called");
    // 1 - Example register via an API Service
    User? user = await api<UserApiService>(
        (request) => request.login(_tfEmail.text, _tfPassword.text));

    // 2 - Returns the users session token
    print(user?.token);

    // 3 - Save the user to Nylo
    // await Auth.set(user);
  }

  @override
  Widget view(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Signin"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: emailOrPhoneController,
                decoration: InputDecoration(
                  labelText: 'Email or Phone',
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
                obscureText: true,
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _isLoading
                    ? null
                    : _login, // Make sure this is correctly referencing your sign-in function
                child: _isLoading
                    ? CircularProgressIndicator(color: Colors.white)
                    : Text('Sign In'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

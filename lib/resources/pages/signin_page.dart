import 'package:flutter/material.dart';
// import 'package:flutter_app/app/networking/user_api_service.dart';
import 'package:flutter_app/resources/pages/signup_page.dart';
import 'package:nylo_framework/nylo_framework.dart';
import '../../app/controllers/auth_controller.dart';
// import '../../app/models/user.dart';
import 'package:permission_handler/permission_handler.dart';

class SigninPage extends NyStatefulWidget {
  static const path = '/signin';

  SigninPage({super.key}) : super(path, child: _SigninPageState());
}

class _SigninPageState extends NyState<SigninPage> {
  final _tfEmail = TextEditingController();
  final _tfPassword = TextEditingController();
  final _loginController = LoginController();
  final _textController = TextEditingController();
  bool _passwordVisible = false;

  // final AuthController _authController = AuthController();

  // @override
  // init() async {
  //   var status = await Permission.storage.status;
  //   if (status.isGranted) {
  //     print('Storage permission is already granted');
  //   } else if (status.isPermanentlyDenied) {
  //     print('Storage permission is permanently denied');
  //   } else {
  //     status = await Permission.storage.request();
  //     if (status.isGranted) {
  //       print('Storage permission is granted');
  //     } else {
  //       print('Storage permission is denied');
  //     }
  //   }
  // }

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
    // User? user = Auth.user<User>();
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Sign In')),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text('Enter base url'),
                    content: TextField(
                        controller: _textController,
                        decoration: InputDecoration(
                          hintText: 'http://192.168.1.2:8000',
                        )),
                    actions: <Widget>[
                      TextButton(
                        child: Text('Save'),
                        onPressed: () {
                          print('Saved text: ${_textController.text}');

                          // NyStorage.store('baseurl', '${_textController.text}',
                          //     inBackpack: true);
                          // Backpack.instance
                          //     .set('baseurl', '${_textController.text}');

                          Navigator.of(context).pop(NyStorage.store(
                              "baseurl", "${_textController.text}",
                              inBackpack: true));
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(25.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
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
                    suffixIcon: IconButton(
                      icon: Icon(
                        _passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                    ),
                  ),
                  obscureText: !_passwordVisible,
                ),
                SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        _loginController.login(
                            context, _tfEmail.text, _tfPassword.text);
                      },
                      child: Text('Sign In'),
                    ),
                    SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: () {
                        // Navigate to the signup page when the button is pressed
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignupPage(),
                          ),
                        );
                      },
                      child: Text('Sign Up'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

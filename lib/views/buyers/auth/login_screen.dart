import 'package:e_commerce_app/controllers/auth_controller.dart';
import 'package:e_commerce_app/utils/show_snackBar.dart';
import 'package:e_commerce_app/views/main_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final AuthController _authController = AuthController();

  late String email;
  late String password;

  _loginUser() async {
    if (_formKey.currentState!.validate()) {
      await _authController.loginUsers(email, password);
      return Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) {
            return MainScreen();
          },
        ),
      );
    } else {
      return showSnack(context, 'Fields Must Not Be Empty...');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Login Customer\'s Account',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(13.0),
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Email Field Must Not Be Empty...';
                    } else {
                      return null;
                    }
                  },
                  onChanged: (value) {
                    email = value;
                  },
                  decoration: InputDecoration(labelText: "Enter Email Adress"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(13.0),
                child: TextFormField(
                  obscureText: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Password Field Must Not Be Empty...';
                    } else {
                      return null;
                    }
                  },
                  onChanged: (value) {
                    password = value;
                  },
                  decoration: InputDecoration(labelText: "Enter Password"),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  _loginUser();
                },
                child: Container(
                  width: MediaQuery.of(context).size.width - 40,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.yellow.shade900,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 19,
                        letterSpacing: 5,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Need An Account?'),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Register'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

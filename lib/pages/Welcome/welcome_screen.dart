import 'package:flutter/material.dart';

import '../../utils/background.dart';
import '../../utils/constants.dart';
import '../Login/login_screen.dart';
import '../Signup/signup_screen.dart';

import 'components/welcome_image.dart';

class WelcomeScreen extends StatelessWidget {
  static const String routeName = '/welcome';
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const WelcomeImage(),
              Row(
                children:  [
                  const Spacer(),
                  Expanded(
                    flex: 8,
                    child: Column(
                      children: [
                        Hero(
                          tag: "login_btn",
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushReplacementNamed(context, LoginScreen.routeName);
                            },
                            child: Text(
                              "Login".toUpperCase(),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(context, SignUpScreen.routeName);
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: kPrimaryLightColor, elevation: 0),
                          child: Text(
                            "Sign Up".toUpperCase(),
                            style: const TextStyle(color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


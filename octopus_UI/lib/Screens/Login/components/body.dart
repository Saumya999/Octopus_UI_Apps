import 'dart:developer';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:octopus_UI/Screens/Login/components/background.dart';
import 'package:octopus_UI/Screens/Signup/signup_screen.dart';
import 'package:octopus_UI/components/already_have_an_account_acheck.dart';
import 'package:octopus_UI/components/rounded_button.dart';
import 'package:octopus_UI/components/rounded_input_field.dart';
import 'package:octopus_UI/components/rounded_password_field.dart';
import 'package:flutter/foundation.dart';
//import 'package:flutter_svg/svg.dart';

import 'package:octopus_UI/Common-API-Services/LoginAPI/login_api_service.dart';
import 'package:octopus_UI/Common-API-Services/LoginAPI/login_api_model.dart';

class Body extends StatefulWidget {
  Body({Key key}) : super(key: key);

  @override
  _Body createState() => _Body();
}


class _Body extends State<Body> {

  Future<User> user;

  @override
  void initState() {
    super.initState();
//    user = login('ss', 'ss');
  }

  login(String email, String password) {
      Login loginClass = new Login();
      user = loginClass.signIn(email, password);
      return user;
  }

  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

@override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "LOGIN",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            Image.asset(
              "assets/icons/login.png",
              height: size.height * 0.35,
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "Your Email",
//              onChanged: (value) {
//                print(value);
//              },
              controller: emailController,
            ),
            RoundedPasswordField(
//              onChanged: (value) {
//              },
            controller: passwordController,
            ),
            RoundedButton(
              text: "LOGIN",
              press: () {
                user = login(emailController.text, passwordController.text);
                if (user != null) {
                  print('---------------------------------------- $user');
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return SignUpScreen();
                      },
                    ),
                  );
                }
              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }


}
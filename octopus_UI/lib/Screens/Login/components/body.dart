import 'dart:developer';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:octopus_UI/Screens/Login/components/background.dart';
import 'package:octopus_UI/Screens/Signup/signup_screen.dart';
import 'package:octopus_UI/components/already_have_an_account_acheck.dart';
import 'package:octopus_UI/components/rounded_button.dart';
import 'package:octopus_UI/components/rounded_input_field.dart';
import 'package:octopus_UI/components/rounded_password_field.dart';
//import 'package:flutter_svg/svg.dart';

import 'package:octopus_UI/Common-API-Services/LoginAPI/login_api_service.dart';
import 'package:octopus_UI/Common-API-Services/LoginAPI/login_api_model.dart';

class Body extends StatefulWidget {
  Body({Key key}) : super(key: key);

  @override
  _Body createState() => _Body();
}


class _Body extends State<Body> {

  User user = new User();

  @override
  void initState() {
    super.initState();
//    user = login('ss', 'ss');
  }

  bool errorText = false;
  bool loginFailed = false;

   login(String email, String password) async {
      Login loginClass = new Login();
      user = await loginClass.signIn(email, password);
      if (user.email != null) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return SignUpScreen();
            },
          ),
        );
      } else {
        emailController.text = "";
        passwordController.text = "";
        setState(() {
          loginFailed = true;
        });
   }
  }

  bool setErrorText () {
     if ((emailController.text == "" || passwordController.text == "") && loginFailed) {
       setState(() {
         errorText = true;
       });
     } else {
       setState(() {
         errorText = false;
       });
     }
     return errorText;
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
              hintText: "Email Id",
              controller: emailController,
              errorText: setErrorText(),
            ),
            RoundedPasswordField(
            controller: passwordController,
              errorText: setErrorText(),
            ),
            RoundedButton(
              text: "LOGIN",
              press: () => login(emailController.text, passwordController.text)
              ,
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
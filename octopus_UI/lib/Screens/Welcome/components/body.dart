import 'package:flutter/material.dart';
import 'package:octopus_UI/Screens/Login/login_screen.dart';
import 'package:octopus_UI/Screens/Signup/signup_screen.dart';
import 'package:octopus_UI/Screens/Welcome/components/background.dart';
import 'package:octopus_UI/Animation/FadeAnimation.dart';
import 'package:octopus_UI/components/rounded_button.dart';
import 'package:octopus_UI/constants.dart';
//import 'package:flutter_svg/flutter_svg.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    new Future.delayed(const Duration(seconds: 5), () {
      Navigator.push (
              context,
              MaterialPageRoute(
                builder: (context) {
                  return LoginScreen();
                },
              ),
            );
    });
    // This size provide us total height and width of our screen
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "WELCOME TO Customer Care",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.05),
            Image.asset(
              "assets/icons/chat.png",
              height: size.height * 0.45,
            ),
            SizedBox(height: size.height * 0.05),
            // Container(
            // child :Stack(
            //   children: <Widget>[
            //     Positioned(
            //   left: 30,
            //   //width: 80,
            //   height: size.height * 0.05,
            //   child: FadeAnimation(1, Container(
            //     decoration: BoxDecoration(
            //         image: DecorationImage(
            //             image: AssetImage('assets/icons/chat.png')
            //
            //         )
            //     ),
            //   )),
            // ),
            // Positioned(
            //   left: 140,
            //   width: 80,
            //   height: 150,
            //   child: FadeAnimation(1.3, Container(
            //     decoration: BoxDecoration(
            //         image: DecorationImage(
            //             image: AssetImage('assets/icons/chat2.png')
            //         )
            //     ),
            //   )),
            // ),],),),
            // RoundedButton(
            //   text: "LOGIN",
            //
            //   // press: () {
            //   //
            //   //   Navigator.push(
            //   //     context,
            //   //     MaterialPageRoute(
            //   //       builder: (context) {
            //   //         return LoginScreen();
            //   //       },
            //   //     ),
            //   //   );
            //   // },
            // ),
            // RoundedButton(
            //   text: "SIGN UP",
            //   color: kPrimaryLightColor,
            //   textColor: Colors.black,
            //   press: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) {
            //           return SignUpScreen();
            //         },
            //       ),
            //     );
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
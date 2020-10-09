import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:octopus_UI/components/text_field_container.dart';
import 'package:octopus_UI/constants.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<bool> hidePassword;
  final ValueChanged<String> onChanged;
  final TextEditingController controller;
  const RoundedPasswordField({
    Key key,
    this.onChanged,
    this.hidePassword,
    this.controller
  }) : super(key: key);

  //bool hidePassword = true ;

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(

        obscureText: true,
        controller: controller,
        //onChanged: onChanged,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          hintText: "Password",
          icon: Icon(
            Icons.lock,
            color: kPrimaryColor,
          ),
          suffixIcon: IconButton(
            onPressed: () {
             // setState(() {
   // hidePassword = !hidePassword;
    },
          //   icon: Icon(hidePassword
          // ? Icons.visibility_off
          //     : Icons.visibility),

            // Icons.visibility_off,
            //
            // color: kPrimaryColor,
          ),

          border: InputBorder.none,
        ),
      ),
    );
  }
}
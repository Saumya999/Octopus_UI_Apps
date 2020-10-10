import 'package:flutter/material.dart';
import 'package:octopus_UI/components/text_field_container.dart';
import 'package:octopus_UI/constants.dart';

class RoundedPasswordField extends StatelessWidget {
  //final ValueChanged<String> onChanged;
  final TextEditingController controller;
  final bool errorText;
  final Function press;
  final bool isVisible;
  final bool obscureText;
  const RoundedPasswordField({
    Key key,
    this.controller,
    this.errorText,
    this.press,
    this.obscureText,
    this.isVisible
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: obscureText,
        controller: controller,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          hintText: "Password",
          errorText: errorText ? "Invalid Password" : null,
          icon: Icon(
            Icons.lock,
            color: kPrimaryColor,
          ),
          suffixIcon: IconButton(
            icon: Icon (
              isVisible ?
              Icons.visibility : Icons.visibility_off,
              color: kPrimaryColor,

            ),
            onPressed: press,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
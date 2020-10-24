import 'package:flutter/material.dart';
import 'package:octopus_UI/components/text_field_container.dart';
import 'package:octopus_UI/constants.dart';
import 'package:octopus_UI/components/Utility.dart';

class RoundedPasswordField extends StatelessWidget {
  //final ValueChanged<String> onChanged;
  final TextEditingController controller;
  final bool errorText;
  final Function press;
  final bool isVisible;
  final bool obscureText;
  final String hintText;
  const RoundedPasswordField({
    Key key,
    this.controller,
    this.errorText,
    this.press,
    this.obscureText,
    this.isVisible,
    this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: obscureText,
        controller: controller,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          hintText: hintText,
          errorText: errorText ? "Invalid Password" : null,
          icon: Icon(
            Icons.lock,
            color: kPrimaryColor,
          ),

          suffixIcon: getSuffixIconForPassword(hintText)?IconButton(
            icon: Icon (
              isVisible ?
              Icons.visibility : Icons.visibility_off,
              color: kPrimaryColor,

            ),
            onPressed: press,
          ):null,
          border: InputBorder.none,
        ),
      ),
    );
  }
}

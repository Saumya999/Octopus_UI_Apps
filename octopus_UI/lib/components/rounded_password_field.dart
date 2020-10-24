import 'package:flutter/material.dart';
import 'package:octopus_UI/components/text_field_container.dart';
import 'package:octopus_UI/constants.dart';
import 'package:octopus_UI/components/Utility.dart';

class RoundedPasswordField extends StatelessWidget {
  final TextEditingController controller;
  final bool errorText;
  final Function press;
  final bool isVisible;
  final bool obscureText;
  final String hintText;
  final bool passwordValidator;

  const RoundedPasswordField({
    Key key,
    this.controller,
    this.errorText,
    this.press,
    this.obscureText,
    this.isVisible,
    this.hintText,
    this.passwordValidator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        obscureText: obscureText,
        controller: controller,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          hintText: hintText,
          errorText: null,
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
          border: InputBorder.none,labelText: hintText,
        ),

          validator:(value) {
            if (value.isEmpty) {
              return validatorText;
            } else if(passwordValidator ) {
              return passwordValidatorText;
            } else {
              return null;
            }
          }

      ),

    );
  }
}

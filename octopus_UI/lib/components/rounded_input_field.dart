import 'package:flutter/material.dart';
import 'package:octopus_UI/components/text_field_container.dart';
import 'package:octopus_UI/constants.dart';
import 'package:octopus_UI/components/Utility.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final type;
  final ValueChanged<String> onChanged;
  final TextEditingController controller;
  final bool errorText;

  const RoundedInputField({
    Key key,
    this.hintText,
    this.icon = Icons.person,
    this.type,
    this.onChanged,
    this.controller,
    this.errorText
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        onChanged: onChanged,
        cursorColor: kPrimaryColor,
        controller: controller,
        decoration: InputDecoration(
          icon: Icon(
            getItemType(type),
            color: kPrimaryColor,
          ),
          hintText: hintText,
            border: InputBorder.none,labelText: hintText,
            errorText: null
        ),
          validator:(value) {
            if (value.isEmpty) {
              return validatorText;
            } else {
              return null;
            }
          }
      ),
    );

  }
}


import 'package:flutter/material.dart';
import 'package:octopus_UI/constants.dart';

getItemType(String type) {
  if (type == person)
    return Icons.person;
  else if (type == email) {
    return Icons.email;
  }

}

passwordValidatorFunc(String password,String confirmPassword) {
  if(password!=confirmPassword) {
    return true;
  }
  else
    return false;
}

getSuffixIconForPassword(String type) {
  if(type == confirmPassword)
    return false;
  else
    return true;
}
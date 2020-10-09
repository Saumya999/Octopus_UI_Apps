import 'dart:convert';
import 'package:octopus_UI/Common-API-Services/LoginAPI/login_api_model.dart';
import 'package:http/http.dart' as http;

class Login {

  Future<User> signIn(String email, String password) async {

    Map loginInput = {
      'email': email,
      'password': password
    };

    final loginResponse = await http.post('http:/localhost:8081/customer/v1/login', body: loginInput);

    if(loginResponse.statusCode >= 200 && loginResponse.statusCode < 300) {
      return User.fromJson(json.decode(loginResponse.body));
    }


    throw Exception('Failed to load post');
  }
}
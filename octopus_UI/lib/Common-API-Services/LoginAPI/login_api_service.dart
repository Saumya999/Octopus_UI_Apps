import 'dart:convert';
import 'package:octopus_UI/Common-API-Services/LoginAPI/login_api_model.dart';
import 'package:http/http.dart' as http;


class Login {

  Future<dynamic> signIn(String email, String password) async {

    final payload = jsonEncode({
      "email": email,
      "password": password
    });
    Map<String,String> headers = {'Content-Type':'application/json',
      'Access-Control-Allow-Origin': '*'};

    final loginResponse = await http.post('https://golden-office-server.herokuapp.com/customer/v1/login', body: payload,
    headers: headers);

    if(loginResponse.statusCode >= 200 && loginResponse.statusCode < 300) {
      return User.fromJson(json.decode(loginResponse.body));
    }


    throw Exception('Failed to load post');
  }
}
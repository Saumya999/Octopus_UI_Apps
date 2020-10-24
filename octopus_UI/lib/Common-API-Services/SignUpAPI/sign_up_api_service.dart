import 'dart:convert';
import 'package:octopus_UI/Common-API-Services/SignUpAPI/sign_up_api_model.dart';
import 'package:http/http.dart' as http;
import 'package:octopus_UI/constants.dart';
import 'package:octopus_UI/Common-API-Services/SignUpAPI/SignUpEndpoint.dart';


class Signup {

  Future<dynamic> signUp(String firstName, String lastName,String email,String password) async {

    final payload = jsonEncode({
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "caseList": [],
      "ticketList": [],
      "password": password
    });

    Map<String,String> headers = {'Content-Type':'application/json',
      'Access-Control-Allow-Origin': '*'
    };

    final signupResponse = await http.post(url+endPoint, body: payload,
        headers: headers);

    if(signupResponse.statusCode >= 200 && signupResponse.statusCode < 300) {
      return NewUser.fromJson(json.decode(signupResponse.body));
    }


    return NewUser.fromJson(json.decode(signupResponse.body));
  }
}

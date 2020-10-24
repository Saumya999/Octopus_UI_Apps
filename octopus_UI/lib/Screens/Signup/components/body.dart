import 'package:flutter/material.dart';
import 'package:octopus_UI/Screens/Login/login_screen.dart';
import 'package:octopus_UI/Screens/Signup/components/background.dart';
import 'package:octopus_UI/components/Utility.dart';
import 'package:octopus_UI/components/already_have_an_account_acheck.dart';
import 'package:octopus_UI/components/rounded_button.dart';
import 'package:octopus_UI/components/rounded_input_field.dart';
import 'package:octopus_UI/components/rounded_password_field.dart';
import 'package:octopus_UI/Common-API-Services/SignUpAPI/sign_up_api_model.dart';
import 'package:octopus_UI/Common-API-Services/SignUpAPI/sign_up_api_service.dart';

import '../../Login/login_screen.dart';

class Body extends StatefulWidget {
  Body({Key key}) : super(key: key);

  @override
  _Body createState() => _Body();
}


class _Body extends State<Body> {
  final formKey = GlobalKey<FormState>();
  NewUser user = new NewUser();
  @override
  void initState() {
    super.initState();
  }

  // void _submit() {
  //   final form = formKey.currentState;
  //
  //   if (form.validate()) {
  //     form.save();
  //
  //     performLogin();
  //   }
  // }
  //
  // void performLogin() {
  //   final snackbar = new SnackBar(
  //     content: new Text("Email : $emailController, password : $passwordController"),
  //   );
  //   scaffoldKey.currentState.showSnackBar(snackbar);
  // }

  bool errorText = false;
  bool signUpFailed = false;
  bool obscureText = true;
  bool isVisible = false;

  signUpScreen(String firstName, String lastName,String email,String password,String confirmPassword) async {
    if(!passwordValidatorFunc(password, confirmPassword) && (firstName!=null && lastName!= null && password!=null && confirmPassword!=null)) {
    Signup signupClass = new Signup();
    user = await signupClass.signUp(firstName, lastName, email, password);
    //if (user.email != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return LoginScreen();
          },
        ),
      );
     } else {
      setState(() {
        signUpFailed = true;
      });
    }
  }

  bool setErrorText () {
    if ((firstNameController.text == "" || lastNameController.text ==""||emailController.text == "" || passwordController.text == "") && signUpFailed) {
      setState(() {
        errorText = true;
      });
    } else {
      setState(() {
        errorText = false;
      });
    }
    return errorText;
  }

  void validate() {
    if(formKey.currentState.validate()) {
      print("Validated");
    } else {
      print("Not");
    }
  }


  final TextEditingController firstNameController = new TextEditingController();
  final TextEditingController lastNameController = new TextEditingController();
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  final TextEditingController confirmPasswordController = new TextEditingController();

//class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child : Form (
          key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "SIGNUP",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            Image.asset(
              "assets/icons/signup.png",
              height: size.height * 0.35,
            ),
            RoundedInputField(

              hintText: "First Name",
              controller: firstNameController,
              type: "person",
              errorText:  setErrorText(),
            ),
            RoundedInputField(
              hintText: "Last Name",
              controller: lastNameController,
              type: "person",
              errorText: setErrorText(),
            ),
            RoundedInputField(
              hintText: "Your Email",
              controller: emailController,
              type: "email",
              errorText: setErrorText(),
            ),
            RoundedPasswordField(
              hintText: "Password",
              controller: passwordController,
              errorText: setErrorText(),
              obscureText: obscureText,
              isVisible: isVisible,
              passwordValidator: false,
              press: (){
                setState(() {
                  isVisible = !isVisible;
                  obscureText = !obscureText;
                });
              },
            ),
            RoundedPasswordField(
              hintText: "Confirm Password",
              controller: confirmPasswordController,
              obscureText: true,
              isVisible: false,
              errorText: false,
              passwordValidator:passwordValidatorFunc("${passwordController.text}", "${confirmPasswordController.text}"),
            ),
            RoundedButton(
              text: "SIGNUP",
              press: () => { validate(),
              signUpScreen(firstNameController.text, lastNameController.text,emailController.text, passwordController.text,confirmPasswordController.text)},
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
            //OrDivider()
          ],
        ),
        ),
      ),
    );
  }
}

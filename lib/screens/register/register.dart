import 'package:cleaning_app/components/background/background.dart';
import 'package:cleaning_app/utils/api.dart';
import 'package:cleaning_app/utils/firebase.dart';
import 'package:cleaning_app/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import "package:cleaning_app/config/theme_colors.dart";
import "package:cleaning_app/components/text_input/text_input.dart";
import "package:cleaning_app/components/button/button.dart";
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:touchable_opacity/touchable_opacity.dart';

class Register extends StatelessWidget {
  static String screenName = "register";

  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;

  void handleRegister(BuildContext context) async {
    try {
      final String errorMessage = validate();

      if (errorMessage != null) {
        throw {"message": errorMessage};
      }

      EasyLoading.show(status: 'loading');

      String email = emailController.text.trim();
      String password = passwordController.text.trim();
      String fullName = fullNameController.text.trim();

      UserCredential user =
          await FirebaseHelpers.createUserWithEmailAndPassword(email, password);

      Map<String, dynamic> userData = {"email": email, "fullName": fullName};
      String userId = user.user.uid;

      await FirebaseHelpers.setDocument("users", userId, userData);
      await Api.createStripeUser(email, fullName);

      EasyLoading.showSuccess('Account Registered');
      Navigator.of(context).pop();
    } catch (e) {
      EasyLoading.showError(e["message"]);
    }
  }

  String validate() {
    String errorMessage;
    String fullName = fullNameController.text.trim();
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();

    if (fullName == "" ||
        email == "" ||
        password == "" ||
        confirmPassword == "") {
      errorMessage = "All fields are required";
      return errorMessage;
    }

    if (password != confirmPassword) {
      errorMessage = "Passwords doesn't match";
      return errorMessage;
    }

    return errorMessage;
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: GestureDetector(
        onTap: () {
          Helpers.dismissKeyboardOnTap(context);
        },
        child: Scaffold(
          body: Stack(
            children: [
              Background(),
              Align(
                alignment: Alignment.center,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        child: Center(
                          child: PhysicalModel(
                            borderRadius: BorderRadius.circular(20),
                            color: ThemeColors.black,
                            elevation: 3,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 20),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: ThemeColors.white),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Form(
                                    child: Column(
                                      // mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Image.asset(
                                          "assets/icons/app-logo.png",
                                          width: width * 0.2,
                                          height: width * 0.2,
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          "We help you clean your home",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: ThemeColors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        TextInput(
                                          controller: fullNameController,
                                          hintText: "Enter full name",
                                        ),
                                        TextInput(
                                          controller: emailController,
                                          hintText: "Enter email",
                                        ),
                                        TextInput(
                                          obscureText: true,
                                          enableSuggestions: false,
                                          autocorrect: false,
                                          controller: passwordController,
                                          hintText: "Enter password",
                                        ),
                                        TextInput(
                                          obscureText: true,
                                          enableSuggestions: false,
                                          autocorrect: false,
                                          controller: confirmPasswordController,
                                          hintText: "Confirm password",
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                            width: double.infinity,
                                            child: Button(
                                              label: "Register",
                                              onPressed: () {
                                                handleRegister(context);
                                                // Navigator.pop(context);
                                              },
                                            )),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 15),
                        child: TouchableOpacity(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            "Login to existing account",
                            style: TextStyle(
                                fontSize: 18, color: ThemeColors.black),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

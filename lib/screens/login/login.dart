import 'package:cleaning_app/components/background/background.dart';
import 'package:cleaning_app/screens/register/register.dart';
import 'package:cleaning_app/utils/helpers.dart';
import 'package:flutter/material.dart';

import "package:cleaning_app/screens/home/home.dart";
import "package:cleaning_app/config/theme_colors.dart";
import "package:cleaning_app/components/text_input/text_input.dart";
import "package:cleaning_app/components/button/button.dart";
import 'package:touchable_opacity/touchable_opacity.dart';

class Login extends StatelessWidget {
  static String screenName = "login";

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
              Column(
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
                                      controller: emailController,
                                      hintText: "Enter your email",
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    TextInput(
                                      obscureText: true,
                                      enableSuggestions: false,
                                      autocorrect: false,
                                      controller: passwordController,
                                      hintText: "Enter your password",
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                        width: double.infinity,
                                        child: Button(
                                          label: "Login",
                                          onPressed: () {
                                            Navigator.pushReplacementNamed(
                                                context, Home.screenName);
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
                        Navigator.of(context).pushNamed(Register.screenName);
                      },
                      child: Text(
                        "Create new account",
                        style:
                            TextStyle(fontSize: 18, color: ThemeColors.black),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

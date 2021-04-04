import 'package:flutter/material.dart';
import "package:cleaning_app/config/theme_colors.dart";
import "package:cleaning_app/components/text_input/text_input.dart";
import "package:cleaning_app/components/button/button.dart";

class Login extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Container(
          color: ThemeColors.yellow,
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              Expanded(
                child: Form(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        "assets/icons/app-logo.png",
                        width: width * 0.25,
                        height: width * 0.25,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        "We help you clean your home",
                        style: TextStyle(
                            fontSize: 18,
                            color: ThemeColors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      TextInput(
                        controller: emailController,
                        hintText: "Enter your email",
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextInput(
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
                            onPressed: () {},
                          )),
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

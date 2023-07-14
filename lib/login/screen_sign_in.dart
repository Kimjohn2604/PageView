import 'package:flutter/material.dart';

import 'login/component/appar.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: SafeArea(
        child: Scaffold(
            appBar: buildAppBar(title: "Log in"),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  loginIcons(),
                  const TextFieldPass(),
                  register(context),
                  Login(context,title: "Log in"),
                  const Center(
                      child: Text("Or",
                          style: TextStyle(fontSize: 14, color: Colors.black))),
                  LoginButton(
                      path: "google.png", title: "Login with Google Account"),
                  LoginButton(
                      path: "face.jpg", title: "Login with Facebook Account"),
                ],
              ),
            )),
      ),
    );
  }
}
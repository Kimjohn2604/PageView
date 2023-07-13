import 'package:flutter/material.dart';

import 'appar.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:const BoxDecoration(
        color: Colors.white,
      ),
      child: SafeArea(
        child: Scaffold(
            appBar: buildAppBar(),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  loginIcons(),
                  TextFieldPass(),
                  Register(),
                  Login(),
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

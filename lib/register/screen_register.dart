import 'package:app/register/bloc/register_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login/component/appar.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: SafeArea(
        child: Scaffold(
            appBar: buildAppBar(title: "Register"),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(bottom: 20),
                      width: double.infinity,
                      height: 90,
                      child: const Text("Enter your details and sign-up")),
                  SignUpContent(context, (value) {
                    context.read<RegisterBloc>().add(UserEvent(value));
                  },
                      title: "Username",
                      hintText: "Enter your Username",
                      path: "user.png"),
                  SignUpContent(context, (value) {
                    context.read<RegisterBloc>().add(EmailEvent(value));
                  },
                      title: "Email",
                      hintText: "Enter your Email Address",
                      path: "user.png"),
                  SignUpContent(context, (value) {
                    context.read<RegisterBloc>().add(PasswordEvent(value));
                  },
                      title: "Password",
                      hintText: "Enter your Password",
                      path: "password.png"),
                  SignUpContent(context, (value) {
                    context.read<RegisterBloc>().add(RePasswordEvent(value));
                  },
                      title: "Confirm Password",
                      hintText: "Enter your Confirm Password",
                      path: "password.png"),
                  Container(
                    padding: const EdgeInsets.only(left: 25, right: 20),
                    child: const Text(
                      "By creating a new account you will receive many gifts and special discount codes for each new account.",
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Login(context, title: "Sign up"),
                ],
              ),
            )),
      ),
    );
  }

  Container SignUpContent(BuildContext context,  Function? func,
      {required String title, required String path, required String hintText}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title),
          Container(
            margin: const EdgeInsets.only(top: 5, bottom: 10),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(15)),
            width: double.infinity,
            height: 50,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 15),
                  height: 30,
                  width: 30,
                  child: Image.asset("assets/icons/${path}"),
                ),
                Container(
                    height: 50,
                    width: 250,
                    child: TextField(
                      onChanged: (value)=>func!(value),
                      /* (value) {
                        context.read<SignInBloc>().add(EmailEvent(value));
                      }, */
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        hintText: hintText,
                        hintStyle: TextStyle(
                            color: Colors.black.withOpacity(0.5), fontSize: 14),
                        border: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent)),
                        enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent)),
                        disabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent)),
                        focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent)),
                      ),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

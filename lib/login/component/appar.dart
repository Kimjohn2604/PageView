import 'package:app/login/bloc/sign_in_bloc.dart';
import 'package:app/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../bloc/sign_in_controller.dart';

AppBar buildAppBar({required String title}) {
  return AppBar(
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(1.0),
      child: Container(
        color: Colors.grey.withOpacity(0.5),
        height: 1.0,
      ),
    ),
    centerTitle: true,
    title:  Text(
      title,
      style: const TextStyle(color: Colors.black),
    ),
  );
}

Widget loginIcons() {
  return Container(
    width: double.infinity,
    margin: const EdgeInsets.symmetric(vertical: 50),
    child: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.w),
          image: const DecorationImage(
            /* fit: BoxFit.fitHeight, */
            image: AssetImage(
              "assets/icons/tiki.jpg",
            ),
          )),
      width: 50.w,
      height: 50.h,
    ),
  );
}

class TextFieldPass extends StatefulWidget {
  const TextFieldPass({super.key});

  @override
  State<TextFieldPass> createState() => _TextFieldPassState();
}

class _TextFieldPassState extends State<TextFieldPass> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(
      builder: (context, state) {
        return Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Email"),
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
                          margin: EdgeInsets.only(left: 15.w),
                          height: 30,
                          width: 30,
                          child: Image.asset("assets/icons/user.png"),
                        ),
                        Container(
                            height: 50,
                            width: 250,
                            child: TextField(
                              onChanged: (value) {
                                context
                                    .read<SignInBloc>()
                                    .add(EmailEvent(value));
                              },
                              keyboardType: TextInputType.multiline,
                              decoration: InputDecoration(
                                hintText: "Enter your email account",
                                hintStyle: TextStyle(
                                    color: Colors.black.withOpacity(0.5),
                                    fontSize: 14),
                                border: const OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent)),
                                enabledBorder: const OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent)),
                                disabledBorder: const OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent)),
                                focusedBorder: const OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent)),
                              ),
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("PassWord"),
                  Container(
                    margin: const EdgeInsets.only(top: 5),
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(15)),
                    width: double.infinity,
                    height: 50,
                    child: Stack(alignment: Alignment.centerRight, children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 30,
                            width: 30,
                            child: Image.asset("assets/icons/password.png"),
                          ),
                          Container(
                              height: 50,
                              width: 250,
                              child: TextField(
                                onChanged: (value) {
                                  context
                                      .read<SignInBloc>()
                                      .add(PasswordEvent(value));
                                },
                                keyboardType: TextInputType.multiline,
                                obscureText:
                                    context.read<SignInBloc>().state.showpass,
                                decoration: InputDecoration(
                                  hintText: "Enter your password",
                                  hintStyle: TextStyle(
                                      color: Colors.black.withOpacity(0.5),
                                      fontSize: 14),
                                  border: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.transparent)),
                                  enabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.transparent)),
                                  disabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.transparent)),
                                  focusedBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.transparent)),
                                ),
                              )),
                        ],
                      ),
                      InkWell(
                          onTap: () {
                            context.read<SignInBloc>().add(ShowPasswordEvent());
                            /* setState(() {
                              showpass = !showpass;
                            }); */
                          },
                          child: context.read<SignInBloc>().state.showpass
                              ? const Icon(Icons.visibility)
                              : const Icon(Icons.visibility_off))
                    ]),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

Widget register(BuildContext context) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "Forgot Password",
          style: TextStyle(
            fontSize: 13,
            color: Colors.black,
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Register()));
          },
          child: const Text(
            "Register",
            style: TextStyle(
              fontSize: 13,
              color: Colors.blue,
            ),
          ),
        ),
      ],
    ),
  );
}

Widget Login(BuildContext context,{required String title}) {
  return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 40,
      width: double.infinity,
      child: ElevatedButton(
          onPressed: () {
            SigninController(context: context).handleSignIn("email");
          },
          child: Text(title)));
}

Widget LoginButton({required String title, required String path}) {
  return Padding(
    padding: const EdgeInsets.only(right: 20, left: 20, top: 10),
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 40,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.blue.shade100,
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(
                color: Colors.black,
                spreadRadius: 1,
                blurRadius: 2,
                offset: Offset(0, 1))
          ]),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            height: 40,
            width: 40.w,
            child: Image.asset("assets/icons/$path"),
          ),
          Text(
            title,
            /* style: TextStyle(fontSize: 14.sp, color: Colors.white), */
          ),
        ],
      ),
    ),
  );
}

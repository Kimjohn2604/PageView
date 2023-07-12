import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'appar.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: SafeArea(
        child: Scaffold(
            appBar: buildAppBar(),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildLogin(context),
                Center(
                    child: Text("Or used to email",
                        style: TextStyle(fontSize: 14, color: Colors.black))),
                SizedBox(
                  height: 50.h,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Email"),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            label: Text("Your email")),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("PassWord"),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            label: Text("Your pass")),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
                Center(
                    child: Text(
                  "Forgot Password",
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      decoration: TextDecoration.underline),
                )),
                Padding(
                  padding: const EdgeInsets.only(right: 20,left: 20,top:30),
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 325.w,
                      height: 50.h,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(15.w),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black,
                                spreadRadius: 1,
                                blurRadius: 2,
                                offset: Offset(0, 1))
                          ]),
                      child: Center(
                        child: Text(
                          "Login",
                          style: TextStyle(fontSize: 14.sp, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}

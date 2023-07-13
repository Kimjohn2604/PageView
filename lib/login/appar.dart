import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar buildAppBar() {
  return AppBar(
    bottom: PreferredSize(
      preferredSize: Size.fromHeight(1.0),
      child: Container(
        color: Colors.grey.withOpacity(0.5),
        height: 1.0,
      ),
    ),
    centerTitle: true,
    title: const Text(
      "Log in",
      style: TextStyle(color: Colors.black),
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
  bool showpass = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Email"),
        Container(
          margin: EdgeInsets.only(top: 5, bottom: 10),
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(15)),
          width: double.infinity,
          height: 60,
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
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      hintText: "Enter your email account",
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
  ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("PassWord"),
              Container(
                margin: const EdgeInsets.only(top: 5, bottom: 10),
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(15)),
                width: double.infinity,
                height: 60,
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
                            keyboardType: TextInputType.multiline,
                            obscureText: showpass,
                            decoration: InputDecoration(
                              hintText: "Enter your password",
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
                  InkWell(
                      onTap: () {
                        setState(() {
                          showpass = !showpass;
                        });
                      },
                      child: showpass?const Icon(Icons.visibility):const Icon(Icons.visibility_off)) 
                ]),
              ),
            ],
          ),
        ),
      ],
    );
    ;
  }
}

Widget Register() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Forgot Password",
          style: TextStyle(
            fontSize: 13,
            color: Colors.black,
          ),
        ),
        Text(
          "Register",
          style: TextStyle(
            fontSize: 13,
            color: Colors.blue,
          ),
        ),
      ],
    ),
  );
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

Widget Login() {
  return Center(
      child: Container(
          margin: const EdgeInsets.symmetric(vertical: 20),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          height: 50,
          width: double.infinity,
          child: const ElevatedButton(onPressed: null, child: Text("Login"))));
}

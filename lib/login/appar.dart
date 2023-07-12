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
    title: Text(
      "Log in",
      style: TextStyle(color: Colors.black),
    ),
  );
}

Widget buildLogin(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(right: 60.w,left: 60.w,top: 30.h,bottom: 8.h),
    /* width: MediaQuery.of(context).size.width*0.6, */
    decoration: BoxDecoration(color: Colors.amber),
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        loginIcons("face.jpg"),
        loginIcons("google.png"),
      ],
    ),
  );
}

Widget loginIcons(String name) {
  return GestureDetector(
    onTap: () {},
    child: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.w),
          image: DecorationImage(
            /* fit: BoxFit.cover, */
            image: AssetImage(
              "assets/icons/${name}",
            ),
          )),
      width: 40.w,
      height: 40.h,
    ),
  );
}

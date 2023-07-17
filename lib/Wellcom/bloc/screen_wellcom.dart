
import 'package:app/service/constant.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../service/global.dart';
import 'wellcom_bloc.dart';


class Wellcome extends StatefulWidget {
  const Wellcome({super.key});

  @override
  State<Wellcome> createState() => _WellcomeState();
}

PageController pageController = PageController(initialPage: 0);

class _WellcomeState extends State<Wellcome> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(body: BlocBuilder<WellcomBloc, WellcomState>(
        builder: (context, state) {
          return Container(
            margin:const EdgeInsets.only(top: 35),
            width: 375.w,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                PageView(
                  controller: pageController,
                  onPageChanged: (index) {
                    state.pageNumber = index;
                    BlocProvider.of<WellcomBloc>(context).add(WellcomEvent()); //set state
                  },
                  children: [
                    _page(1, context,
                        textButton: "Click",
                        title: "Connect with Everyone",
                        subTitle:
                            "Alway keep in touch with tutor & friend to get receive many gifts and special discount codes ",
                        imagePath: "page_1.jpg",
                        ),
                    _page(2, context,
                        textButton: "Click",
                        title: "Connect with Everyone",
                        subTitle:
                            "Alway keep in touch with tutor & friend to get connected",
                        imagePath: "page_2.jpg",
                       ),
                    _page(3, context,
                        textButton: "Get Started",
                        title: "Connect with Everyone",
                        subTitle:
                            "Alway keep in touch with tutor & friend to get connected",
                        imagePath: "page_3.jpg",
                        )
                  ],
                ),
                Positioned(
                    bottom: 50.h,
                    child: DotsIndicator(
                      dotsCount: 3,
                      position: state.pageNumber,
                      decorator: DotsDecorator(
                          color: Colors.grey,
                          activeColor: Colors.blue,
                          size:const Size.square(10),
                          activeSize:const Size(20, 10),
                          activeShape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8))),
                    )),
              ],
            ),
          );
        },
      )),
    );
  }
}

Widget _page(int index, BuildContext context,
    {required String textButton,
    required String title,
    required String subTitle,
    required String imagePath,}) {
  return Column(
    children: [
      Container(
      margin:const EdgeInsets.only(top: 50),
        height: 320.w,
        width: double.infinity,
        child: Image.asset("assets/icons/$imagePath"),
      ),
      Container(
        margin: const EdgeInsets.only(top: 30),
        padding:const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 24.sp),
            ),
            Text(
              subTitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 14.sp, color: Colors.black.withOpacity(0.5)),
            ),
          ],
        ),
      ),
      GestureDetector(
        onTap: () {
          if (index < 3) {
            print(index);
            pageController.animateToPage(index /* page */,
                duration:const Duration(seconds: 1), curve: Curves.decelerate); 
          } else {
            /* Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) =>const SignIn())); */
            Global.storageService.setBool(AppConstant.STORAGE_DEVICE_OPEN_FIRST_TIME, true);
            Navigator.of(context).pushNamedAndRemoveUntil("/signin",(route) => false );
              /* Navigator.of(context).pushNamedAndRemoveUntil("myhome", (route) => false) */
          }
        },
        child: Container(
          margin:const EdgeInsets.only(top: 100, left: 25, right: 25),
          width: double.infinity,
          height: 50.h,
          decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(15.w),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black,
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: Offset(0, 1))
              ]),
          child: Center(
            child: Text(
              textButton,
              style: TextStyle(fontSize: 14.sp, color: Colors.white),
            ),
          ),
        ),
      ),
    ],
  );
}

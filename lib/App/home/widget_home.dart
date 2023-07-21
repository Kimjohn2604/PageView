
import 'package:app/App/component/dimension.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

import '../component/colors.dart';
import '../component/styles.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({super.key});

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  var _currPageValue = 0.0;
  var _height = Dimension.pageViewContainer;
  final double _scaleFactor = 0.8;
  final PageController pageController =
      PageController(viewportFraction: 0.85); //zoom
  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: Dimension.pageView, //(320)
          child: PageView.builder(
              controller: pageController,
              itemCount: 5,
              itemBuilder: (context, snap) {
                return _buildPageItem(snap);
              }),
        ),
        DotsIndicator(
          dotsCount: 5,
          position: _currPageValue.toInt(),
          decorator: DotsDecorator(
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
          ),
        ),
        SizedBox(
          height: Dimension.height30,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Text(
                "Popular",
                style: AppStyle.headlineStyle2,
              ),
              SizedBox(
                width: Dimension.width10,
              ),
              Text(
                "Food Pairing",
                style: AppStyle.headlineStyle4,
              )
            ],
          ),
        ),
        ColumnofPopular(
            path: "banhxeo.jpg",
            textIcon1: "Nomarl",
            textIcon2: "10km",
            textIcon3: "32min",
            title: "Bánh xèo",
            subTitle: "With characteriseries "),
        ColumnofPopular(
            path: "banhit.jpg",
            textIcon1: "Nomarl",
            textIcon2: "10km",
            textIcon3: "32min",
            title: "Bánh xèo",
            subTitle: "With characteriseries "),
        ColumnofPopular(
            path: "banhbeo.jpg",
            textIcon1: "Nomarl",
            textIcon2: "10km",
            textIcon3: "32min",
            title: "Bánh xèo",
            subTitle: "With characteriseries "),
      ],
    );
  }

///////
  Widget _buildPageItem(int index) {
    Matrix4 matrix = Matrix4.identity();
    if (index == _currPageValue.floor()) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      //1 - (1 - 1)*(1 - 0.8)
      var currTrans = _height * (1 - currScale) / 2;
      //               220* (1 - 1)/2
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currPageValue - index + 1) * (1 - _scaleFactor);
      //              0.8 + (1 - 2 + 1)* (1 -0.8)
      var currTrans = _height * (1 - currScale) / 2;
      //              220 *(1-0.8)/2
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() - 1) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      //              0.8 + (1 - 2 + 1)* (1 -0.8)
      var currTrans = _height * (1 - currScale) / 2;
      //              220 *(1-0.8)/2
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - currScale) / 2, 0);
    }
    return Transform(
      transform: matrix,
      child: Stack(children: [
        GestureDetector(
          onTap: () {
            
          },
          child: Container(
            height: Dimension.pageViewContainer, //220
            margin: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                image: const DecorationImage(
                    image: AssetImage("assets/image/banhxeo.jpg"),
                    fit: BoxFit.cover)),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: const EdgeInsets.all(10),
            height: Dimension.pageViewTextContainer, //120
            margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: Appcolor.shadeblack,
                  blurRadius: 5.0,
                  offset: const Offset(0, 5)),
              BoxShadow(
                  color: Appcolor.shadeblack,
                  blurRadius: 5.0,
                  offset: const Offset(5, 0))
            ], borderRadius: BorderRadius.circular(30), color: Colors.white),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Binh Dinh",
                  style:
                      AppStyle.headlineStyle2.copyWith(color: Appcolor.black),
                ),
                SizedBox(
                  height: Dimension.height10,
                ),
                Row(
                  children: [
                    Wrap(
                      children: List.generate(
                          5,
                          (index) => Icon(
                                Icons.star,
                                color: Appcolor.mainColor,
                                size: 17,
                              )),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text("4.5", style: AppStyle.headlineStyle4),
                    const SizedBox(
                      width: 8,
                    ),
                    Text("1000 comments", style: AppStyle.headlineStyle4)
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconandTextWidget(
                        icon: Icons.circle_sharp,
                        text: "Normal",
                        textcolor: Appcolor.shadeblack,
                        iconColor: Appcolor.iconColor1),
                    IconandTextWidget(
                        icon: Icons.location_on,
                        text: "0.3 Km",
                        textcolor: Appcolor.shadeblack,
                        iconColor: Appcolor.mainColor),
                    IconandTextWidget(
                        icon: Icons.access_time_outlined,
                        text: "15 min",
                        textcolor: Appcolor.shadeblack,
                        iconColor: Appcolor.iconColor2)
                  ],
                )
              ],
            ),
          ),
        ),
      ]),
    );
  }
}

class IconandTextWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color textcolor;
  final Color iconColor;
  const IconandTextWidget(
      {super.key,
      required this.icon,
      required this.text,
      required this.textcolor,
      required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: iconColor,
        ),
        /* const SizedBox(
          width: 1,
        ), */
        Text(
          text,
          style: TextStyle(color: textcolor),
        )
      ],
    );
  }
}

Widget ColumnofPopular(
    {required String title,
    required String subTitle,
    required String textIcon1,
    required String textIcon2,
    required String textIcon3,
    required String path}) {
  return  Container(
        color: Appcolor.iconColor1,
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.only(left: 20, right: 10),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Appcolor.mainColor,
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: AssetImage("assets/image/$path"),
                      fit: BoxFit.cover)),
              width: Dimension.screenWidth * 0.3,
              height: Dimension.pageViewTextContainer,
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(8),
                height: Dimension.pageViewTextContainer2, //100
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10), color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style:
                          AppStyle.headlineStyle2.copyWith(color: Appcolor.black),
                    ),
                    SizedBox(height: Dimension.height5),
                    Text(
                      subTitle,
                      style: AppStyle.headlineStyle4,
                    ),
                    SizedBox(height: Dimension.height5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconandTextWidget(
                            icon: Icons.circle_sharp,
                            text: textIcon1,
                            textcolor: Appcolor.shadeblack,
                            iconColor: Appcolor.iconColor1),
                        IconandTextWidget(
                            icon: Icons.location_on,
                            text: textIcon2,
                            textcolor: Appcolor.shadeblack,
                            iconColor: Appcolor.mainColor),
                        IconandTextWidget(
                            icon: Icons.access_time_outlined,
                            text: textIcon3,
                            textcolor: Appcolor.shadeblack,
                            iconColor: Appcolor.iconColor2)
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }


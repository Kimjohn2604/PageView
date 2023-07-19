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
  var _height = 220;
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
    return Container(
      color: Colors.blueAccent,
      height: 320,
      child: PageView.builder(
          controller: pageController,
          itemCount: 5,
          itemBuilder: (context, snap) {
            return _buildPageItem(snap);
          }),
    );
  }

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
        Container(
          height: 220,
          margin: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: index.isEven ? Colors.amber : Colors.greenAccent,
              image: const DecorationImage(
                  image: AssetImage("assets/image/banhxeo.jpg"),
                  fit: BoxFit.cover)),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: const EdgeInsets.all(10),
            height: 120,
            margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Appcolor.shadeblack,
                /* blurRadius: 5.0, */
                offset:const Offset(0, 5)
              ),
              BoxShadow(
                color: Appcolor.shadeblack,
                /* blurRadius: 5.0, */
                offset:const Offset(5, 0)
              )
            ],
                borderRadius: BorderRadius.circular(30), color: Colors.white),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Binh Dinh",
                  style:
                      AppStyle.headlineStyle1.copyWith(color: Appcolor.black),
                ),
                const SizedBox(
                  height: 10,
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
        const SizedBox(
          width: 1,
        ),
        Text(
          text,
          style: TextStyle(color: textcolor),
        )
      ],
    );
  }
}

import 'package:app/App/component/dimension.dart';
import 'package:app/App/controller/popular_product_controller.dart';
import 'package:app/App/controller/recommended_product_controller.dart';
import 'package:app/App/home/navigator/foodpage_details.dart';
import 'package:app/App/home/navigator/recommend_foot_page.dart';
import 'package:app/App/models/product_model.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../component/colors.dart';
import '../component/constant.dart';
import '../component/styles.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({super.key});

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  var _currPageValue = 0.0;
  final _height = Dimension.pageViewContainer;
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
        GetBuilder<PopularProDuctController>(builder: (popularProducts) {
          return popularProducts.isLoaded
              ? Container(
                  height: Dimension.pageView, //(320)
                  child: PageView.builder(
                      controller: pageController,
                      itemCount: popularProducts.popularProductList.length,
                      itemBuilder: (context, snap) {
                        return _buildPageItem(
                            snap, popularProducts.popularProductList[snap]);
                      }),
                )
              : const CircularProgressIndicator();
        }),
        GetBuilder<PopularProDuctController>(builder: (popularProducts) {
          return DotsIndicator(
            dotsCount: popularProducts.popularProductList.isEmpty
                ? 1
                : popularProducts.popularProductList.length,
            position: _currPageValue.toInt(),
            decorator: DotsDecorator(
              size: const Size.square(9.0),
              activeSize: const Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
            ),
          );
        }),
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
        GetBuilder<RecommendedProDuctController>(builder: (recommendedProduct) {
          return recommendedProduct.isLoaded
              ? ListView.builder(
                  physics: const NeverScrollableScrollPhysics(), //để cuộn
                  shrinkWrap: true,
                  itemCount: recommendedProduct.recommendedProductList.length,
                  itemBuilder: (context, index) {
                    return ColumnofPopular(
                      context,
                      recommendedProduct.recommendedProductList[index],
                      id: index
                      /* path: "banhxeo.jpg",
                    textIcon1: "Nomarl",
                    textIcon2: "10km",
                    textIcon3: "32min",
                    title: "Bánh xèo",
                    subTitle: "With characteriseries " */
                    );
                  })
              : const CircularProgressIndicator();
        }),
      ],
    );
  }

///////
  Widget _buildPageItem(int index, ProductModel popularProduct) {
    /* final pageId = Get.parameters["$index"]; */
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
          onTap: () {},
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => PopularFoodPage(
                        pageId: index,
                      )));
            },
            child: Container(
              height: Dimension.pageViewContainer, //220
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(
                      /* image: AssetImage("assets/image/banhxeo.jpg"), */
                      image: NetworkImage(AppConstants.BASE_URL +
                          "/uploads/" +
                          popularProduct.img!),
                      fit: BoxFit.cover)),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: const EdgeInsets.all(10),
            height: Dimension.pageViewTextContainer, //120
            margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
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
                  popularProduct.name!,
                  style:
                      AppStyle.headlineStyle3.copyWith(color: Appcolor.black),
                ),
                SizedBox(
                  height: Dimension.height10,
                ),
                Row(
                  children: [
                    Wrap(
                      children: List.generate(
                          popularProduct.stars!,
                          (index) => Icon(
                                Icons.star,
                                color: Appcolor.mainColor,
                                size: 17,
                              )),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(popularProduct.stars!.toString(), style: AppStyle.headlineStyle4),
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
        Text(
          text,
          style: TextStyle(color: textcolor),
        )
      ],
    );
  }
}

Widget ColumnofPopular(
BuildContext context, ProductModel recommendProduct,{required int id}) {
  return GestureDetector(
    onTap: () {
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) =>  RecommendedFoodPage(id: id)));
    },
    child: Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.only(left: 20, right: 10),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Appcolor.shadeblack,
                      blurRadius: 5.0,
                      offset: const Offset(0, 5)),
                ],
                color: Appcolor.mainColor,
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    /* image: AssetImage("assets/image/$path"), fit: BoxFit.cover */
                    image: NetworkImage("${AppConstants.BASE_URL}/uploads/${recommendProduct.img!}"))),
            width: Dimension.screenWidth * 0.3,
            height: Dimension.pageViewTextContainer,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(8),
              height: Dimension.pageViewTextContainer2, //100
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Appcolor.shadeblack,
                        blurRadius: 3.0,
                        offset: const Offset(0, 3)),
                  ],
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(15),
                      bottomRight: Radius.circular(15)),
                  color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    recommendProduct.name!,
                    style:
                        AppStyle.headlineStyle3.copyWith(color: Appcolor.black),
                  ),
                  SizedBox(height: Dimension.height5),
                  Text(
                    "subTitle",
                    style: AppStyle.headlineStyle4,
                  ),
                  SizedBox(height: Dimension.height5),
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
                          text: "15km",
                          textcolor: Appcolor.shadeblack,
                          iconColor: Appcolor.mainColor),
                      IconandTextWidget(
                          icon: Icons.access_time_outlined,
                          text: "15min",
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
    ),
  );
}

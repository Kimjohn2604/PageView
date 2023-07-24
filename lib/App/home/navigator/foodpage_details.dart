import 'package:app/App/component/dimension.dart';
import 'package:app/App/home/navigator/Expand_test.dart';
import 'package:app/App/home/navigator/icons.dart';
import 'package:flutter/material.dart';

import '../../component/colors.dart';
import '../../component/styles.dart';
import '../widget_home.dart';

class FoodPage extends StatelessWidget {
  const FoodPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: Dimension.screenHeight * 0.3,
                  decoration: BoxDecoration(
                      color: Appcolor.mainColor,
                      image: const DecorationImage(
                          image: AssetImage("assets/image/banhxeo.jpg"),
                          fit: BoxFit.cover)),
                ),
                Container(
                  padding: const EdgeInsets.all(15),
                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppIcon(icon: Icons.arrow_back),
                      AppIcon(icon: Icons.shopping_cart_checkout),
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    color: Appcolor.iconColor2,
                    borderRadius: BorderRadius.circular(15)),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Binh Dinh",
                        style: AppStyle.headlineStyle2
                            .copyWith(color: Appcolor.black),
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
                      ),
                      Text(
                        "Introduce",
                        style: AppStyle.headlineStyle2
                            .copyWith(color: Appcolor.black),
                      ),
                      const ExpandableTextWidget(
                        text:
                            "Món bánh xèo Bình Định là một món ăn truyền thống của vùng miền miền Trung Việt Nam, và nó nổi tiếng với hương vị thơm ngon và đa dạng\nNguyên liệu chất lượng: Chọn các nguyên liệu tươi ngon và chất lượng để làm bánh xèo. Điều này bao gồm bột nếp, nước dừa, thịt heo hoặc tôm tươi, gia vị và rau xanh\nNhưng quan trọng nhất là sự đam mê và tình yêu với nấu ăn. Kỹ năng có thể được rèn luyện, nhưng tình yêu và đam mê sẽ tạo ra món ăn thơm ngon, ngọt ngào và đậm đà hơn. Hy vọng rằng các yếu tố này sẽ giúp bạn làm món bánh xèo Bình Định thật ngon miệng..",
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: Container(
          height: 100,
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          decoration: BoxDecoration(
              color: Appcolor.shadeblack,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                    color: Appcolor.iconColor1,
                    borderRadius: BorderRadius.circular(15)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Icon(Icons.remove),
                    Text(
                      "0",
                      style: AppStyle.headlineStyle2,
                    ),
                    const Icon(Icons.add)
                  ],
                ),
              ),
              Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      color: Appcolor.mainColor,
                      borderRadius: BorderRadius.circular(15)),
                  child: Text(
                    "\$0.08 Add to Cart ",
                    style:
                        AppStyle.headlineStyle2.copyWith(color: Colors.white),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

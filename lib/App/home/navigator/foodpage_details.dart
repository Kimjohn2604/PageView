import 'package:app/App/bloc/test.dart';
import 'package:app/App/component/dimension.dart';
import 'package:app/App/controller/cart_controller.dart';
import 'package:app/App/controller/popular_product_controller.dart';
import 'package:app/App/home/cart_screen/cart_screen.dart';
import 'package:app/App/home/navigator/Expand_test.dart';
import 'package:app/App/home/navigator/icons.dart';
import 'package:app/App/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../component/colors.dart';
import '../../component/constant.dart';
import '../../component/styles.dart';
import '../widget_home.dart';

class PopularFoodPage extends StatelessWidget {
  final int pageId;
  const PopularFoodPage({super.key, required this.pageId});

  @override
  Widget build(BuildContext context) {
    ProductModel popularProduct =
        Get.find<PopularProDuctController>().popularProductList[pageId];
    //1 object của ProductModel
    Get.find<PopularProDuctController>()
        .initProduct(popularProduct, Get.find<CartController>());
    return SafeArea(
      child: Scaffold(
          backgroundColor: Appcolor.whiteColor,
          body: Column(
            children: [
              Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    height: Dimension.screenHeight * 0.4,
                    decoration: BoxDecoration(
                        color: Appcolor.mainColor,
                        image: DecorationImage(
                            image: NetworkImage(
                                "${AppConstants.BASE_URL}/uploads/${popularProduct.img!}"),
                            fit: BoxFit.cover)),
                  ),
                  Container(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => HomeScreen()));
                            },
                            child: AppIcon(
                              icon: Icons.arrow_back,
                              replaceColr: false,
                            )),
                        GestureDetector(onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const CartPage(displayArrow: false,)));
                        },
                          child: GetBuilder<PopularProDuctController>(
                              builder: (controller) {
                            return Stack(
                              children: [
                                AppIcon(
                                  icon: Icons.shopping_cart_checkout,
                                  replaceColr: false,
                                ),
                                // số lượng trong giỏ hàng lớn hơn 1
                                Get.find<PopularProDuctController>().totalItems >=1
                                    ? Stack(alignment: Alignment.center,
                                      children:[AppIcon(
                                          icon: Icons.circle,
                                          replaceColr: true,size: 18,
                                        ),
                                        Text('${controller.totalItems}')],
                                    )
                                    : Container(),
                              ],
                            );
                          }),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          popularProduct.name!,
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
                            Text("1000 comments",
                                style: AppStyle.headlineStyle4)
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
          bottomNavigationBar:
              GetBuilder<PopularProDuctController>(builder: (popularIntansce) {
            return Container(
              height: 100,
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              decoration: BoxDecoration(
                  color: Appcolor.shadeblack,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        color: Appcolor.iconColor1,
                        borderRadius: BorderRadius.circular(15)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                            onTap: () {
                              popularIntansce.setQuantity(false);
                            },
                            child: Icon(Icons.remove, color: Appcolor.black)),
                        SizedBox(width: Dimension.width10),
                        Text(
                          '${popularIntansce.tong}',
                          style: AppStyle.headlineStyle2,
                        ),
                        SizedBox(width: Dimension.width10),
                        InkWell(
                            onTap: () {
                              popularIntansce.setQuantity(true);
                            },
                            child: Icon(
                              Icons.add,
                              color: Appcolor.black,
                            )),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      popularIntansce.addItem(
                          popularProduct); //có dạng object của ProductModel
                      popularIntansce.initProduct(popularProduct, Get.find<CartController>());//test
                    },
                    child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            color: Appcolor.mainColor,
                            borderRadius: BorderRadius.circular(15)),
                        child: Text(
                          "\$${popularProduct.price} to Cart ",
                          style: AppStyle.headlineStyle2
                              .copyWith(color: Colors.white),
                        )),
                  ),
                ],
              ),
            );
          })),
    );
  }
}

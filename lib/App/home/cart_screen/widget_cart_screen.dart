import 'package:app/App/controller/cart_controller.dart';
import 'package:app/App/controller/popular_product_controller.dart';
import 'package:app/App/controller/recommended_product_controller.dart';
import 'package:app/App/home/navigator/foodpage_details.dart';
import 'package:app/App/home/navigator/recommend_foot_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../component/colors.dart';
import '../../component/constant.dart';
import '../../component/dimension.dart';
import '../../component/styles.dart';

Widget ColumnofCart(BuildContext context) {
  return GetBuilder<CartController>(builder: (controller) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: controller.getItems.length,
        itemBuilder: ((context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            padding: const EdgeInsets.only(left: 20, right: 10),
            child: Row(
              children: [
                //Tạo 2 index của 2 page popular và recommend.
                //2 page đều nhận vào 1 int của index (page id)
                GestureDetector(
                  onTap: () {
                    int popularIndex = Get.find<PopularProDuctController>()
                        .popularProductList
                        .indexOf(controller.getItems[index].product);
                      print(controller.getItems[index].product!.id.toString());
                    if (popularIndex >= 0) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  PopularFoodPage(pageId: popularIndex)));
                    } else {
                      int recommendIndex =
                          Get.find<RecommendedProDuctController>()
                              .recommendedProductList
                              .indexOf(controller.getItems[index].product);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  RecommendedFoodPage(id: recommendIndex)));
                    }
                  },
                  child: Container(
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
                            /* image: AssetImage("assets/image/banhbeo.jpg"), */
                            image: NetworkImage(AppConstants.BASE_URL +
                                "/uploads/" +
                                '${controller.getItems[index].img}'))),
                    width: Dimension.screenWidth * 0.28,
                    height: Dimension.pageViewTextContainer,
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(10),
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
                        color: Appcolor.whiteColor),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${controller.getItems[index].name}',
                          style: AppStyle.headlineStyle3
                              .copyWith(color: Appcolor.black),
                        ),
                        Text(
                          "subTitle",
                          style: AppStyle.headlineStyle4,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '\$${controller.getItems[index].price}',
                              style: AppStyle.headlineStyle3
                                  .copyWith(color: Appcolor.iconColor2),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15)),
                              child: Row(
                                children: [
                                  InkWell(
                                      onTap: () {
                                        controller.addItem(
                                            controller.getItems[index].product!,
                                            -1);
                                      },
                                      child: Icon(Icons.remove,
                                          color: Appcolor.black)),
                                  SizedBox(width: Dimension.width10),
                                  Text(
                                    '${controller.getItems[index].quantity}',
                                    style: AppStyle.headlineStyle3,
                                  ),
                                  SizedBox(width: Dimension.width10),
                                  InkWell(
                                      onTap: () {
                                        controller.addItem(
                                            controller.getItems[index].product!,
                                            1);
                                      },
                                      child: Icon(
                                        Icons.add,
                                        color: Appcolor.black,
                                      )),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }));
  });
}

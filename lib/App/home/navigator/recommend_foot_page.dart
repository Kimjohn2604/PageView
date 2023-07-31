import 'package:app/App/bloc/test.dart';
import 'package:app/App/component/colors.dart';
import 'package:app/App/component/dimension.dart';
import 'package:app/App/component/styles.dart';
import 'package:app/App/controller/recommended_product_controller.dart';
import 'package:app/App/home/navigator/Expand_test.dart';
import 'package:app/App/home/navigator/icons.dart';
import 'package:app/App/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../component/constant.dart';

class RecommendedFoodPage extends StatelessWidget {
  final int id;
  const RecommendedFoodPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    ProductModel recommendProduct =
        Get.find<RecommendedProDuctController>().recommendedProductList[id];
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              title: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  },
                  child: AppIcon(icon: Icons.clear)),
              bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(0),
                  child: Container(
                      
                      padding: const EdgeInsets.only(top: 5, bottom: 10),
                      width: double.maxFinite,
                      color: Appcolor.whiteColor,
                      child: Center(
                          child: Text(
                        "Tiêu đề",
                        style: AppStyle.headlineStyle1,
                      )))),
              pinned: true, // cố định tiêu đề
              backgroundColor: Appcolor.whiteColor,
              expandedHeight: Dimension.screenHeight * 0.45,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  decoration: BoxDecoration(
                      color: Appcolor.mainColor,
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          /* image: AssetImage("assets/image/$path"), fit: BoxFit.cover */
                          image: NetworkImage(AppConstants.BASE_URL +
                              "/uploads/" +
                              recommendProduct.img!))),
                ),
              ),
            ),
            SliverToBoxAdapter(
                child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: const ExpandableTextWidget(
                text:
                    "Món bánh xèo Bình Định là một món ăn truyền thống của vùng miền miền Trung Việt Nam, và nó nổi tiếng với hương vị thơm ngon và đa dạng. Dưới đây là một số yếu tố quan trọng để làm món bánh xèo Bình Định ngon,Nguyên liệu chất lượng: Chọn các nguyên liệu tươi ngon và chất lượng để làm bánh xèo. Điều này bao gồm bột nếp, nước dừa, thịt heo hoặc tôm tươi, gia vị và rau xanh.Bột bánh xèo: Bột bánh xèo Bình Định thường được làm từ bột nếp, nước dừa và nước mắm, tạo nên màu vàng hấp dẫn. Bạn cần phải trộn đều bột để không có cục bột và để bánh có màu đẹp.Nhân: Để bánh xèo thơm ngon, bạn cần chọn những nguyên liệu nhân phù hợp. Thịt heo, tôm, gia vị như hành lá, hành phi, đậu xanh đã nấu chín và thêm một ít giá, rau mùi sẽ làm cho bánh xèo thêm đậm đà hương vị.Phương pháp chiên: Chiên bánh xèo cần chú ý đến lửa, bánh xèo nên được chiên ở lửa nhỏ và phủ nắp, để bánh chín đều và không bị khô, vỏ bánh xèo sau khi chín nên mỏng, giòn và không quá dày.",
              ),
            ))
          ],
        ),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min, //
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AppIcon(icon: Icons.remove),
                Text(
                  "\$${recommendProduct.price} x 0",
                  style: AppStyle.headlineStyle2,
                ),
                AppIcon(icon: Icons.add),
              ],
            ),
          ),
          Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: Appcolor.mainColor,
                  borderRadius: BorderRadius.circular(15)),
              child: Text(
                "\$${recommendProduct.price} Add to Cart ",
                style: AppStyle.headlineStyle2.copyWith(color: Colors.white),
              )),
        ],
      ),
    );
  }
}

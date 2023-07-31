import 'package:get/get.dart';

import '../data/repository/recommended_product_repo.dart';
import '../models/product_model.dart';

class RecommendedProDuctController extends GetxController {
  final RecommendedProDuctRepo
      recommendedProDuctRepo; //để gọi function Future trong popularRepo

  RecommendedProDuctController({required this.recommendedProDuctRepo});
  List<dynamic> _recommendedProductList = []; // set Data vào trong list này

  List<dynamic> get recommendedProductList => _recommendedProductList;
  bool isLoaded = false;
  Future<void> getRecommendedProDuctList() async {
    Response response = await recommendedProDuctRepo.getRecommendedProDuctList(); //uri
    if (response.statusCode == 200) {
      //gọi file này => file repo => file api client => trả về respone
      print("got products recommend");
      _recommendedProductList = [];
      _recommendedProductList.addAll(Product.fromJson(response.body!).products);
      isLoaded=true;
      update();
    } else {}
  }
}
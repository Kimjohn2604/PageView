import 'package:app/App/models/product_model.dart';
import 'package:get/get.dart';

import '../data/repository/popular_product_repo.dart';

class PopularProDuctController extends GetxController {
  final PopularProDuctRepo
      popularProDuctRepo; //để gọi function Future trong popularRepo

  PopularProDuctController({required this.popularProDuctRepo});
  List<dynamic> _popularProductList = []; // set Data vào trong list này

  List<dynamic> get popularProductList => _popularProductList;

  Future<void> getPopularProDuctList() async {
    Response response = await popularProDuctRepo.getPopularProDuctList(); //uri
    if (response.statusCode == 200) {
      //gọi file này => file repo => file api client => trả về respone
      print("got products");
      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(response.body!).products);
      update();
    } else {}
  }
}

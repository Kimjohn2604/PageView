import 'package:app/App/component/constant.dart';
import 'package:app/App/controller/cart_controller.dart';
import 'package:app/App/controller/popular_product_controller.dart';
import 'package:app/App/data/api/api_client.dart';
import 'package:app/App/data/repository/cart_repo.dart';
import 'package:app/App/data/repository/popular_product_repo.dart';
import 'package:app/App/data/repository/recommended_product_repo.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controller/recommended_product_controller.dart';

Future<void> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(()=>sharedPreferences);
  //điều này có nghĩa là khi một phiên bản của một lớp được tạo ra, nó sẽ tự động nhận các phụ thuộc cần thiết. 
  //Tiếp tục giúp quản lý và chia sẻ các phiên bản của các lớp trong ứng dụng một cách hiệu quả.

  // Đăng ký(lazyPut) ApiClient vào container với baseUrl cụ thể
  Get.lazyPut(() => ApiClient(appBaseURL: AppConstants.BASE_URL));

  Get.lazyPut(() => PopularProDuctRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProDuctRepo(apiClient: Get.find()));
  Get.lazyPut(() => CartRepo(sharedPreferences: Get.find()));

  Get.lazyPut(() => PopularProDuctController(popularProDuctRepo: Get.find()));
  Get.lazyPut(() => RecommendedProDuctController(recommendedProDuctRepo: Get.find()));
  Get.lazyPut(fenix:true,() => CartController(cartRepo: Get.find()));
  //khi sự phụ thuộc đã được tạo ra và được truy cập lần nữa, nó sẽ không bị xóa đi
}

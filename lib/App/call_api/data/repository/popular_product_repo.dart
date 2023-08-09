import 'package:app/App/component/constant.dart';
import 'package:get/get.dart';
import '../api/api_client.dart';

class PopularProDuctRepo extends GetxService {
  // vì nó liên quan đến loading data from internet
  final ApiClient apiClient;
  PopularProDuctRepo({required this.apiClient});
  Future<Response> getPopularProDuctList() async {
    return await apiClient.getData(AppConstants.POPULAR_PRODUCT_URI);//end point
    //repo gọi api(getData) => api trả về dữ liệu => repo gửi dữ liệu về controller

  }
}

import 'package:get/get.dart';

import '../../component/constant.dart';
import '../api/api_client.dart';

class RecommendedProDuctRepo extends GetxService {
  // vì nó liên quan đến loading data from internet
  final ApiClient apiClient;
  RecommendedProDuctRepo({required this.apiClient});
  Future<Response> getRecommendedProDuctList() async {
    return await apiClient.getData(AppConstants.RECOMMENDED_PRODUCT_URI);//end point
    //repo gọi api(getData) => api trả về dữ liệu => repo gửi dữ liệu về controller

  }
}
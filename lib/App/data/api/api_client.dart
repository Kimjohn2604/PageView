import 'package:app/App/component/constant.dart';
import 'package:get/get.dart';

class ApiClient extends GetConnect implements GetxService {
  late String
      token; // mã này được khởi tạo trong Api client khi giao tiếp với Server
  final String appBaseURL;
  late Map<String, String> _mainHeaders;
  ApiClient({required this.appBaseURL}) {
    baseUrl = appBaseURL;
    //được sử dụng để tạo các yêu cầu API.
    timeout = const Duration(seconds: 30);
    //khoảng thời gian tối đa mà khách
    //hàng sẽ đợi yêu cầu API hoàn tất trước khi coi yêu cầu đó là hết thời gian chờ
    token = AppConstants.TOKEN;
    _mainHeaders = {
      'Content-type':
          'application/json; charset=UTR-8', 
          //get request(khi gửi dữ liệu đến server thì nó biết nằm trong mainheader) và mã hóa
      'Authorization':
          'Bearer $token' //khi gửi nhiều yêu cầu đến server thì cần token
    };
  }
  //hoạt động với server
  Future<Response> getData(String uri,) async {
    //
    //gọi something từ server nếu không thành công thì catch lỗi
    try {
      Response response = await get(uri);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
}

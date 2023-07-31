import 'package:app/App/models/product_model.dart';
import 'package:get/get.dart';

import '../data/repository/popular_product_repo.dart';
import 'cart_controller.dart';

class PopularProDuctController extends GetxController {
  final PopularProDuctRepo
      popularProDuctRepo; //để gọi function Future trong popularRepo

  PopularProDuctController({required this.popularProDuctRepo});

  List<dynamic> _popularProductList = []; // set Data vào trong list này
  List<dynamic> get popularProductList => _popularProductList;
  late CartController _cart; //instance Cartcontroller
  bool isLoaded = false;
  int quantity = 0;
  int inCartItems = 0;
  int get tong => inCartItems+quantity;

  Future<void> getPopularProDuctList() async {
    Response response = await popularProDuctRepo.getPopularProDuctList(); //uri
    if (response.statusCode == 200) {
      //gọi file này => file repo => file api client => trả về respone
      print("got products");
      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(response.body!).products);
      isLoaded = true;
      update();
    } else {}
  }

  // hàm thể hiện tăng hoặc giảm các mục trên những lần nhấp vào các nút +(true) -(false)
  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      inCartItems+quantity++; // không dùng đc tong bởi vì hàm get chỉ có chức năng truy cập
    } else if (inCartItems+quantity <0) {
      /*  Get.snackbar("Notice!", "you can reduce more",
          backgroundColor: Appcolor.mainColor, colorText: Appcolor.whiteColor); */
      return;
    } else {
      inCartItems+quantity--;
    }
    update();
  }

  void initProduct(ProductModel product, CartController cart) {
    quantity = 0;
    inCartItems = 0;
    _cart = cart;
    ///
    var exist = false;
    exist = _cart.isExistInCart(product);
    if(exist){
      inCartItems=_cart.getQuantity(product);
      print("${product.id}" +"-" + inCartItems.toString());
    }
    /////
  }

  void addItem(ProductModel product) {
      _cart.addItem(product, quantity);
      _cart.items.forEach((key, value) {
        print("${value.quantity}");
      });
    /* else {
      Get.snackbar("Notice!", "You should add at least one item",
          backgroundColor: Appcolor.mainColor, colorText: Appcolor.whiteColor);
    } */
  }
}

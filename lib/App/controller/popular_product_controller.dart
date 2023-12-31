import 'package:app/App/models/product_model.dart';
import 'package:get/get.dart';

import '../component/colors.dart';
import '../data/repository/popular_product_repo.dart';
import '../models/cart_model.dart';
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
  int get tong => inCartItems + quantity;

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
      inCartItems +
          quantity++; // không dùng đc tong bởi vì hàm get chỉ có chức năng truy cập
    } else if (inCartItems + quantity < 1) {
      Get.snackbar("Notice!", "you can reduce more",
          backgroundColor: Appcolor.mainColor, colorText: Appcolor.whiteColor);
      return;
    } else {
      inCartItems + quantity--;
    }
    update();
  }
  int valueofItem(ProductModel product){
    var total=0;
    total=tong*product.price!;
     return total;// tính toán số tiền
  }

  void initProduct(ProductModel product, CartController cart) {
    quantity = 0;
    inCartItems = 0;
    _cart = cart;

    ///
    var exist = false;
    exist = _cart.isExistInCart(product);
    if (exist) {
      inCartItems = _cart.getQuantity(product);
      print("${product.id}" + "-" + inCartItems.toString());
    }
    /////
  }

  void addItem(ProductModel product) {
    /* if (tong == 0) {
      _cart.items.removeWhere((key, value) {
        return key == product.id!;
      });
      update();
      return;
    } */
    _cart.addItem(product, quantity);
    _cart.items.forEach((key, value) {
      print("${tong}");
    });
    update();
  }

  int get totalItems {
    return _cart.totalItems;
  }

  List<CartModel> get getItems {
    return _cart.getItems;
  }
  int get totalItemsInCart{
    return _cart.totalItemsInCart;
  }
}

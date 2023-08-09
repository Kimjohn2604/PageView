import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../models/cart_model.dart';

class CartRepo {
  final SharedPreferences sharedPreferences;
  CartRepo({required this.sharedPreferences});
  List<String> cart = [];

  void addToCartList(List<CartModel> cartList) {
    cart = [];
    cartList.forEach((element) => cart.add(jsonEncode(element)));
    //chuyển đổi danh sách các phần tử trong cartList thành
    //các chuỗi JSON đã được mã hóa và sau đó thêm chúng vào danh sách cart
    sharedPreferences.setStringList("Cart-list", cart);
    //print(sharedPreferences.getStringList("Cart-list"));
  }

  List<CartModel> getCartList() {
    List<String> carts = [];
    //kiểm tra khóa có tồn tại hay không, có thì trả vào list carts
    if (sharedPreferences.containsKey("Cart-list")) {
      carts = sharedPreferences.getStringList("Cart-list")!;
    }
    List<CartModel> cartList = [];
    carts.forEach((element) => CartModel.fromJson(jsonDecode(element)));
    //add các khóa dạng chuỗi vào cartList

    return cartList;
  }
}

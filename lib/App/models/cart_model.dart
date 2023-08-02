import 'package:app/App/models/product_model.dart';

class CartModel {
  int? id;
  String? name;
  int? price;
  String? img;
  int? quantity;
  bool? isExist;
  String? time; 
  ProductModel? product;
  CartModel(
      {this.id,
      this.name,
      this.price,
      this.quantity,
      this.img,
      this.isExist, //
      this.time,
      this.product}); // 
  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id']; 
    name = json['name'];
    price = json['price'];
    img = json['img'];
    isExist = json['isExist'];
    time = json['time'];
    quantity = json['quantiy'];
    product= ProductModel.fromJson(json['product']);
  }
}
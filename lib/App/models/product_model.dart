class Product {
  int? _totalSize;
  int? _typeId;
  int? _offset;

  late List<ProductModel> _products;
  List<ProductModel> get products => _products;

  Product(
      {required totalSize,
      required typeID,
      required offset,
      required products}) {
    this._totalSize = totalSize;
    this._typeId = typeID;
    this._offset = offset;
    this._products = products;
  }
  // khi gọi intensen thông qua map có dữ liệu => var obj = Product.fromJson(map)
  // obi.totalSize = ...
  Product.fromJson(Map<String, dynamic> json) {
    _totalSize = json['total_size'];
    _typeId = json['type_id'];
    _offset = json['offset'];
    if (json['products'] != null) {
      _products = <ProductModel>[];
      /* for(var value in json["products"]){
        _products.add(ProductModel.fromJson(value));
      } */
      (json['products'] as List).forEach((v) {
        _products.add(ProductModel.fromJson(v));
      });
    }
  }
}

class ProductModel {
  int? id;
  String? name;
  String? description;
  int? price;
  int? stars;
  String? img;
  String? location;
  String? createdAt;
  String? updateAt;
  int? typeId;
  ProductModel(
      {this.id,
      this.name,
      this.description,
      this.price,
      this.stars,
      this.img,
      this.location, //Viet Nam
      this.createdAt, //2023-7-26 15:04:40
      this.updateAt, //2024-7-26 15:04:40
      this.typeId}); // 2
  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id']; 
    name = json['name'];
    description = json['description'];
    price = json['price'];
    stars = json['stars'] ;
    img = json['img'];
    location = json['location'];
    createdAt = json['created_at'];
    updateAt = json['updated_at'];
    typeId = json['type_id'] ;
  }
   Map<String, dynamic> toJson() {
    return {
      "id": this.id,
      "name": this.name,
      "price": this.price,
      "img": this.img,
      "location": this.location,
      "createdAt": this.createdAt,
      "updateAt": this.updateAt,
      "typeId": this.typeId,
    };
  }
}

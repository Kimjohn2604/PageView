import 'package:app/App/data/repository/cart_repo.dart';
import 'package:app/App/models/cart_model.dart';
import 'package:app/App/models/product_model.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  final CartRepo cartRepo;
  CartController({required this.cartRepo});
  Map<int, CartModel> items = {};

  void addItem(ProductModel product, int quantity) {
    /* print("${product.id}""${quantity}"  ); */
    //nếu các key trong items đã có thì nó update, còn chưa có thì putifabsent
    if (items.containsKey(product.id)) {
      items.update(product.id!, (value) {
        return CartModel(
          id: value.id,
          name: value.name,
          price: value.price,
          img: value.img,
          time: DateTime.now().toString(),
          isExist: true,
          quantity: value.quantity! + quantity, //value.quantity là số lượng item đã có trong giỏ hàng
        );
      });
    } else {}
    items.putIfAbsent(product.id!, () {
      return CartModel(
        id: product.id,
        name: product.name,
        price: product.price,
        img: product.img,
        time: DateTime.now().toString(),
        isExist: true,
        quantity: quantity,
      );
    });
    //Nếu key không chứa trong Map sẽ được thêm mới,
    //nếu key đã tồn tại thì value sẽ được update thành value mới được truyền vào.
  }
  bool isExistInCart(ProductModel product){
    if(items.containsKey(product.id)){
      return true;
    }
    else{
      return false;
    }
  }
  int getQuantity(ProductModel product){
    int quantity=0; // số dùng hiển thị
    if(items.containsKey(product.id)){//kiểm tra item có được chọn trong giỏ hàng hay chưa
      items.forEach((key, value) { 
        if(key==product.id){
          quantity=value.quantity!; //hiển thị bằng các số đã có
        
        }
      });
    }
    return quantity; // hàm trả về số lượng các item đã có trong giỏ hàng, (có bao nhiêu thì hiện bao nhiêu)
  }
}

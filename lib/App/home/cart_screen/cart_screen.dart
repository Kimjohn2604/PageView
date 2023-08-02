import 'package:app/App/bloc/test.dart';
import 'package:app/App/component/dimension.dart';
import 'package:app/App/home/cart_screen/widget_cart_screen.dart';
import 'package:app/App/home/navigator/icons.dart';
import 'package:flutter/material.dart';
import '../../component/colors.dart';

class CartPage extends StatelessWidget {
  final bool displayArrow;
  const CartPage({super.key, required this.displayArrow});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(1.0),
              child: Container(
                color: Colors.grey.withOpacity(0.5),
                height: 1.0,
              ),
            ),
            automaticallyImplyLeading: displayArrow ? false : true,
            backgroundColor: Appcolor.whiteColor,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                    onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => HomeScreen())),
                    child: AppIcon(icon: Icons.home, replaceColr: false)),
                SizedBox(
                  width: Dimension.width20,
                ),
                AppIcon(icon: Icons.shopping_cart, replaceColr: false)
              ],
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                ColumnofCart(context),
              ],
            ),
          )),
    );
  }
}

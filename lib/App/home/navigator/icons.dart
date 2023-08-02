import 'package:app/App/component/colors.dart';
import 'package:flutter/material.dart';

class AppIcon extends StatelessWidget {
  final IconData icon;
  final Color iconColor = Appcolor.whiteColor;
  final double size;
  final bool replaceColr;
  final Color backgroundColor=Appcolor.mainColor;
   AppIcon(
      {super.key,
      required this.icon,
      this.size = 40,required this.replaceColr});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size / 2),
        color:replaceColr? Appcolor.whiteColor: backgroundColor,
      ),
      child: Icon(
        icon,
        color: iconColor,
        size: 20,
      ),
    );
  }
}

import 'dart:async';

import 'package:app/App/controller/popular_product_controller.dart';
import 'package:app/App/controller/recommended_product_controller.dart';
import 'package:app/Wellcom/bloc/screen_wellcom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
  
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin{
  late Animation<double> animation; // 2 biến kiểm soát hoạt ảnh
  late AnimationController controller;
  Future<void> _loadResoure() async {
    await Get.find<PopularProDuctController>().getPopularProDuctList();
    await Get.find<RecommendedProDuctController>().getRecommendedProDuctList();
  }
  @override
  void initState(){
    super.initState();
    _loadResoure();
    controller = AnimationController(vsync: this,duration:const Duration(seconds: 2))..forward();
    /* controller = controller.forward() as AnimationController; */
    animation = CurvedAnimation(parent: controller, curve: Curves.linear);
    Timer(const Duration(seconds: 2), () { Navigator.of(context).push(MaterialPageRoute(builder: (_)=>const Wellcome()));});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ScaleTransition(scale: animation,
            child: Center(child: Image.asset("name")))
        ],
      ),
    );
  }
}

import 'package:get/get.dart';

class Dimension{
  static double screenHeight= Get.context!.height;
  static double screenWidth= Get.context!.width;

  static double pageView = screenHeight/2.44; // (780/220)
  static double pageViewContainer = screenHeight/3.54; // (780/220)
  static double pageViewTextContainer = screenHeight/6.5;
  static double pageViewTextContainer2 = screenHeight/7.8; // (780/120)
  static double pageViewContainerPopular = screenHeight/5.2;
  static double height5 = screenHeight/156;
  static double height10 = screenHeight/78;
  static double height20 = screenHeight/39;
  static double height30 = screenHeight/26; // (780/120)
  static double width10 = screenWidth/39.3;
}
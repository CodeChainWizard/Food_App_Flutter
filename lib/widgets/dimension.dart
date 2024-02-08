import 'package:get/get.dart';

class Dimensions{

  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  // 932/220 = 4.24
  static double pageViewContainer = screenHeight/4.24;
  // 932/120 = 7.77
  static double pageViewTextContainer = screenHeight/7.77;

  // ------Main container Box Dimensions
  // 932/320 = 2.88
  static double pageView = screenHeight/2.88;

  //XXXXXXXXXXX

  // Fix height overflow
  // ---- Dynamic Height padding and margin
  // 923/10 = 92.3
  static double height10 = screenHeight/92.3;
  //923/15 = 61.53
  static double height15 = screenHeight/61.53;
  // 923/20 = 46.15
  static double height20 = screenHeight/46.15;
  static double height30 = screenHeight/30.77;
  static double height45 = screenHeight/20.51;
  // ---- Dynamic width padding and margin

  // 923/10 = 92.3
  static double width_10 = screenHeight/92.3;
  //923/15 = 61.53
  static double width15 = screenHeight/61.53;
  // 923/20 = 46.15
  static double width20 = screenHeight/46.15;
  static double width30 = screenHeight/30.77;
  static double width45 = screenHeight/20.51;

  // Font size
  static double font16 = screenHeight/57.69;
  static double font20 = screenHeight/46.15;
  static double font26 = screenHeight/35.5;

  static double radious15 = screenHeight/63.53;
  static double radious20 = screenHeight/46.15;

  // 923/30 = 30.76
  static double radious30 = screenHeight/30.76;


  // Icons size
  static double iconsSize24 = screenHeight/38.25;
  static double iconsSize16 = screenHeight/57.69;


  // ListView Size
  static double listViewImgSize = screenWidth/3.25;
  static double listViewTextContSize = screenWidth/3.9;

  // popular food
  // 923/350 = 2.64
  static double popularFoodImgSize = screenHeight/2.64;


  // bottom height
   static double bottomHeightBar = screenHeight/7.69;

}
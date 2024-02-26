import 'package:flutter/material.dart';
import 'package:food_delivery/data/controllers/popular_product_controller.dart';
import 'package:food_delivery/data/controllers/recommended_product_controller.dart';
import 'package:food_delivery/pages/Home/Main_Food_Page.dart';
import 'package:food_delivery/pages/food/popular_food_details.dart';
import 'package:food_delivery/pages/food/recommended_food_detail.dart';
import 'package:food_delivery/routes/route_helper.dart';
import 'package:get/get.dart';
import 'helper/dependinces.dart' as dep;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<PopularProductController>().getPopularProductList();
    Get.find<RecommendedProductController>().getRecommendedProductList();
    return GetMaterialApp(
      title: 'Food App',
      debugShowCheckedModeBanner: false,

      home: MainFoodPage(),
      // home: const PopularFoodDetail(),
      // home: const RecommendedFoodDetail(),
      initialRoute: RouteHelper.initial,
      getPages: RouteHelper.routes,
    );
  }
}
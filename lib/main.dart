import 'package:flutter/material.dart';
import 'package:food_delivery/data/controllers/popular_product_controller.dart';
import 'package:food_delivery/pages/Home/Main_Food_Page.dart';
import 'package:food_delivery/pages/food/popular_food_details.dart';
import 'package:food_delivery/pages/food/recommended_food_detail.dart';
import 'package:get/get.dart';
import 'helper/dependencies.dart' as dep;

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
    return GetMaterialApp(
      title: 'Food App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const MainFoodPage(),
      // home: const PopularFoodDetail(),
      home: const RecommendedFoodDetail(),
    );
  }
}


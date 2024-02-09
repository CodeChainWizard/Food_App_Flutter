import 'package:food_delivery/data/api/api_client.dart';
import 'package:food_delivery/data/controllers/popular_product_controller.dart';
import 'package:food_delivery/data/repository/popular_product_repo.dart';
import 'package:get/get.dart';

Future<void> init() async{
  // Api Client
  Get.lazyPut(()=> ApiClient(appBarUrl: "https://mvs.bslmeiyu.com"));

  // Repos
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));

  // Product Controllers
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));


}
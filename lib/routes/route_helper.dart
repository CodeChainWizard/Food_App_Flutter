import 'package:food_delivery/pages/Home/Main_Food_Page.dart';
import 'package:food_delivery/pages/food/popular_food_details.dart';
import 'package:food_delivery/pages/food/recommended_food_detail.dart';
import 'package:get/get.dart';

class RouteHelper{
  static const String initial = "/";
  static const String popularFood = "/popular-food";
  static const String recommendedFood = "/recommended-food";

  static String getInitial()=>'$initial';
  static String getPopularFood(int pageId)=> '$popularFood?pageId=$pageId';
  static String getRecommendedFood(int recommendedPageId)=> '$recommendedFood?recommendedPageId=$recommendedPageId';

  static List<GetPage> routes = [
    GetPage(name: getInitial(), page: ()=>MainFoodPage()),

    GetPage(name: popularFood, page: (){
      var pageId = Get.parameters['pageId'];
      return PopularFoodDetail(pageId: int.parse(pageId!));
    },
      transition: Transition.fadeIn
    ),

    GetPage(name: recommendedFood, page: (){
      var recommendedPageId = Get.parameters['recommendedPageId'];
      return RecommendedFoodDetail(recommendedPageId: int.parse(recommendedPageId!));
    },
      transition: Transition.fadeIn
    ),
  ];
}
import 'package:food_delivery/pages/Cart/CartPage.dart';
import 'package:food_delivery/pages/Home/Main_Food_Page.dart';
import 'package:food_delivery/pages/Home/home_page.dart';
import 'package:food_delivery/pages/food/popular_food_details.dart';
import 'package:food_delivery/pages/food/recommended_food_detail.dart';
import 'package:food_delivery/pages/splash/splash_screen.dart';
import 'package:get/get.dart';

class RouteHelper{
  static const String initial = "/";
  static const String popularFood = "/popular-food";
  static const String cartPage = "/cart-page";
  static const String recommendedFood = "/recommended-food";
  static const String splashPage = "/splash-page";

  static String getInitial()=>'$initial';
  static String getPopularFood(int pageId, String page)=> '$popularFood?pageId=$pageId&page=$page';
  static String getRecommendedFood(int recommendedPageId, String page)=> '$recommendedFood?recommendedPageId=$recommendedPageId&page=$page';
  static String getCartPage() => '$cartPage';
  static String getSplashPage() => '$splashPage';


  static List<GetPage> routes = [
    GetPage(name: splashPage, page: () => SplashScreen()),
    GetPage(name: initial, page: ()=>HomePage()),

    GetPage(name: popularFood, page: (){
      var pageId = Get.parameters['pageId'];
      var page = Get.parameters["page"];
      return PopularFoodDetail(pageId: int.parse(pageId!), page :page!);
    },
      transition: Transition.fadeIn
    ),

    GetPage(name: recommendedFood, page: (){
      var recommendedPageId = Get.parameters['recommendedPageId'];
      var page = Get.parameters["page"];
      return RecommendedFoodDetail(recommendedPageId: int.parse(recommendedPageId!), page: page!);
    },
      transition: Transition.fadeIn
    ),
    GetPage(name: cartPage, page: (){
      return CartPage();
    },
    transition: Transition.fadeIn
    )
  ];
}
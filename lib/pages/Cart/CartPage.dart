import 'package:flutter/material.dart';
import 'package:food_delivery/data/controllers/cart_controller.dart';
import 'package:food_delivery/data/controllers/popular_product_controller.dart';
import 'package:food_delivery/data/controllers/recommended_product_controller.dart';
import 'package:food_delivery/routes/route_helper.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/widgets/app_constarins.dart';
import 'package:food_delivery/widgets/app_icons.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/dimension.dart';
import 'package:food_delivery/widgets/small_text.dart';
import 'package:get/get.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              left: Dimensions.width20,
              right: Dimensions.width20,
              top: Dimensions.height20 * 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppIcons(
                    icon: Icons.arrow_back_ios,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.mainColor,
                    iconSize: Dimensions.iconsSize24,
                  ),
                  SizedBox(
                    width: Dimensions.width20 * 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(RouteHelper.getInitial());
                    },
                    child: AppIcons(
                      icon: Icons.home_outlined,
                      iconColor: Colors.white,
                      backgroundColor: AppColors.mainColor,
                      iconSize: Dimensions.iconsSize24,
                    ),
                  ),
                  AppIcons(
                    icon: Icons.shopping_cart,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.mainColor,
                    iconSize: Dimensions.iconsSize24,
                  ),
                ],
              )),
          Positioned(
              top: Dimensions.height20 * 5,
              left: Dimensions.width20,
              right: Dimensions.width20,
              bottom: 0,
              child: Container(
                margin: EdgeInsets.only(top: Dimensions.height15),
                child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: GetBuilder<CartController>(builder: (cartController) {
                    var _cartList = cartController.getItems;
                    return ListView.builder(
                        itemCount: _cartList.length,
                        itemBuilder: (_, index) {
                          return Container(
                            width: double.maxFinite,
                            height: Dimensions.height20 * 5,
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    var popularIndex =
                                        Get.find<PopularProductController>()
                                            .popularProductList
                                            .indexOf(_cartList[index].product!);
                                    if (popularIndex >= 0) {
                                      Get.toNamed(RouteHelper.getPopularFood(
                                          popularIndex, "cartpage"));
                                    } else {
                                      var recommendedIndex = Get.find<
                                              RecommendedProductController>()
                                          .recommendedProductList
                                          .indexOf(_cartList[index].product!);
                                      Get.toNamed(
                                          RouteHelper.getRecommendedFood(
                                              recommendedIndex, "cartpage"));
                                    }
                                  },
                                  child: Container(
                                    width: Dimensions.height20 * 5,
                                    height: Dimensions.height20 * 5,
                                    margin: EdgeInsets.only(
                                        bottom: Dimensions.height10),
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                AppConstrains.BASE_URL +
                                                    AppConstrains.UPLOAD_URL +
                                                    cartController
                                                        .getItems[index].img!),
                                            fit: BoxFit.cover),
                                        borderRadius: BorderRadius.circular(
                                            Dimensions.radious20),
                                        color: Colors.white),
                                  ),
                                ),

                                // Expended Widget use for use all free space of parent container
                                SizedBox(
                                  width: Dimensions.width_10,
                                ),
                                Expanded(
                                    child: Container(
                                  height: Dimensions.height20 * 5,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      BigText(
                                        text: cartController
                                            .getItems[index].name!,
                                        color: Colors.black45,
                                      ),
                                      SmallText(text: "Spicy"),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          BigText(
                                            text:
                                                "\$ ${cartController.getItems[index].price!.toString()}",
                                            color: Colors.black45,
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(
                                                top: Dimensions.height10,
                                                bottom: Dimensions.height10,
                                                left: Dimensions.width_10,
                                                right: Dimensions.width_10),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      Dimensions.radious20),
                                              color: Colors.white,
                                            ),
                                            child: Row(
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    // popularProduct.setQuantity(false);
                                                    cartController.addItem(
                                                        _cartList[index]
                                                            .product!,
                                                        -1);
                                                  },
                                                  child: Icon(
                                                    Icons.remove,
                                                    color: AppColors.signColor,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width:
                                                      Dimensions.width_10 / 2,
                                                ),
                                                // BigText(text: popularProduct.inCartItem.toString()),
                                                BigText(
                                                    text: _cartList[index]
                                                        .quantity
                                                        .toString()),
                                                SizedBox(
                                                  width:
                                                      Dimensions.width_10 / 2,
                                                ),
                                                GestureDetector(
                                                    onTap: () {
                                                      cartController.addItem(
                                                          _cartList[index]
                                                              .product!,
                                                          1);
                                                    },
                                                    child: Icon(Icons.add,
                                                        color: AppColors
                                                            .signColor)),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )),
                              ],
                            ),
                          );
                        });
                  }),
                ),
              )),
        ],
      ),
      bottomNavigationBar: GetBuilder<CartController>(
        builder: (cartController) {
          return Container(
            height: Dimensions.bottomHeightBar,
            padding: EdgeInsets.only(
              top: Dimensions.height30,
              bottom: Dimensions.height30,
              left: Dimensions.width20,
              right: Dimensions.width20,
            ),
            decoration: BoxDecoration(
              color: AppColors.bottomBackgroundColor,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(Dimensions.radious20 * 2),
                topLeft: Radius.circular(Dimensions.radious20 * 2),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Bottom remove and add button.
                Container(
                  padding: EdgeInsets.only(
                      top: Dimensions.height10,
                      bottom: Dimensions.height10,
                      left: Dimensions.width_10,
                      right: Dimensions.width_10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radious20),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: Dimensions.width_10 / 2,
                      ),
                      BigText(text: "\$ ${cartController.totalAmount}"),
                      SizedBox(
                        width: Dimensions.width_10 / 2,
                      ),
                    ],
                  ),
                ),

                // Create an Add to cart Button
                Container(
                  padding: EdgeInsets.only(
                      top: Dimensions.height10,
                      bottom: Dimensions.height10,
                      left: Dimensions.width_10,
                      right: Dimensions.width_10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radious20),
                    color: AppColors.mainColor,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      // popularProduct.addItem(product);
                    },
                    child: BigText(
                      text: "Check Out",
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

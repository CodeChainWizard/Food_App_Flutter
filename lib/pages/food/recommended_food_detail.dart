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
import 'package:food_delivery/widgets/expendable_text_widget.dart';
import 'package:get/get.dart';

class RecommendedFoodDetail extends StatelessWidget {
  var recommendedPageId;
  final String page;
  RecommendedFoodDetail({required this.recommendedPageId, required this.page, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var RecommendedPageId = Get.find<RecommendedProductController>()
        .recommendedProductList[recommendedPageId];
    // print("Recommended ID is:="+recommendedPageId.toString());
    // print("RecommendedFood Name:="+RecommendedPageId.name.toString());
    Get.find<PopularProductController>()
        .initProduct(RecommendedPageId, Get.find<CartController>());
    return Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              toolbarHeight: 70,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        if (page == "cartpage") {
                          Get.toNamed(RouteHelper.getCartPage());
                        } else {
                          Get.toNamed(RouteHelper.getInitial());
                        }
                      },
                      child: const AppIcons(icon: Icons.clear)),
                  // const AppIcons(icon: Icons.shopping_cart_outlined),
                  GetBuilder<PopularProductController>(builder: (controller) {
                    return GestureDetector(
                      onTap: () {
                        if (controller.totalItems >= 1) {
                          Get.toNamed(RouteHelper.getCartPage());
                        }
                      },
                      child: Stack(
                        children: [
                          const AppIcons(icon: Icons.shopping_cart_outlined),
                          Get.find<PopularProductController>().totalItems >= 1
                              ? const Positioned(
                                  right: 0,
                                  top: 0,
                                  child: AppIcons(
                                    icon: Icons.circle,
                                    size: 20,
                                    iconColor: Colors.transparent,
                                    backgroundColor: AppColors.mainColor,
                                  ),
                                )
                              : Container(),
                          controller.totalItems >= 1
                              ? Positioned(
                                  right: 5,
                                  top: 2,
                                  child: BigText(
                                    text: Get.find<PopularProductController>()
                                        .totalItems
                                        .toString(),
                                    size: 14,
                                    color: Colors.white,
                                  ),
                                )
                              : Container(),
                        ],
                      ),
                    );
                  }),
                ],
              ),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(35),
                child: Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.only(top: 5, bottom: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(Dimensions.radious20),
                          topRight: Radius.circular(Dimensions.radious20))),
                  child: Center(
                      child: BigText(
                    text: RecommendedPageId.name!,
                    size: Dimensions.font26,
                  )),
                ),
              ),
              pinned: true,
              expandedHeight: 300,
              backgroundColor: AppColors.yellowColor,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.network(
                  AppConstrains.BASE_URL +
                      AppConstrains.UPLOAD_URL +
                      RecommendedPageId.img!,
                  width: double.maxFinite,
                  fit: BoxFit.cover,
                ),
                // background: Image.asset(
                //   "assets/image/food3.jpg",
                //   width: double.maxFinite,
                //   fit: BoxFit.cover,
                // ),
              ),
            ),
            SliverToBoxAdapter(
              // margin: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20)
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        left: Dimensions.width20,
                        right: Dimensions.width20,
                        bottom: Dimensions.height20),
                    child: ExpendableTextWidget(
                      text: RecommendedPageId.description!,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

        // Create BottomNavigation
        bottomNavigationBar:
            GetBuilder<PopularProductController>(builder: (controller) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Create an first child to less and more button and counter(money).
              Container(
                padding: EdgeInsets.only(
                  left: Dimensions.width20 * 2.5,
                  right: Dimensions.width20 * 2.5,
                  top: Dimensions.height10,
                  bottom: Dimensions.height10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        controller.setQuantity(false);
                      },
                      child: AppIcons(
                        iconSize: Dimensions.iconsSize24,
                        icon: Icons.remove,
                        backgroundColor: AppColors.mainColor,
                        iconColor: Colors.white,
                      ),
                    ),
                    BigText(
                      text:
                          "\$ ${RecommendedPageId.price!} X  ${controller.inCartItem} ",
                      color: Colors.black,
                      size: Dimensions.font26,
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.setQuantity(true);
                      },
                      child: AppIcons(
                        iconSize: Dimensions.iconsSize24,
                        icon: Icons.add,
                        backgroundColor: AppColors.mainColor,
                        iconColor: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
              Container(
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
                          top: Dimensions.height20,
                          bottom: Dimensions.height20,
                          left: Dimensions.width20,
                          right: Dimensions.width20),
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radious20),
                        color: Colors.white,
                      ),
                      child: const Icon(
                        Icons.favorite,
                        color: AppColors.mainColor,
                      ),
                    ),

                    // Create an Add to cart Button
                    GestureDetector(
                      onTap: () {
                        controller.addItem(RecommendedPageId);
                      },
                      child: Container(
                        padding: EdgeInsets.only(
                            top: Dimensions.height10,
                            bottom: Dimensions.height10,
                            left: Dimensions.width_10,
                            right: Dimensions.width_10),
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.radious20),
                          color: AppColors.mainColor,
                        ),
                        child: BigText(
                          text:
                              "\$${controller.inCartItem * RecommendedPageId.price!}  | Add to Cart",
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }));
  }
}

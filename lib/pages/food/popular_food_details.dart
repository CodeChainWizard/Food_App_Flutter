import 'package:flutter/material.dart';
import 'package:food_delivery/data/controllers/cart_controller.dart';
import 'package:food_delivery/data/controllers/popular_product_controller.dart';
import 'package:food_delivery/pages/Home/Main_Food_Page.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/widgets/app_column.dart';
import 'package:food_delivery/widgets/app_constarins.dart';
import 'package:food_delivery/widgets/app_icons.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/dimension.dart';
import 'package:food_delivery/widgets/expendable_text_widget.dart';
import 'package:get/get.dart';

class PopularFoodDetail extends StatelessWidget {
  int pageId;

  PopularFoodDetail({required this.pageId, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<PopularProductController>().popularProductList[pageId];
    // print("Page id is:="+pageId.toString());
    // print("Product name is:="+product.name.toString());

    Get.find<PopularProductController>().initProduct(product, Get.find<CartController>());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Background Image section
          Positioned(
              left: 0.0,
              right: 0.0,
              child: Container(
                width: double.maxFinite,
                height: Dimensions.popularFoodImgSize,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        // image: AssetImage("assets/image/food3.jpg"),
                        image: NetworkImage(AppConstrains.BASE_URL +
                            AppConstrains.UPLOAD_URL +
                            product.img!),
                        fit: BoxFit.cover)),
              )),

          // Image(Icon) Button section.
          Positioned(
              top: Dimensions.height45,
              left: Dimensions.width20,
              right: Dimensions.width20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        Get.to(() => const MainFoodPage());
                      },
                      child: const AppIcons(icon: Icons.arrow_back_ios)),
                  const AppIcons(icon: Icons.shopping_cart_outlined),
                ],
              )),

          // Draw White Background using to the item name and item description.
          Positioned(
              left: 0.0,
              right: 0.0,
              bottom: 0.0,
              top: Dimensions.popularFoodImgSize - 20,
              child: Container(
                padding: EdgeInsets.only(
                    left: Dimensions.width20,
                    right: Dimensions.width20,
                    top: Dimensions.height20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(Dimensions.radious20),
                    topLeft: Radius.circular(Dimensions.radious20),
                  ),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppColumn(text: product.name!),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    BigText(text: "Introduce"),

                    // Expendable text widget
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    Expanded(
                        child: SingleChildScrollView(
                            child: ExpendableTextWidget(
                                text: product.description!))),
                  ],
                ),
              )),
        ],
      ),
      bottomNavigationBar: GetBuilder<PopularProductController>(builder: (popularProduct){
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
                    GestureDetector(
                      onTap: (){
                        popularProduct.setQuantity(false);
                      },
                      child: const Icon(
                        Icons.remove,
                        color: AppColors.signColor,
                      ),
                    ),
                    SizedBox(
                      width: Dimensions.width_10 / 2,
                    ),
                    BigText(text: popularProduct.inCartItem.toString()),
                    SizedBox(
                      width: Dimensions.width_10 / 2,
                    ),
                    GestureDetector(
                        onTap: (){
                          popularProduct.setQuantity(true);
                        },
                        child: const Icon(Icons.add, color: AppColors.signColor)),
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
                  onTap: (){
                    popularProduct.addItem(product);
                  },
                  child: BigText(
                    text: "\$ ${product.price!}  " + "| Add to Cart",
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        );
      },),
    );
  }
}

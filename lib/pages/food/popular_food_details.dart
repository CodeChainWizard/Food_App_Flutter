import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/widgets/app_column.dart';
import 'package:food_delivery/widgets/app_icons.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/dimension.dart';
import 'package:food_delivery/widgets/expendable_text_widget.dart';

class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({super.key});

  @override
  Widget build(BuildContext context) {
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
                        image: AssetImage("assets/image/food3.jpg"),
                        fit: BoxFit.cover)),
              )),

          // Image(Icon) Button section.
          Positioned(
              top: Dimensions.height45,
              left: Dimensions.width20,
              right: Dimensions.width20,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppIcons(icon: Icons.arrow_back_ios),
                  AppIcons(icon: Icons.shopping_cart_outlined),
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
                    const AppColumn(text: "Farfalle Pasta"),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    BigText(text: "Introduce"),

                    // Expendable text widget
                    SizedBox(height: Dimensions.height20,),
                    const Expanded(
                        child: SingleChildScrollView(
                            child: ExpendableTextWidget(
                                text:
                                    "Farfalle (Italian: [farˈfalle]) are a type of pasta commonly known as bow-tie pasta, ribbon pasta or butterfly pasta. The name is derived from the Italian word farfalle (butterflies).[1] In the Italian region of Emilia-Romagna, farfalle are known as strichetti (a local word for bow tie). A larger variation of farfalle is known as farfalloni, while the miniature version is called farfalline. Farfalle date back to the 16th century in the Lombardy and Emilia-Romagna regions of Northern Italy.[2],Farfalle (Italian: [farˈfalle]) are a type of pasta commonly known as bow-tie pasta, ribbon pasta or butterfly pasta. The name is derived from the Italian word farfalle (butterflies).[1] In the Italian region of Emilia-Romagna, farfalle are known as strichetti (a local word for bow tie). A larger variation of farfalle is known as farfalloni, while the miniature version is called farfalline. Farfalle date back to the 16th century in the Lombardy and Emilia-Romagna regions of Northern Italy.[2]"))),
                  ],
                ),
              )),
        ],
      ),
      bottomNavigationBar: Container(
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
                  Icon(
                    Icons.remove,
                    color: AppColors.signColor,
                  ),
                  SizedBox(
                    width: Dimensions.width_10 / 2,
                  ),
                  BigText(text: "0"),
                  SizedBox(
                    width: Dimensions.width_10 / 2,
                  ),
                  Icon(Icons.add, color: AppColors.signColor),
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
              child: BigText(
                text: "\$10 | Add to Cart",
                color: Colors.white,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radious20),
                color: AppColors.mainColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

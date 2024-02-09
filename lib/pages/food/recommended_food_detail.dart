import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/widgets/app_icons.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/dimension.dart';
import 'package:food_delivery/widgets/expendable_text_widget.dart';
import 'package:food_delivery/widgets/small_text.dart';

class RecommendedFoodDetail extends StatelessWidget {
  const RecommendedFoodDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 70,
            title: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcons(icon: Icons.clear),
                AppIcons(icon: Icons.shopping_cart_outlined),
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
                  text: "Farfalle Pasta",
                  size: Dimensions.font26,
                )),
              ),
            ),
            pinned: true,
            expandedHeight: 300,
            backgroundColor: AppColors.yellowColor,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "assets/image/food3.jpg",
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
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
                  child: const ExpendableTextWidget(
                    text:
                        "Farfalle (Italian: [farˈfalle]) are a type of pasta commonly known as bow-tie pasta, ribbon pasta or butterfly pasta. The name is derived from the Italian word farfalle (butterflies).[1] In the Italian region of Emilia-Romagna, farfalle are known as strichetti (a local word for bow tie). A larger variation of farfalle is known as farfalloni, while the miniature version is called farfalline. Farfalle date back to the 16th century in the Lombardy and Emilia-Romagna regions of Northern Italy.[2],Farfalle (Italian: [farˈfalle]) are a type of pasta commonly known as bow-tie pasta, ribbon pasta or butterfly pasta. The name is derived from the Italian word farfalle (butterflies).[1] In the Italian region of Emilia-Romagna, farfalle are known as strichetti (a local word for bow tie). A larger variation of farfalle is known as farfalloni, while the miniature version is called farfalline. Farfalle date back to the 16th century in the Lombardy and Emilia-Romagna regions of Northern Italy.[2] Farfalle (Italian: [farˈfalle]) are a type of pasta commonly known as bow-tie pasta, ribbon pasta or butterfly pasta. The name is derived from the Italian word farfalle (butterflies).[1] In the Italian region of Emilia-Romagna, farfalle are known as strichetti (a local word for bow tie). A larger variation of farfalle is known as farfalloni, while the miniature version is called farfalline. Farfalle date back to the 16th century in the Lombardy and Emilia-Romagna regions of Northern Italy.[2],Farfalle (Italian: [farˈfalle]) are a type of pasta commonly known as bow-tie pasta, ribbon pasta or butterfly pasta. The name is derived from the Italian word farfalle (butterflies).[1] In the Italian region of Emilia-Romagna, ",
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

      // Create BottomNavigation
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Create an first child to less and more button and counter(money).
          Container(
            padding: EdgeInsets.only(
              left: Dimensions.width20*2.5,
              right: Dimensions.width20*2.5,
              top: Dimensions.height10,
              bottom: Dimensions.height10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcons(
                  iconSize: Dimensions.iconsSize24,
                  icon: Icons.remove,
                  backgroundColor: AppColors.mainColor,
                  iconColor: Colors.white,
                ),
                BigText(text: "\$ 12.88" + " X " + " 0 ", color: Colors.black, size: Dimensions.font26,),
                AppIcons(
                  iconSize: Dimensions.iconsSize24,
                  icon: Icons.add,
                  backgroundColor: AppColors.mainColor,
                  iconColor: Colors.white,
                ),
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
                    borderRadius: BorderRadius.circular(Dimensions.radious20),
                    color: Colors.white,
                  ),
                  child: Icon(
                    Icons.favorite,
                    color: AppColors.mainColor, 
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

        ],
      ),
    );
  }
}

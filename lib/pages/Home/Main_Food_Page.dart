import 'package:flutter/material.dart';
import 'package:food_delivery/pages/Home/food_page_body.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/dimension.dart';
import 'package:food_delivery/widgets/small_text.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({super.key});

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    // print("Current height is:- " + MediaQuery.of(context).size.height.toString());
    return Scaffold(
      body: Column(
        children: [
          // Showing the Header part.
          Container(
            // This Upper Container use for Scroll Part
            child: Container(
              margin: EdgeInsets.only(top: Dimensions.height45, bottom: Dimensions.height15),
              padding: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      BigText(
                        text: "India",
                        color: AppColors.mainColor,
                        size: 30.0,
                      ),
                      Row(
                        children: [
                          SmallText(
                            text: "Surat",
                            size: 15.0,
                            color: Colors.black54,
                          ),
                          Icon(Icons.arrow_drop_down_rounded),
                        ],
                      ),
                    ],
                  ),
                  Center(
                    child: Container(
                      width: Dimensions.width45,
                      height: Dimensions.height45,
                      child: Icon(
                        // Flutter default size is 24.
                        Icons.search,
                        size: Dimensions.iconsSize24,
                        color: Colors.white,
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Dimensions.radious20),
                          color: AppColors.mainColor),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Showing the Body part of Page.
          const Expanded(child: SingleChildScrollView(
            child: FoodPageBody(),
          ))
        ],
      ),
    );
  }
}

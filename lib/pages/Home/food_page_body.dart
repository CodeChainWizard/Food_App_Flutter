import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/data/controllers/popular_product_controller.dart';
import 'package:food_delivery/data/controllers/recommended_product_controller.dart';
import 'package:food_delivery/models/products_model.dart';
import 'package:food_delivery/pages/food/popular_food_details.dart';
import 'package:food_delivery/routes/route_helper.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/widgets/app_column.dart';
import 'package:food_delivery/widgets/app_constarins.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/dimension.dart';
import 'package:food_delivery/widgets/icon_and_text_widget.dart';
import 'package:food_delivery/widgets/small_text.dart';
import 'package:get/get.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({super.key});

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);

  var _currPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = Dimensions.pageViewContainer;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;

        // Print the current state of value like a 0.0 to the 1.0 between transfer
        // one item to second item.
        // print("Current Page Value:- "+_currPageValue.toString());
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Slider Section
        GetBuilder<PopularProductController>(builder: (popularProduct) {
          return popularProduct.isLoaded ? Container(
            height: Dimensions.pageView,
              child: PageView.builder(
                  controller: pageController,
                  itemCount: popularProduct.popularProductList.length,
                  itemBuilder: (context, position) {
                    return _buildPageItem(
                        position, popularProduct.popularProductList[position]);
                  }),
          ) : const CircularProgressIndicator(
            color: AppColors.mainColor,
          );
        }),
        // Dots animation

        GetBuilder<PopularProductController>(builder: (popularProduct) {
          return popularProduct.isLoaded ? DotsIndicator(
            dotsCount: popularProduct.popularProductList.isEmpty
                ? 1
                : popularProduct.popularProductList.length,
            position: _currPageValue,
            decorator: const DotsDecorator(
              size: Size.square(12.0),
              color: Colors.black,
              activeColor: Colors.redAccent,
            ),
          ) : Container();
        }),

        // Popular Text
        SizedBox(
          height: Dimensions.height30,
        ),
        Container(
          margin: EdgeInsets.only(
            left: Dimensions.width30,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: "Recommended"),
              SizedBox(
                width: Dimensions.width_10,
              ),
              Container(
                margin: EdgeInsets.only(bottom: 3),
                child: BigText(
                  text: ".",
                  color: Colors.black26,
                ),
              ),
              SizedBox(
                width: Dimensions.width_10,
              ),
              Container(
                margin: EdgeInsets.only(bottom: 2),
                child: SmallText(
                  text: "Food pairing",
                ),
              ),
            ],
          ),
        ),

        // Create an ListView
        GetBuilder<RecommendedProductController>(builder: (recommendProduct) {
          return recommendProduct.isLoaded ? ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: recommendProduct.recommendedProductList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: (){
                    Get.toNamed(RouteHelper.getRecommendedFood(index, "home"));
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                        left: Dimensions.width20,
                        right: Dimensions.width20,
                        bottom: Dimensions.height10),
                    child: Row(
                      children: [
                        // List Image Section
                        Container(
                          width: Dimensions.listViewImgSize,
                          height: Dimensions.listViewImgSize,
                          decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius.circular(Dimensions.radious20),
                              color: Colors.white38,
                              image: DecorationImage(
                                    image: NetworkImage("${AppConstrains.BASE_URL}${AppConstrains.UPLOAD_URL}"+recommendProduct.recommendedProductList[index].img!),
                                //   image: AssetImage("assets/image/food2.jpg"),
                                  fit: BoxFit.cover)),
                        ),

                        // Text Section
                        Expanded(
                          child: Container(
                            height: Dimensions.listViewTextContSize,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(Dimensions.radious20),
                                bottomRight:
                                Radius.circular(Dimensions.radious20),
                              ),
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: Dimensions.width_10,
                                  right: Dimensions.width_10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  BigText(
                                    text: recommendProduct.recommendedProductList[index].name!,
                                  ),
                                  SizedBox(
                                    height: Dimensions.height10,
                                  ),
                                  // SmallText(text: recommendProduct.recommendedProductList[index].description!, size: 2, color: Colors.black,),
                                  SmallText(text: "With Chinese characteristics"),
                                  SizedBox(
                                    height: Dimensions.height10,
                                  ),
                                  const Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      IconsAndTextWidget(
                                          icon: Icons.circle_sharp,
                                          text: "Normal",
                                          iconColor: AppColors.iconColor1),
                                      IconsAndTextWidget(
                                          icon: Icons.location_on,
                                          text: "1.8km",
                                          iconColor: AppColors.mainColor),
                                      IconsAndTextWidget(
                                          icon: Icons.access_time_rounded,
                                          text: "Normal",
                                          iconColor: AppColors.iconColor2),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }) : const CircularProgressIndicator(
            color: AppColors.mainColor,
          );
        }),
      ],
    );
  }

  Widget _buildPageItem(int index, ProductModel popularProduct) {
    // item slide Animation Logic...
    Matrix4 matrix4 = new Matrix4.identity();
    if (index == _currPageValue.floor()) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix4 = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix4 = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() - 1) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix4 = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix4 = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 0);
    }

    return Transform(
      transform: matrix4,
      child: Stack(
        // Stack widget use to apply container height to wright
        children: [
          GestureDetector(
            onTap: (){
              // Get.to(()=>PopularFoodDetail());

              Get.toNamed(RouteHelper.getPopularFood(index, "home"));
            },
            child: Container(
              height: Dimensions.pageViewContainer,
              margin: EdgeInsets.only(
                  left: Dimensions.width_10, right: Dimensions.width_10),
              // This margin use for space between two slider.
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radious30),
                  color: index.isEven ? const Color(0xFF69c5df) : Colors.blue,
                  image: DecorationImage(
                    image: NetworkImage(AppConstrains.BASE_URL +
                        AppConstrains.UPLOAD_URL +
                        popularProduct.img!),
                    fit: BoxFit.cover,
                  )),
            ),
          ),
          Align(
            alignment: AlignmentDirectional.bottomEnd,
            child: Container(
              height: Dimensions.pageViewTextContainer + 12,
              margin: EdgeInsets.only(
                  left: Dimensions.width30,
                  right: Dimensions.width30,
                  bottom: Dimensions.height30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radious20),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                      color: Color(0xFFe8e8e8),
                      blurRadius: 5.0,
                      offset: Offset(0, 5)),
                  BoxShadow(color: Colors.white, offset: Offset(-5, 0)),
                  BoxShadow(color: Colors.white, offset: Offset(5, 0)),
                ],
              ),
              child: Container(
                padding: EdgeInsets.only(
                    top: Dimensions.height15,
                    left: Dimensions.height15,
                    right: Dimensions.height15),
                child: AppColumn(
                  text: popularProduct.name!,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

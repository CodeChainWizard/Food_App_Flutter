import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/dimension.dart';
import 'package:food_delivery/widgets/icon_and_text_widget.dart';
import 'package:food_delivery/widgets/small_text.dart';

class AppColumn extends StatelessWidget {
  final String text;
  const AppColumn({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BigText(text: text, size: Dimensions.font26),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Wrap(
                // Here, Main reason to use 'warp' widget because wrap widget child set on horizontal
                children: List.generate(
                    5,
                    (index) => Icon(
                          Icons.star,
                          color: AppColors.mainColor,
                          size: 15.0,
                        )),
              ),
              SizedBox(
                width: 10.0,
              ),
              SmallText(
                text: "4.5",
                color: AppColors.textColor,
              ),
              SizedBox(
                width: 10.0,
              ),
              SmallText(text: "1564"),
              SizedBox(
                width: 10.0,
              ),
              SmallText(text: "Comments"),
            ],
          ),
          SizedBox(height: Dimensions.height10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
    );
  }
}

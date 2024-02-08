import 'package:flutter/material.dart';
import 'package:food_delivery/widgets/dimension.dart';
import 'package:food_delivery/widgets/small_text.dart';

class IconsAndTextWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconColor;

  const IconsAndTextWidget(
      {super.key,
      required this.icon,
      required this.text,
      required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // const SizedBox(width: 10.0,),
        Icon(icon, color: iconColor, size: Dimensions.iconsSize24,),
        const SizedBox(width: 3.0,),
        SmallText(text: text)
      ],
    );
  }
}

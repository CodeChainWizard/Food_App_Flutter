import 'package:flutter/material.dart';
import 'package:food_delivery/widgets/dimension.dart';

class BigText extends StatelessWidget {
  String text;
  final Color? color;
  double size;
  TextOverflow textOverflow;

  BigText({
    super.key,
    required this.text,
    this.color = const Color(0xFF332d2b),
    this.size = 0,
    this.textOverflow = TextOverflow.ellipsis,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: textOverflow,
      style: TextStyle(
          color: color,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w400,
          fontSize: size == 0 ? Dimensions.font20 : size),
    );
  }
}

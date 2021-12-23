import 'package:ash_tree/app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBtn extends StatelessWidget {
  final Function onPress;
  final double? buttonPadding;
  final String text;

  const CustomBtn({
    Key? key,
    required this.onPress,
    required this.text,
    this.buttonPadding,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () => onPress(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: buttonPadding ?? 0),
        child: Text(
          text.toUpperCase(),
          style: Get.textTheme.button!.copyWith(
              color: Colors.white, fontSize: 15, fontWeight: FontWeight.w600),
        ),
      ),
      color: kPrimaryColor,
      disabledColor: kPrimaryColor,
      padding: EdgeInsets.symmetric(vertical: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    );
  }
}

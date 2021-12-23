import 'package:ash_tree/app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSplashBgColor,
      body: Center(
        child: SvgPicture.asset(
          controller.logo,
        ),
      ),
    );
  }
}

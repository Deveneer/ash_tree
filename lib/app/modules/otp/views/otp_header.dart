import 'package:ash_tree/app/constants/assets.dart';
import 'package:ash_tree/app/modules/landing/views/components/custom_shape.dart';
import 'package:ash_tree/app/modules/otp/controllers/otp_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class AnimatedHeader extends StatelessWidget {
  final OtpController otpController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Obx(
          () => AnimatedContainer(
            duration: Duration(milliseconds: 500),
            height: otpController.keyBoardOpen.value
                ? Get.height * 0.2
                : Get.height * 0.40,
            width: Get.width,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                CustomPaint(
                  painter: WavePainterHeader(),
                  child: Container(),
                ),
                AnimatedContainer(
                  margin: EdgeInsets.only(top: 24),
                  height: otpController.keyBoardOpen.value ? 100 : 150,
                  duration: Duration(milliseconds: 500),
                  child: SvgPicture.asset(kClearLogoSvg),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:ash_tree/app/constants/assets.dart';
import 'package:ash_tree/app/modules/landing/controllers/landing_controller.dart';
import 'package:ash_tree/app/modules/landing/views/components/custom_clipper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'custom_shape.dart';

class LandingAnimatedHeader extends StatelessWidget {
  final LandingController _landingController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Obx(
          () => AnimatedContainer(
            duration: Duration(seconds: 1),
            height: !_landingController.isLoginFormEnabled.value
                ? Get.height * 0.54
                : Get.height * 0.4,
            child: CustomPaint(
              painter: WavePainter(),
              child: ClipPath(
                clipper: WaveClipper(),
                child: AnimatedCrossFade(
                  duration: const Duration(milliseconds: 500),
                  // reverseDuration: const Duration(milliseconds: 500),
                  firstCurve: Curves.easeIn,
                  secondCurve: Curves.easeOut,
                  firstChild: AnimatedContainer(
                    duration: Duration(seconds: 1),
                    height: !_landingController.isLoginFormEnabled.value
                        ? Get.height / 2
                        : Get.height / 3,
                    alignment: Alignment.center,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Positioned(
                            right: Get.width / 3,
                            bottom: 0,
                            child: Image.asset(
                              kGirlDoctor,
                              height: Get.height / 2.3,
                            )),
                        Positioned(
                            left: Get.width / 3,
                            bottom: 0,
                            child: Image.asset(
                              kBoyDoctor,
                              height: Get.height / 2.3,
                            )),
                      ],
                    ),
                  ),

                  secondChild: Center(
                    child: AnimatedContainer(
                      duration: Duration(seconds: 1),
                      height: !_landingController.isLoginFormEnabled.value
                          ? 140
                          : 100,
                      child: SvgPicture.asset(
                        kClearLogoSvg,
                        // height: 50,
                        // width: 50,
                      ),
                    ),
                  ),
                  crossFadeState: !_landingController.isLoginFormEnabled.value
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

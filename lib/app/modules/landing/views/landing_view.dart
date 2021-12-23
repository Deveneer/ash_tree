import 'package:ash_tree/app/constants/assets.dart';
import 'package:ash_tree/app/constants/colors.dart';
import 'package:ash_tree/app/customs/custom_btn.dart';
import 'package:ash_tree/app/routes/app_pages.dart';
import 'package:ash_tree/app/utils/custom_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../controllers/landing_controller.dart';
import 'components/animated_header.dart';

class LandingView extends GetView<LandingController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(() => Container(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: controller.isLoginFormEnabled.value
                ? !controller.isSignUpPage.value
                    ? Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: Get.width,
                            child: CustomBtn(
                              text: 'Log In',
                              onPress: controller.onLogInPressed,
                            ),
                          ),
                          TextButton(
                              onPressed: controller.onSignUpEnabler,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Don\'t have an account?',
                                    style: Get.textTheme.subtitle2!
                                        .copyWith(fontSize: 16),
                                  ),
                                  Text(' Sign Up',
                                      style: Get.textTheme.headline6!.copyWith(
                                          color: kTextFieldBorderColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ))
                        ],
                      )
                    : Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: Get.width,
                            child: CustomBtn(
                              text: 'Get Otp',
                              onPress: controller.onGetOtpPressed,
                            ),
                          ),
                          TextButton(
                              onPressed: controller.onSignInEnabler,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Have an account?',
                                    style: Get.textTheme.subtitle2!
                                        .copyWith(fontSize: 16),
                                  ),
                                  Text(' Sign In',
                                      style: Get.textTheme.headline6!.copyWith(
                                          color: kTextFieldBorderColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ))
                        ],
                      )
                : Container(
                    width: Get.width,
                    margin: EdgeInsets.only(bottom: 25.0),
                    child: CustomBtn(
                      text: 'Get Started',
                      onPress: controller.onGetStartedPressed,
                    ),
                  ),
          )),
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            LandingAnimatedHeader(),
            _body(),

            // Text()
          ],
        ),
      ),
    );
  }

  Widget _body() => Obx(() => Padding(
        padding: const EdgeInsets.only(left: 16, right: 8),
        child: AnimatedCrossFade(
            firstChild: _getStartedBody(),
            secondChild:
                controller.isSignUpPage.value ? _signUpBody() : _logInBody(),
            crossFadeState: !controller.isLoginFormEnabled.value
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
            duration: Duration(seconds: 1)),
      ));

  static Widget _getStartedBody() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: Get.height / 2,
          ),
          SvgPicture.asset(
            kClearLogoSvg,
            color: Colors.green,
            height: 90,
            width: 90,
          ),
          Text(
            'Take Care of Health With Us',
            style: Get.textTheme.headline4!
                .copyWith(color: kPrimaryColor, fontWeight: FontWeight.bold),
          ),
          Text(
            'Service with professional doctors and the best facilities guarantee the quality of your health, let\'s start maintaining health',
            style: Get.textTheme.subtitle1,
          ),
        ],
      );
  Widget _logInBody() => Form(
        key: controller.loginAndSignupFormKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: Get.height / 2.5,
            ),
            Text(
              'Let\'s sign you in',
              style: Get.textTheme.headline4!
                  .copyWith(color: kPrimaryColor, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 32,
            ),
            Text(
              'Welcome Back!\nPlease continue with your credentials',
              style: Get.textTheme.headline5,
            ),
            SizedBox(
              height: 32,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: PhoneTextField(controller: controller.phoneController),
            ),
          ],
        ),
      );
  Widget _signUpBody() => Form(
        key: controller.loginAndSignupFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: Get.height / 2.5,
            ),
            Text(
              'Enter Your\nMobile Number',
              style: Get.textTheme.headline4!
                  .copyWith(color: kPrimaryColor, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              'Welcome!\nPlease continue with your Number',
              style: Get.textTheme.headline5,
            ),
            SizedBox(
              height: 32,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: PhoneTextField(controller: controller.phoneController),
            ),
            _termAndConditionCheckBox(),
          ],
        ),
      );

  Widget _termAndConditionCheckBox() => Padding(
        padding: const EdgeInsets.fromLTRB(0, 8, 8, 8),
        child: ListTile(
          leading: Obx(
            () => Checkbox(
              value: controller.isTermAndConditionBoxChecked.value,
              activeColor: Colors.red,
              onChanged: (isChecked) {
                controller.isTermAndConditionBoxChecked.value = isChecked!;
              },
            ),
          ),
          title: RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: 'I agree to the ',
                  style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: 16,
                  ),
                ),
                TextSpan(
                  text: "Terms ",
                  style: TextStyle(
                    color: kTextFieldBorderColor,
                    fontSize: 16,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Get.toNamed(Routes.TERMS);
                    },
                ),
                TextSpan(
                  text: 'and ',
                  style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: 16,
                  ),
                ),
                TextSpan(
                  text: "Privacy Policy ",
                  style: TextStyle(
                    color: kTextFieldBorderColor,
                    fontSize: 16,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Get.toNamed(Routes.PRIVACY);
                    },
                ),
                TextSpan(
                  text: 'of usage of Ash Tree.',
                  style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}

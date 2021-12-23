import 'package:ash_tree/app/constants/colors.dart';
import 'package:ash_tree/app/constants/strings.dart';
import 'package:ash_tree/app/customs/custom_btn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../controllers/otp_controller.dart';
import 'otp_header.dart';

class OtpView extends GetView<OtpController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: Get.width,
              child: CustomBtn(
                text: 'Sign In',
                onPress: controller.onVerifyPressed,
              ),
            ),
            TextButton(
              onPressed: controller.onResendPressed,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Didn\'t Receive SMS?',
                    style: Get.textTheme.subtitle2,
                  ),
                  Text('  Resend',
                      style: Get.textTheme.headline6!.copyWith(
                          color: kTextFieldBorderColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            )
          ],
        ),
      ),
      body: Stack(
        children: [AnimatedHeader(), _otpBody(context)],
      ),
    );
  }

  Widget _otpBody(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: Get.height / 2.5,
              ),
              Text(
                'OTP Verification',
                style: Get.textTheme.headline4!.copyWith(
                  color: kPrimaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                'We have sent a 4 digit OTP\nto ${controller.phone}',
                style: Get.textTheme.subtitle1,
              ),
              SizedBox(
                height: 32,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 60, right: 60, top: 24),
                child: Form(
                  key: controller.formKey,
                  child: PinCodeTextField(
                    useHapticFeedback: true,
                    pastedTextStyle: TextStyle(
                      color: kTextFieldBgColor,
                      fontWeight: FontWeight.bold,
                    ),
                    length: 4,
                    obscureText: false,
                    obscuringCharacter: 'O',
                    animationType: AnimationType.fade,
                    validator: (v) {
                      if (v!.length < 3) {
                        return kOtpShouldBe4Digit;
                      } else {
                        return null;
                      }
                    },
                    pinTheme: PinTheme(
                      borderWidth: null,
                      shape: PinCodeFieldShape.underline,
                      fieldHeight: 40,
                      activeColor: kPrimaryColor,
                      inactiveFillColor: Colors.transparent,
                      selectedFillColor: Colors.transparent,
                      selectedColor: kPrimaryColor,
                      inactiveColor: Colors.grey,
                      activeFillColor: Colors.transparent,
                      fieldWidth: 40,
                      // activeFillColor:
                      // controller.hasError ? Colors.red : DARK_ENABLED.value?Colors.black:Colors.white,
                    ),
                    autoDismissKeyboard: true,
                    cursorColor: Colors.black,
                    animationDuration: Duration(milliseconds: 300),
                    textStyle: TextStyle(
                        fontSize: 30, height: 1.3, color: Colors.grey),
                    backgroundColor: Colors.transparent,
                    enableActiveFill: true,
                    // errorAnimationController: _otpController.errorController,
                    keyboardType: TextInputType.number,
                    onCompleted: (v) {
                      controller.otpText.value = v;
                    },
                    beforeTextPaste: (text) {
                      print("$kAllowingToPaste $text");
                      //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                      //but you can show anything you want here, like your pop up saying wrong paste format or etc
                      return true;
                    },
                    onChanged: (String value) {}, appContext: context,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}

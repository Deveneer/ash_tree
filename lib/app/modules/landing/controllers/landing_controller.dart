import 'package:ash_tree/app/api/provider/api_handlers.dart';
import 'package:ash_tree/app/api/provider/api_provider.dart';
import 'package:ash_tree/app/constants/strings.dart';
import 'package:ash_tree/app/models/common_response.dart';
import 'package:ash_tree/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LandingController extends GetxController
    with SingleGetTickerProviderMixin {
  var isLoginFormEnabled = false.obs;
  var isTermAndConditionBoxChecked = true.obs;
  var isSignUpPage = false.obs;
  late AnimationController animController;
  late Animation<double> animation;
  TextEditingController phoneController = TextEditingController();
  ApiProvider _apiProvider = Get.find();
  var loginAndSignupFormKey;

  @override
  void onInit() {
    super.onInit();
    loginAndSignupFormKey = GlobalKey<FormState>();
    animController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    animation = CurvedAnimation(
      parent: animController,
      curve: Curves.easeOut,
      reverseCurve: Curves.easeIn,
    );
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  onGetStartedPressed() {
    isLoginFormEnabled.value = !isLoginFormEnabled.value;
  }

  onLogInPressed() {
    if (isTermAndConditionBoxChecked.value) {
      if (loginAndSignupFormKey.currentState!.validate()) {
        ApiHandler().loading();
        Map<String, String> requestMap = {'phone_number': phoneController.text};
        _apiProvider.sendOtp(requestMap).then(
          (value) {
            Get.back();
            if (value.isOk) {
              CommonResponseForUser _data =
                  CommonResponseForUser.fromJson(value.body);
              Get.toNamed(Routes.OTP, arguments: {
                'phoneNumber': phoneController.text,
                'isUserAlreadyExists': _data.isUserExists,
              });
            } else {
              CommonResponse _data = CommonResponse.fromJson(value.body);
              Get.snackbar(
                'Something went wrong.',
                '${_data.message}',
                backgroundColor: Colors.white,
              );
            }
          },
        );
      }
    } else
      Get.snackbar(
        'Checkbox Not Selected.',
        termsCheckBoxError,
        backgroundColor: Colors.white,
      );
  }

  onGetOtpPressed() {
    onLogInPressed();
  }

  onSignInEnabler() {
    print('called log in.');
    isSignUpPage.value = false;
    isTermAndConditionBoxChecked.value = true;
  }

  onSignUpEnabler() {
    print('called sign up.');
    isSignUpPage.value = true;
    isTermAndConditionBoxChecked.value = false;
  }
}

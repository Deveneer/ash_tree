import 'package:ash_tree/app/api/provider/api_handlers.dart';
import 'package:ash_tree/app/api/provider/api_provider.dart';
import 'package:ash_tree/app/locale/sessions.dart';
import 'package:ash_tree/app/models/verify_otp_response.dart';
import 'package:ash_tree/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';

class OtpController extends GetxController {
  var phone = Get.arguments['phoneNumber'];
  var isUserExists = Get.arguments['isUserAlreadyExists'];
  final formKey = GlobalKey<FormState>();
  var otpText = ''.obs;
  var _keyboardVisibility = KeyboardVisibilityController();
  var keyBoardOpen = false.obs;

  ApiProvider _apiProvider = Get.find();

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    _keyboardVisibility.onChange
        .listen((bool visible) => keyBoardOpen.value = visible);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;

  void onVerifyPressed() {
    ApiHandler().loading();
    Map<String, String> requestMap = {
      'otp': otpText.value.toString(),
      'phone_number': phone.toString()
    };
    _apiProvider.verifyOtp(requestMap).then((value) {
      Get.back();
      // print(value.request.files);
      if (value.isOk) {
        VerifyOtpResponse _data = VerifyOtpResponse.fromJson(value.body);
        USER_INFO.value = _data.data!;
        SessionManager().saveUser(_data.data!);
        USER_TOKEN.value = _data.data!.token!;
        if (isUserExists == 1) {
          SessionManager().saveToken(_data.data!.token!);
          Get.offAllNamed(Routes.BOTTOMNAVBAR);
        } else
          Get.toNamed(Routes.RESIDENT,
              arguments: {'userToken': _data.data!.token!});
      } else if (value.statusCode == 401) {
        Get.snackbar('Error Occured', 'Entered OTP is Invalid!');
      } else {
        Get.snackbar(
            'Error Occured.', 'Something went wrong. Try again later.');
      }
    });
  }

  onResendPressed() {}
}

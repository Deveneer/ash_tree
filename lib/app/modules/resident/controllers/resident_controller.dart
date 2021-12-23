import 'package:ash_tree/app/api/provider/api_handlers.dart';
import 'package:ash_tree/app/api/provider/api_provider.dart';
import 'package:ash_tree/app/locale/sessions.dart';
import 'package:ash_tree/app/models/verify_otp_response.dart';
import 'package:ash_tree/app/routes/app_pages.dart';
import 'package:ash_tree/app/utils/custom_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ResidentController extends GetxController {
  String userToken = Get.arguments['userToken'];
  var isPassport = false.obs;
  var isEmirates = false.obs;
  late TextEditingController passportNumberTextEditingController;
  late TextEditingController emirateIDTextEditingController;
  final emirateIdFormKey = GlobalKey<FormState>();
  final passportNumberFormKey = GlobalKey<FormState>();
  ApiProvider _apiProvider = Get.find();
  TextInputFormatter maskFormatter =
      CustomFormatter(mask: '###-####-#######-#', separator: '-');

  @override
  void onInit() {
    super.onInit();
    passportNumberTextEditingController = TextEditingController();
    emirateIDTextEditingController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  onSwitchASelected() {
    Get.log('on Emirates Pressed');
    isPassport.value = false;
    isEmirates.value = true;
  }

  onSwitchBSelected() {
    Get.log('on Passport Pressed');
    isPassport.value = true;
    isEmirates.value = false;
  }

  void onNextPressed() {
    if (isPassport.value || isEmirates.value) {
      var currentFormKey =
          isEmirates.value ? emirateIdFormKey : passportNumberFormKey;
      if (currentFormKey.currentState!.validate()) {
        ApiHandler().loading();
        Map<String, String> requestMap = {
          // 0='emirates_id', 1='passport'
          'resident_type': isPassport.value ? '1' : '0',
          'id_number': isPassport.value
              ? passportNumberTextEditingController.text.toString()
              : emirateIDTextEditingController.text.toString()
        };
        _apiProvider.residentDetails(requestMap).then((value) {
          Get.back();
          if (value.isOk) {
            VerifyOtpResponse _data = VerifyOtpResponse.fromJson(value.body);
            USER_INFO.value = _data.data!;
            SessionManager().saveUser(_data.data!);
            Get.toNamed(Routes.EDIT_PROFILE,
                arguments: {'isFromLoginScreen': true, 'userToken': userToken});
          } else {
            Get.snackbar(
                'Error Occured.', 'Something went wrong. Try again later.',
                backgroundColor: Colors.white70);
            print('---------${value.bodyString}-------');
          }
        });
      }
    } else
      Get.snackbar("Invalid Inputs", 'Please enter your residence details.',
          colorText: Colors.white);
  }
}

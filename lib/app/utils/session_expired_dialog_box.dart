import 'package:ash_tree/app/constants/colors.dart';
import 'package:ash_tree/app/constants/strings.dart';
import 'package:ash_tree/app/locale/sessions.dart';
import 'package:ash_tree/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void sessionExpiredDialogBox() {
  Get.defaultDialog(
    title: sessionExpired,
    middleText: sessionExpiredLoginAgain,
    onConfirm: () {
      SessionManager().clearSession();
      Get.offAllNamed(Routes.LANDING);
    },
    textConfirm: 'Login',
    middleTextStyle: TextStyle(fontSize: 18),
    radius: 10,
    buttonColor: kTextFieldBorderColor,
    confirmTextColor: kPrimaryBgColor,
  );
}

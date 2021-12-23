import 'package:ash_tree/app/api/provider/api_provider.dart';
import 'package:ash_tree/app/locale/sessions.dart';
import 'package:ash_tree/app/models/get_pre_existing_condition_response.dart';
import 'package:ash_tree/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  ApiProvider _apiProvider = Get.find();
  final preExistingConditionTextEditingController = TextEditingController();
  final preExistingConditionFormKey = GlobalKey<FormState>();
  @override
  void onInit() {
    super.onInit();
    getPreExistingCondition();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  onEditPressed() {
    Get.toNamed(Routes.EDIT_PROFILE,
        arguments: {'isFromLoginScreen': false, 'userToken': USER_TOKEN.value});
  }

  String? capitalizeFirstLetter(String? letter) {
    if (letter != null) {
      return "${letter[0].toUpperCase()}${letter.substring(1)}";
    }
    return null;
  }

  void addPreExistingCondition(String preExistingCondition) {
    if (preExistingConditionFormKey.currentState!.validate()) {
      Map<String, String> requestMap = {
        'pre_existing_conditions': preExistingCondition
      };
      _apiProvider.addPreExistingCondition(requestMap).then((value) {
        if (value.isOk) {
          Fluttertoast.showToast(msg: 'Updated Your Pre-Existing Condition.');
        } else
          Get.snackbar('Something went wrong.',
              "Can't Update Your Pre-Existing Condition.");
      });
    }
  }

  void getPreExistingCondition() {
    _apiProvider.getPreExistingCondition().then((value) {
      if (value.isOk) {
        GetPreExistingConditionResponse _data =
            GetPreExistingConditionResponse.fromJson(value.body);
        if (_data.data?[0].preExistingConditions != null)
          preExistingConditionTextEditingController.text =
              _data.data![0].preExistingConditions!;
      } else
        preExistingConditionTextEditingController.text =
            'Please Add Your Pre-Existing Condition.';
    });
  }
}

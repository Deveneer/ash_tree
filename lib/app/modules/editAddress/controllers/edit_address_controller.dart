import 'package:ash_tree/app/api/provider/api_handlers.dart';
import 'package:ash_tree/app/api/provider/api_provider.dart';
import 'package:ash_tree/app/models/common_response.dart';
import 'package:ash_tree/app/modules/address/controllers/address_controller.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class EditAddressController extends GetxController {
  var editData = Get.arguments;

  GlobalKey<FormState> editAddressFormKey = GlobalKey<FormState>();
  ApiProvider _apiProvider = Get.find();
  late TextEditingController nameCtr;
  late TextEditingController mobileCtr;
  late TextEditingController addressCtr;
  late TextEditingController landmarkCtr;
  late TextEditingController cityCtr;
  late TextEditingController stateCtr;
  late TextEditingController postalCodeCtr;
  @override
  void onInit() {
    super.onInit();
    textInit();
  }

  textInit() {
    nameCtr = TextEditingController(text: editData.name);
    mobileCtr = TextEditingController(text: editData.mobileNumber);
    addressCtr = TextEditingController(text: editData.address);
    landmarkCtr = TextEditingController(text: editData.landmark);
    cityCtr = TextEditingController(text: editData.city);
    stateCtr = TextEditingController(text: editData.state);
    postalCodeCtr = TextEditingController(text: editData.pinCode);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  onAddPressed() {
    if (editAddressFormKey.currentState!.validate()) {
      ApiHandler().loading();
      Map<String, String> requestMap = {
        'name': nameCtr.text,
        'mobile_number': mobileCtr.text,
        'address': addressCtr.text,
        'landmark': landmarkCtr.text,
        'city': cityCtr.text,
        'state': stateCtr.text,
        if (postalCodeCtr.text != "") 'pin_code': postalCodeCtr.text,
        if (postalCodeCtr.text == "") 'pin_code': "Not Available",
        'id': editData.id
      };
      _apiProvider.editAddress(requestMap).then((value) {
        Get.back();
        if (value.isOk) {
          CommonResponse _data = CommonResponse.fromJson(value.body);
          Fluttertoast.showToast(msg: _data.message);
          Get.back();
          AddressController _ctr = Get.find();
          _ctr.getAddresses();
        } else {
          Fluttertoast.showToast(msg: value.bodyString ?? '');
        }
      });
    }
  }
}

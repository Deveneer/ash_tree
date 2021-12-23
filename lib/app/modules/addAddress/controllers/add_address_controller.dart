import 'package:ash_tree/app/api/provider/api_handlers.dart';
import 'package:ash_tree/app/api/provider/api_provider.dart';
import 'package:ash_tree/app/models/common_response.dart';
import 'package:ash_tree/app/modules/address/controllers/address_controller.dart';
import 'package:ash_tree/app/modules/addressSelect/controllers/address_select_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class AddAddressController extends GetxController {
  GlobalKey<FormState> addAddressFormKey = GlobalKey<FormState>();
  ApiProvider _apiProvider = Get.find();

  TextEditingController nameCtr = TextEditingController();
  TextEditingController mobileCtr = TextEditingController();
  TextEditingController addressCtr = TextEditingController();
  TextEditingController landmarkCtr = TextEditingController();
  TextEditingController cityCtr = TextEditingController();
  TextEditingController stateCtr = TextEditingController();
  TextEditingController postalCodeCtr = TextEditingController();
  var from = Get.arguments;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  onAddPressed() {
    if (addAddressFormKey.currentState!.validate()) {
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
      };
      _apiProvider.addAddress(requestMap).then((value) {
        Get.back();
        if (value.isOk) {
          CommonResponse _data = CommonResponse.fromJson(value.body);
          Fluttertoast.showToast(msg: _data.message);
          if (from == null) {
            AddressController _ctr = Get.find();
            _ctr.getAddresses();
            Get.back();
          } else {
            AddressSelectController _selectCtr = Get.find();
            _selectCtr.getAddresses();
            Get.back();
          }
        } else {
          Fluttertoast.showToast(msg: value.bodyString ?? '');
        }
      });
    }
  }
}

import 'package:ash_tree/app/customs/custom_btn.dart';
import 'package:ash_tree/app/utils/custom_appBar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_address_controller.dart';

class AddAddressView extends GetView<AddAddressController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          title: 'Add Address', subTitle: 'address details details'),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: Get.width,
          child: CustomBtn(
            text: 'Done',
            onPress: controller.onAddPressed,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: controller.addAddressFormKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: [
                _commonTextField(
                  'Full Name',
                  controller.nameCtr,
                  TextInputType.name,
                ),
                _mobileTextField(
                  controller.mobileCtr,
                ),
                _commonTextField(
                  'Address(House No, Building, Street, Area)',
                  controller.addressCtr,
                  TextInputType.text,
                ),
                _commonTextField(
                  'Landmark',
                  controller.landmarkCtr,
                  TextInputType.text,
                ),
                _commonTextField(
                  'City',
                  controller.cityCtr,
                  TextInputType.text,
                ),
                _commonTextField(
                  'Emirate',
                  controller.stateCtr,
                  TextInputType.text,
                ),
                _commonTextField(
                  'Postal Code (Optional)',
                  controller.postalCodeCtr,
                  TextInputType.number,
                  isValidatorNeeded: false,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _commonTextField(String label, TextEditingController ctr, keyboardType,
          {bool isValidatorNeeded = true}) =>
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          keyboardType: keyboardType,
          controller: ctr,
          decoration: InputDecoration(
              labelText: label,
              border: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
              labelStyle: Get.textTheme.headline6!.copyWith(fontSize: 18),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black54),
              )),
          cursorColor: Colors.black54,
          validator: (e) {
            if (isValidatorNeeded) {
              if (e!.length > 3) {
                return null;
              } else {
                return 'Please enter valid $label!';
              }
            }
          },
        ),
      );

  Widget _mobileTextField(TextEditingController mobileCtr) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          controller: mobileCtr,
          keyboardType: TextInputType.phone,
          decoration: InputDecoration(
              labelText: 'Mobile Number',
              border: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
              labelStyle: Get.textTheme.headline6!.copyWith(fontSize: 18),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black54),
              )),
          cursorColor: Colors.black54,
          validator: (e) {
            if (GetUtils.isPhoneNumber(e!)) {
              return null;
            } else {
              return 'Please enter valid mobile number!';
            }
          },
        ),
      );
}

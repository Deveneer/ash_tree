import 'package:ash_tree/app/constants/colors.dart';
import 'package:ash_tree/app/customs/custom_btn.dart';
import 'package:ash_tree/app/modules/otp/views/otp_header.dart';
import 'package:ash_tree/app/utils/custom_switch.dart';
import 'package:ash_tree/app/utils/custom_textfield.dart';
import 'package:ash_tree/app/utils/custom_validators.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/resident_controller.dart';

class ResidentView extends GetView<ResidentController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: Get.width,
          child: CustomBtn(
            text: 'Next',
            onPress: controller.onNextPressed,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            AnimatedHeader(),
            Padding(
              padding: const EdgeInsets.only(right: 16, left: 16, top: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _signUpBody(),
                  _switch(),
                  _textField(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _signUpBody() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: Get.height / 3,
            ),
            Text(
              'Enter Your Resident Detail',
              style: Get.textTheme.headline4!
                  .copyWith(color: kPrimaryColor, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              'Emirates Id or Passport Number',
              style: Get.textTheme.subtitle1!.copyWith(fontSize: 18),
            ),
          ],
        ),
      );

  Widget _switch() => Obx(
        () => CustomSwitch(
          onAPressed: () => controller.onSwitchASelected,
          switchAValue: controller.isEmirates.value,
          onBPressed: () => controller.onSwitchBSelected,
          switchBValue: controller.isPassport.value,
        ),
      );

  Widget _textField() => Padding(
        padding: const EdgeInsets.only(top: 24),
        child:
            Obx(() => controller.isPassport.value || controller.isEmirates.value
                ? controller.isPassport.value
                    ? Form(
                        key: controller.passportNumberFormKey,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: PassportNumberTextField(
                          keyboardType: TextInputType.text,
                          controller:
                              controller.passportNumberTextEditingController,
                          labelText: 'Passport Number',
                          validator: (passportNumber) =>
                              CustomValidators.passportValidator(
                                  passportNumber),
                        ),
                      )
                    : Form(
                        key: controller.emirateIdFormKey,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: EmirateIDTextField(
                          formatter: controller.maskFormatter,
                          keyboardType: TextInputType.number,
                          controller: controller.emirateIDTextEditingController,
                          labelText: 'Emirate ID',
                          validator: (emirateId) =>
                              CustomValidators.emirateIdValidator(emirateId),
                        ),
                      )
                : Container()),
      );
}

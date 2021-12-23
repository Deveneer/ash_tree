import 'dart:io';
import 'package:ash_tree/app/constants/colors.dart';
import 'package:ash_tree/app/customs/custom_btn.dart';
import 'package:ash_tree/app/locale/sessions.dart';
import 'package:ash_tree/app/utils/custom_appBar.dart';
import 'package:ash_tree/app/utils/custom_switch.dart';
import 'package:ash_tree/app/utils/custom_textfield.dart';
import 'package:ash_tree/app/utils/custom_validators.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/edit_profile_controller.dart';

class EditProfileView extends GetView<EditProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          title: controller.isFromLoginScreen
              ? 'Enter Your Details'
              : 'Edit Profile',
          subTitle: 'Family member details'),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: Get.width,
          child: CustomBtn(
            text: controller.isFromLoginScreen ? 'Done' : 'Save',
            onPress: controller.updateUser,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(right: 16, left: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // _signUpText(),
              _profileImage(),
              _editProfileBtn(),
              _textFields(),
              SizedBox(
                height: 8,
              ),
              _switch(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _switch() => Obx(
        () => CustomForGenderSwitch(
          onAPressed: () => controller.onSwitchASelected,
          switchAValue: controller.isMale.value,
          onBPressed: () => controller.onSwitchBSelected,
          switchBValue: controller.isFemale.value,
        ),
      );

  Widget _profileImage() => Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Center(
          child: InkWell(
            onTap: () {
              controller.pickProfileImage();
            },
            child: Obx(
              () => CircleAvatar(
                radius: 60,
                backgroundColor: Colors.grey.withOpacity(0.3),
                child: controller.profileImage.value != ''
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.file(
                          File(controller.profileImage.value),
                          height: 120,
                          width: 120,
                          fit: BoxFit.cover,
                        ),
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(120),
                        child: SizedBox(
                          height: 120,
                          width: 120,
                          child: Image.network(
                            USER_INFO.value.image ?? '',
                            fit: BoxFit.cover,
                            errorBuilder: (_, __, ___) => Icon(
                              Icons.person,
                              size: 120,
                            ),
                          ),
                        ),
                      ),
              ),
            ),
          ),
        ),
      );

  Widget _editProfileBtn() => Center(
      child: TextButton(
          onPressed: () => controller.pickProfileImage(),
          child: Text(
            'Edit Image',
            style:
                Get.textTheme.bodyText2!.copyWith(color: kTextFieldBorderColor),
          )));

  Widget _textFields() => Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Form(
          key: controller.editProfileFormKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              NameTextField(controller: controller.nameController),
              SizedBox(
                height: 16,
              ),
              EmailTextField(controller: controller.emailController),
              SizedBox(
                height: 16,
              ),
              DobTextField(controller: controller.dobController),
              SizedBox(
                height: 16,
              ),
              if (!controller.isFromLoginScreen)
                // 0='emirates_id', 1='passport'
                USER_INFO.value.residentType == '1'
                    ? PassportNumberTextField(
                        keyboardType: TextInputType.text,
                        controller: controller.idNumberController,
                        labelText: 'Passport Number',
                        validator: (passportNumber) =>
                            CustomValidators.passportValidator(passportNumber),
                      )
                    : EmirateIDTextField(
                        formatter: controller.editProfileMaskFormatter,
                        keyboardType: TextInputType.number,
                        controller: controller.idNumberController,
                        labelText: 'Emirate ID',
                        validator: (emirateId) =>
                            CustomValidators.emirateIdValidator(emirateId),
                      ),
            ],
          ),
        ),
      );
}

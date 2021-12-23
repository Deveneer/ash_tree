import 'package:ash_tree/app/constants/colors.dart';
import 'package:ash_tree/app/customs/custom_btn.dart';
import 'package:ash_tree/app/utils/custom_switch.dart';
import 'package:ash_tree/app/utils/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/sign_up_controller.dart';

class SignUpView extends GetView<SignUpController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: Get.width,
          child: CustomBtn(
            text: 'Done',
            onPress: controller.onDonePressed,
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(right: 16, left: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _signUpText(),
                _profileImage(),
                _editProfileBtn(),
                _textFields(),
                _switch(),
              ],
            ),
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

  Widget _signUpText() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Text(
          'Enter Your\nProfile Details',
          style: Get.textTheme.headline4!
              .copyWith(color: kPrimaryColor, fontWeight: FontWeight.bold),
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
                radius: 50,
                backgroundColor: Colors.grey.withOpacity(0.3),
                child: controller.profileImage.value.path != ''
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.file(
                          controller.profileImage.value,
                          height: 100,
                          width: 100,
                          fit: BoxFit.cover,
                        ),
                      )
                    : Icon(
                        Icons.person,
                        size: 60,
                        color: Colors.grey[800],
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
            key: controller.formKey,
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
              ],
            )),
      );
}

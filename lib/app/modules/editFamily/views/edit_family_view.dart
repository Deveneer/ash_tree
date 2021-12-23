import 'package:ash_tree/app/constants/colors.dart';
import 'package:ash_tree/app/customs/custom_btn.dart';
import 'package:ash_tree/app/modules/editFamily/controllers/edit_family_controller.dart';
import 'package:ash_tree/app/utils/custom_appBar.dart';
import 'package:ash_tree/app/utils/custom_switch.dart';
import 'package:ash_tree/app/utils/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class EditFamilyView extends GetView<EditFamilyController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          title: 'Edit Family Member', subTitle: 'Family member details'),
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
              _emergencyBox()
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
                child: controller.profileImage.value.path != ''
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.file(
                          controller.profileImage.value,
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
                            controller.familyMemberDetails.profileImage ?? '',
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
            key: controller.editFamilyFormKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                NameTextField(controller: controller.nameController),
                SizedBox(
                  height: 16,
                ),
                DobTextField(controller: controller.dobController),
                SizedBox(
                  height: 16,
                ),
                RelationshipTextField(
                  controller: controller.relationController,
                ),
                SizedBox(
                  height: 16,
                ),
                AddPreExistingConditionForFamilyTextFeild(
                  controller: controller
                      .editFamilyMemberPreExistingConditionTextController,
                ),
              ],
            )),
      );

  Widget _emergencyBox() => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: ListTile(
          title: Text('Want to add this person as a emergency contact'),
          horizontalTitleGap: 0,
          leading: Icon(
            Icons.notification_important_outlined,
            color: Colors.red,
          ),
          trailing: Obx(
            () => Checkbox(
              value: controller.isEmergency.value,
              activeColor: Colors.red,
              onChanged: (newValue) {
                controller.isEmergency.value = newValue!;
              },
            ),
          ),
        ),
      );
}

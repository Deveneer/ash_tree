import 'package:ash_tree/app/constants/colors.dart';
import 'package:ash_tree/app/constants/strings.dart';
import 'package:ash_tree/app/customs/custom_btn.dart';
import 'package:ash_tree/app/utils/custom_appBar.dart';
import 'package:ash_tree/app/utils/custom_switch.dart';
import 'package:ash_tree/app/utils/custom_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/add_family_controller.dart';

class AddFamilyView extends GetView<AddFamilyController> {
  @override
  Widget build(BuildContext context) {
    controller.deviceWidth.value = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: CustomAppBar(
          title: kAddFamilyMember, subTitle: 'Family member details'),
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
            _profileImage(),
            _editProfileImageBtn(),
            _textFields(),
            SizedBox(
              height: 8,
            ),
            _switch(),
            SizedBox(
              height: 25,
            ),
            _emergencyBox(),
          ],
        ),
      )),
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
                        borderRadius: BorderRadius.circular(70),
                        child: Image.file(
                          controller.profileImage.value,
                          height: 120,
                          width: 120,
                          fit: BoxFit.cover,
                        ),
                      )
                    : Icon(
                        Icons.person,
                        size: 70,
                        color: Colors.grey[800],
                      ),
              ),
            ),
          ),
        ),
      );

  Widget _editProfileImageBtn() => Center(
        child: TextButton(
          onPressed: () => controller.pickProfileImage(),
          child: Text(
            'Edit Image',
            style:
                Get.textTheme.bodyText2!.copyWith(color: kTextFieldBorderColor),
          ),
        ),
      );

  Widget _textFields() => Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Form(
          key: controller.addFamilyFormKey,
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
                    .addFamilyMemberPreExistingConditionTextController,
              ),
            ],
          ),
        ),
      );

  Widget _emergencyBox() => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Obx(
          () => ListTile(
            title: Text('Want to add this person as a emergency contact'),
            horizontalTitleGap: 0,
            leading: Icon(
              Icons.alarm,
              color: Colors.red,
            ),
            trailing: Checkbox(
              value: controller.isEmergency.value,
              activeColor: Colors.red,
              onChanged: (e) {
                controller.isEmergency.value = e!;
              },
            ),
          ),
        ),
      );
}

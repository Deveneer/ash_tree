import 'package:ash_tree/app/constants/colors.dart';
import 'package:ash_tree/app/constants/strings.dart';
import 'package:ash_tree/app/customs/custom_btn.dart';
import 'package:ash_tree/app/locale/sessions.dart';
import 'package:ash_tree/app/utils/custom_appBar.dart';
import 'package:ash_tree/app/utils/custom_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          title: "Profile", subTitle: "Lorem Ipsum is simply dummy text"),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomBtn(
          text: 'Edit',
          onPress: controller.onEditPressed,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 16),
          width: Get.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _profile(),
              Container(
                padding: EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Add Pre-Existing Condition.',
                      style: Get.textTheme.button!.copyWith(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Form(
                        key: controller.preExistingConditionFormKey,
                        child: AddPreExistingConditionTextFeild(
                          controller: controller
                              .preExistingConditionTextEditingController,
                          sendPreExistingCondition: (preExistingCondition) {
                            controller
                                .addPreExistingCondition(preExistingCondition);
                          },
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _profile() => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Obx(() => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
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
                SizedBox(
                  width: 4,
                ),
                Text(
                  USER_INFO.value.name != null && USER_INFO.value.name != ''
                      ? USER_INFO.value.name!
                      : notAvailable,
                  style: Get.textTheme.headline4!.copyWith(
                      fontWeight: FontWeight.bold, color: kPrimaryColor),
                ),
                SizedBox(height: 10),
                _item('Email: ', USER_INFO.value.email ?? notAvailable),
                _item('Mobile: ', USER_INFO.value.mobile ?? notAvailable),
                _item('Gender: ',
                    USER_INFO.value.gender == 'male' ? 'Male' : 'Female'),
                _item('DOB: ', USER_INFO.value.dob ?? notAvailable),
                _item(
                    USER_INFO.value.residentType == '0'
                        ? 'Emirate Id: '
                        : 'Passport Number: ',
                    USER_INFO.value.idNumber ?? notAvailable),
              ],
            )),
      );
  Widget _item(String title, String value) => Container(
        width: Get.width,
        margin: EdgeInsets.symmetric(vertical: 5.5),
        padding: EdgeInsets.symmetric(vertical: 9),
        decoration: BoxDecoration(
            color: kPrimaryColor, borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            Container(
              width: Get.width * 2.2 / 5,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  title,
                  style: Get.textTheme.button!
                      .copyWith(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
            Container(
              width: Get.width * 2.4 / 5,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  value,
                  style: Get.textTheme.button!
                      .copyWith(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      );
}

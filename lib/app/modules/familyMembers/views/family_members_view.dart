import 'package:ash_tree/app/api/provider/api_handlers.dart';
import 'package:ash_tree/app/constants/strings.dart';
import 'package:ash_tree/app/customs/custom_btn.dart';
import 'package:ash_tree/app/utils/custom_appBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/family_members_controller.dart';
import 'components/memberCard.dart';

class FamilyMembersView extends GetView<FamilyMembersController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          CustomAppBar(title: kFamilyMember, subTitle: 'Family member details'),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: Get.width,
          child: CustomBtn(
            text: 'Add',
            onPress: controller.onAddPressed,
          ),
        ),
      ),
      body: controller.obx(
          (state) => ListView.builder(
                itemBuilder: (_, i) => FamilyMemberCard(state!.data![i]),
                itemCount: state!.data!.length,
              ),
          onLoading: ApiHandler().progressIndicator(),
          onEmpty: ApiHandler().emptyWidget()),
    );
  }
}

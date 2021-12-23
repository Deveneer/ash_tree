import 'package:ash_tree/app/api/provider/api_handlers.dart';
import 'package:ash_tree/app/constants/colors.dart';
import 'package:ash_tree/app/constants/strings.dart';
import 'package:ash_tree/app/customs/custom_btn.dart';
import 'package:ash_tree/app/locale/sessions.dart';
import 'package:ash_tree/app/models/family_member_response.dart';
import 'package:ash_tree/app/routes/app_pages.dart';
import 'package:ash_tree/app/utils/custom_appBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/family_member_select_controller.dart';

class FamilyMemberSelectView extends GetView<FamilyMemberSelectController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: kFamilyMember,
        subTitle: 'Family member details',
      ),
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
      body: Container(
        child: Column(
          children: [
            Container(
              child: _personalRadioCard(),
            ),
            Expanded(
              child: controller.obx(
                (state) => ListView.builder(
                  itemBuilder: (_, i) => _radioItem(state!.data![i]),
                  itemCount: state!.data!.length,
                ),
                onLoading: ApiHandler().progressIndicator(),
                onEmpty: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 8.0),
                  child: Text(
                    'No Family Member has been added.',
                    textAlign: TextAlign.center,
                    style: Get.textTheme.headline6,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _radioItem(Data data) => Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey.withOpacity(0.3),
                    radius: 50,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(60),
                      child: SizedBox(
                        height: 100,
                        width: 100,
                        child: Image.network(
                          data.profileImage ?? '',
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) => Icon(
                            Icons.supervised_user_circle_rounded,
                            size: 60,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        controller.familyId.value = data.id.toString();
                        Get.toNamed(Routes.ADDRESS_SELECT);
                        SessionManager().saveString(
                            kMemberIdKey, controller.familyId.value);
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data.name ?? '',
                            style: Get.textTheme.headline6!
                                .copyWith(fontWeight: FontWeight.w600),
                          ),
                          Text(
                            data.relationship!,
                            style:
                                Get.textTheme.caption!.copyWith(fontSize: 15),
                          ),
                          Text(
                            data.dob!,
                            style:
                                Get.textTheme.caption!.copyWith(fontSize: 15),
                          ),
                          Text(
                            data.gender == '0' ? 'Male' : 'Female',
                            style:
                                Get.textTheme.caption!.copyWith(fontSize: 15),
                          ),
                          Text(
                            data.preExistingCondition ?? notAvailable,
                            style:
                                Get.textTheme.caption!.copyWith(fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Obx(
                    () => Radio(
                      value: data.id!,
                      activeColor: kPrimaryColor,
                      groupValue: controller.familyId.value,
                      onChanged: (v) {
                        controller.familyId.value = v.toString();
                        Get.toNamed(Routes.ADDRESS_SELECT);
                        SessionManager().saveString(
                          kMemberIdKey,
                          controller.familyId.value,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              right: 0,
              top: 0,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => controller.onDeletePressed(data.id!),
                    icon: Icon(
                      Icons.delete,
                      size: 16,
                    ),
                  ),
                  IconButton(
                    onPressed: () => controller.onEditPressed(data),
                    icon: Icon(
                      Icons.edit,
                      size: 16,
                    ),
                  ),
                ],
              ),
            ),
            data.emergency == '0'
                ? Positioned(bottom: 0, right: 0, child: _emergencyTag())
                : Container(),
          ],
        ),
      );

  Widget _emergencyTag() => Container(
        padding: EdgeInsets.symmetric(horizontal: 6),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16)),
            color: kTextFieldBorderColor),
        child: Text(
          'Emergency Contact',
          style: Get.textTheme.button!.copyWith(color: Colors.white),
        ),
      );

  Widget _personalRadioCard() => Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey.withOpacity(0.3),
                    radius: 50,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(60),
                      child: SizedBox(
                        height: 100,
                        width: 100,
                        child: Image.network(
                          USER_INFO.value.image ?? notAvailable,
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) => Icon(
                            Icons.supervised_user_circle_rounded,
                            size: 60,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        controller.familyId.value = '0';
                        Get.toNamed(Routes.ADDRESS_SELECT);
                        SessionManager().saveString(
                            kMemberIdKey, controller.familyId.value);
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            USER_INFO.value.name ?? notAvailable,
                            style: Get.textTheme.headline6!
                                .copyWith(fontWeight: FontWeight.w600),
                          ),
                          Text(
                            'Self',
                            style:
                                Get.textTheme.caption!.copyWith(fontSize: 15),
                          ),
                          Text(
                            USER_INFO.value.dob ?? notAvailable,
                            style:
                                Get.textTheme.caption!.copyWith(fontSize: 15),
                          ),
                          Text(
                            USER_INFO.value.gender == 'male'
                                ? 'Male'
                                : 'Female',
                            style:
                                Get.textTheme.caption!.copyWith(fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Obx(
                    () => Radio(
                      value: 0,
                      activeColor: kPrimaryColor,
                      groupValue: controller.familyId.value,
                      onChanged: (v) {
                        controller.familyId.value = v.toString();
                        Get.toNamed(Routes.ADDRESS_SELECT);
                        SessionManager().saveString(
                            kMemberIdKey, controller.familyId.value);
                      },
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      );
}

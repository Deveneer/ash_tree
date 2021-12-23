import 'package:ash_tree/app/constants/colors.dart';
import 'package:ash_tree/app/constants/strings.dart';
import 'package:ash_tree/app/models/family_member_response.dart';
import 'package:ash_tree/app/modules/familyMembers/controllers/family_members_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FamilyMemberCard extends StatelessWidget {
  final Data data;
  FamilyMemberCard(this.data);
  final FamilyMembersController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Card(
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: Get.width * .35,
                      child: Text(
                        data.name ?? '',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Get.textTheme.headline6!.copyWith(
                            fontWeight: FontWeight.w600, fontSize: 18),
                      ),
                    ),
                    Container(
                      width: Get.width * .35,
                      child: Text(
                        data.relationship!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Get.textTheme.caption!.copyWith(fontSize: 15),
                      ),
                    ),
                    Text(
                      data.dob!,
                      style: Get.textTheme.caption!.copyWith(fontSize: 15),
                    ),
                    Text(
                      data.gender == '0' ? 'Male' : 'Female',
                      style: Get.textTheme.caption!.copyWith(fontSize: 15),
                    ),
                    Text(
                      data.preExistingCondition ?? notAvailable,
                      style: Get.textTheme.caption!.copyWith(fontSize: 15),
                    ),
                  ],
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
                      onPressed: () => _controller.onDeletePressed(data.id!),
                      icon: Icon(Icons.delete)),
                  IconButton(
                      onPressed: () => _controller.onEditPressed(data),
                      icon: Icon(Icons.edit)),
                ],
              )),
          data.emergency == '1'
              ? Positioned(bottom: 0, right: 0, child: _emergencyTag())
              : Container()
        ],
      ),
    );
  }

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
}

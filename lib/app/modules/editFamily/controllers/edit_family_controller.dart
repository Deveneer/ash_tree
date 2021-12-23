import 'dart:io';
import 'package:ash_tree/app/api/provider/api_provider.dart';
import 'package:ash_tree/app/constants/strings.dart';
import 'package:ash_tree/app/modules/familyMembers/controllers/family_members_controller.dart';
import 'package:ash_tree/app/utils/custom_image_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditFamilyController extends GetxController {
  var familyMemberDetails = Get.arguments;
  var isMale = false.obs;
  var isFemale = false.obs;
  late TextEditingController nameController;
  late TextEditingController dobController;
  late TextEditingController relationController;
  late TextEditingController editFamilyMemberPreExistingConditionTextController;
  final editFamilyFormKey = GlobalKey<FormState>();
  late Rx<File> profileImage = Rx<File>(File(''));
  RxBool isEmergency = false.obs;
  ApiProvider _apiProvider = Get.find();

  @override
  void onInit() {
    super.onInit();
    nameController =
        TextEditingController(text: familyMemberDetails.name ?? notAvailable);
    dobController =
        TextEditingController(text: familyMemberDetails.dob ?? notAvailable);
    relationController = TextEditingController(
        text: familyMemberDetails.relationship ?? notAvailable);
    editFamilyMemberPreExistingConditionTextController = TextEditingController(
        text: familyMemberDetails.preExistingCondition ?? notAvailable);
    if (familyMemberDetails.gender == '0') {
      isMale.value = true;
    } else {
      isFemale.value = true;
    }
    isEmergency.value = familyMemberDetails.emergency == '1' ? true : false;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  onDonePressed() {
    if (editFamilyFormKey.currentState!.validate()) {
      Map<String, dynamic> requestMap = {
        'name': nameController.text,
        'relationship': relationController.text,
        'dob': dobController.text,
        'gender': isMale.value ? '0' : '1',
        'emergency': isEmergency.value ? '1' : '0',
        'family_member_id': familyMemberDetails.id,
        if (profileImage.value.path != '')
          'profile_pic': MultipartFile(profileImage.value,
              filename: profileImage.value.path.split("/").last),
        'pre_existing_conditions':
            editFamilyMemberPreExistingConditionTextController.text,
      };
      Fluttertoast.showToast(
          msg: 'Please wait updating family member profile.');
      _apiProvider.editFamily(requestMap).then(
        (value) {
          if (value.isOk) {
            FamilyMembersController _ctr = Get.find();
            _ctr.getFamilyMembers();
            Get.back();
          } else
            Get.snackbar("Something went wrong.", 'Please try againg later.');
        },
      );
    }
  }

  onSwitchASelected() {
    Get.log('on Female Pressed');
    isMale.value = true;
    isFemale.value = false;
  }

  onSwitchBSelected() {
    Get.log('on Male Pressed');
    isMale.value = false;
    isFemale.value = true;
  }

  pickProfileImage() {
    // 1 ->camera and 2 ->gallery
    CustomImagePicker _customPicker = CustomImagePicker();
    _customPicker.showImagePicker(Get.context!, imgFromCamera, imgFromGallery);
    print(profileImage.value);
  }

  void imgFromCamera() {
    // ignore: invalid_use_of_visible_for_testing_member
    ImagePicker.platform
        .pickImage(source: ImageSource.camera, imageQuality: 50)
        .then((value) {
      if (value != null) {
        profileImage.value = File(value.path);
      }
    }).catchError((e) {
      print('$e');
    });
    print('----imgFromCamera-- ---${profileImage.value.path}');
  }

  void imgFromGallery() {
    // ignore: invalid_use_of_visible_for_testing_member
    ImagePicker.platform
        .pickImage(source: ImageSource.gallery, imageQuality: 50)
        .then((value) {
      if (value != null) {
        profileImage.value = File(value.path);
      }
    }).catchError((e) {
      print('$e');
    });

    print('----imgFromGallery--${profileImage.value.path}');
    Get.back();
  }
}

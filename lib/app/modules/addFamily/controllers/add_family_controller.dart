import 'dart:io';
import 'package:ash_tree/app/api/provider/api_provider.dart';
import 'package:ash_tree/app/modules/familyMemberSelect/controllers/family_member_select_controller.dart';
import 'package:ash_tree/app/modules/familyMembers/controllers/family_members_controller.dart';
import 'package:ash_tree/app/utils/custom_image_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddFamilyController extends GetxController {
  var isMale = true.obs;
  var isFemale = false.obs;
  bool isFromHomeScreen = Get.arguments['isFromHomeScreen'];
  late TextEditingController nameController;
  late TextEditingController dobController;
  late TextEditingController relationController;
  late TextEditingController addFamilyMemberPreExistingConditionTextController;
  final addFamilyFormKey = GlobalKey<FormState>();
  late Rx<File> profileImage = Rx<File>(File(''));
  var isEmergency = false.obs;

  ApiProvider _apiProvider = Get.find();
  RxDouble deviceWidth = (0.0).obs;

  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController();
    dobController = TextEditingController();
    relationController = TextEditingController();
    addFamilyMemberPreExistingConditionTextController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  onDonePressed() {
    if (addFamilyFormKey.currentState!.validate()) {
      Map<String, dynamic> requestMap = {
        'name': nameController.text,
        'relationship': relationController.text,
        'dob': dobController.text,
        'gender': isMale.value ? '0' : '1',
        'emergency': isEmergency.value ? '1' : '0',
        if (profileImage.value.path != '')
          'profile_pic': MultipartFile(profileImage.value,
              filename: profileImage.value.path.split("/").last),
        'pre_existing_conditions':
            addFamilyMemberPreExistingConditionTextController.text,
      };
      Fluttertoast.showToast(msg: 'Please wait adding family member.');
      _apiProvider.addFamily(requestMap).then(
        (value) {
          if (value.isOk) {
            Fluttertoast.showToast(msg: 'Family member added successfully.');
            if (isFromHomeScreen) {
              FamilyMembersController familyMembersController = Get.find();
              familyMembersController.getFamilyMembers();
              Get.back();
            } else {
              FamilyMemberSelectController familyMemberSelectController =
                  Get.find();
              familyMemberSelectController.getFamilyMembers();
              Get.back();
            }
          } else
            Get.snackbar('Error Occured', "Something went wrong.");
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
    print(profileImage.value.path);
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

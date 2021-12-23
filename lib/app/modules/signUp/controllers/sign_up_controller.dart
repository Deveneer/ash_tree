import 'dart:io';
import 'package:ash_tree/app/utils/custom_image_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class SignUpController extends GetxController {
  var isMale = false.obs;
  var isFemale = false.obs;
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController dobController;
  final formKey = GlobalKey<FormState>();
  late Rx<File> profileImage = Rx<File>(File(''));

  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController();
    emailController = TextEditingController();
    dobController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  onDonePressed() {}
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
    print('----imgFromCamera--${profileImage.value.path}');
    Get.back();
    uploadProfileImage();
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
      // Get.log(e.toString());
      print('$e');
    });
    // profileImage.value = await ImagePicker.pickImage(
    //     source: ImageSource.camera, imageQuality: 50);

    print('----imgFromGallery--${profileImage.value.path}');

    Get.back();
    uploadProfileImage();
  }

  void uploadProfileImage() {}
}

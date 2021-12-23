import 'dart:io';
import 'package:ash_tree/app/api/provider/api_handlers.dart';
import 'package:ash_tree/app/api/provider/api_provider.dart';
import 'package:ash_tree/app/locale/sessions.dart';
import 'package:ash_tree/app/models/verify_otp_response.dart';
import 'package:ash_tree/app/routes/app_pages.dart';
import 'package:ash_tree/app/utils/custom_formatter.dart';
import 'package:ash_tree/app/utils/custom_image_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileController extends GetxController {
  bool isFromLoginScreen = Get.arguments['isFromLoginScreen'];
  String userToken = Get.arguments['userToken'];
  var isMale = false.obs;
  var isFemale = false.obs;
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController dobController;
  late TextEditingController idNumberController;
  final editProfileFormKey = GlobalKey<FormState>();
  var profileImage = ''.obs;
  ApiProvider _apiProvider = Get.find();
  TextInputFormatter editProfileMaskFormatter =
      CustomFormatter(mask: '###-####-#######-#', separator: '-');

  @override
  void onInit() {
    super.onInit();
    if (USER_INFO.value.gender == 'male') {
      isMale.value = true;
    } else {
      isFemale.value = true;
    }
    nameController = TextEditingController(text: USER_INFO.value.name ?? '');
    emailController = TextEditingController(text: USER_INFO.value.email ?? '');
    dobController = TextEditingController(text: USER_INFO.value.dob ?? '');
    idNumberController =
        TextEditingController(text: USER_INFO.value.idNumber ?? '');
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  onDonePressed() {}
  onSwitchASelected() {
    Get.log('on Male Pressed');
    isMale.value = true;
    isFemale.value = false;
  }

  onSwitchBSelected() {
    Get.log('on Female Pressed');
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
        profileImage.value = value.path;
        uploadProfileImage(value.path);
      }
    }).catchError((e) {
      print('$e');
    });
    print('----imgFromCamera--${profileImage.value}');
    // Get.back();
  }

  void imgFromGallery() {
    // ignore: invalid_use_of_visible_for_testing_member
    ImagePicker.platform
        .pickImage(source: ImageSource.gallery, imageQuality: 50)
        .then((value) {
      if (value != null) {
        print('-------------picked Path---$value');
        profileImage.value = value.path;
        uploadProfileImage(value.path);
      }
    }).catchError((e) {
      // Get.log(e.toString());
      print('$e');
    });
    // profileImage.value = await ImagePicker.pickImage(
    //     source: ImageSource.camera, imageQuality: 50);

    print('----imgFromGallery--${profileImage.value}');

    Get.back();
  }

  updateUser() {
    if (editProfileFormKey.currentState!.validate()) {
      ApiHandler().loading();
      Map<String, String> requestMap = {
        'email': emailController.text,
        'name': nameController.text,
        'dob': dobController.text,
        'gender': isMale.value ? 'male' : 'female',
        'id_number': idNumberController.text,
      };
      print(requestMap);
      _apiProvider.updateProfileData(requestMap).then((value) {
        Get.back();
        if (value.isOk) {
          VerifyOtpResponse _data = VerifyOtpResponse.fromJson(value.body);
          USER_INFO.value = _data.data!;
          SessionManager().saveUser(USER_INFO.value);
          Fluttertoast.showToast(
              msg: _data.message ?? 'Profile updated successfully.');
          if (isFromLoginScreen) {
            SessionManager().saveToken(userToken);
            Get.offAllNamed(Routes.BOTTOMNAVBAR);
          } else
            Get.back();
        } else
          Fluttertoast.showToast(msg: value.body.message);
      });
    }
  }

  uploadProfileImage(String path) {
    Map<String, dynamic> requestMap = {
      'profile_pic': MultipartFile(File(path), filename: path.split("/").last)
    };
    _apiProvider.updateProfileImage(requestMap).then((value) {
      if (value.isOk) {
        var _data = VerifyOtpResponse.fromJson(value.body);
        USER_INFO.value = _data.data!;
        SessionManager().saveUser(USER_INFO.value);
        Fluttertoast.showToast(msg: _data.message ?? '');
      } else
        Fluttertoast.showToast(msg: value.body);
    });
  }
}

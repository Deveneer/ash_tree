import 'package:get/get.dart';
import 'package:ash_tree/app/api/provider/api_handlers.dart';
import 'package:ash_tree/app/api/provider/api_provider.dart';
import 'package:ash_tree/app/models/common_response.dart';
import 'package:ash_tree/app/models/family_member_response.dart';
import 'package:ash_tree/app/routes/app_pages.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FamilyMemberSelectController extends GetxController
    with StateMixin<FamilyMemberResponse> {
  ApiProvider _apiProvider = Get.find();
  var familyId = '1'.obs;
  bool isFromHomeScreen = Get.arguments['isFromHomeScreen'];
  RxDouble deviceWidth = (0.0).obs;
  RxBool bookTestForYourself = false.obs;

  @override
  void onInit() {
    super.onInit();
    deviceWidth.value = Get.width;
    getFamilyMembers();
  }

  @override
  void onReady() {
    super.onReady();
    change(null, status: RxStatus.loading());
  }

  @override
  void onClose() {
    super.onClose();
  }

  onAddPressed() {
    Get.toNamed(Routes.ADD_FAMILY,
        arguments: {'isFromHomeScreen': isFromHomeScreen});
  }

  onDeletePressed(String id) {
    ApiHandler().loading();
    Map<String, String> requestMap = {
      'family_id': id,
    };
    _apiProvider.deleteFamily(requestMap).then((value) {
      Get.back();
      if (value.isOk) {
        CommonResponse _data = CommonResponse.fromJson(value.body);
        Fluttertoast.showToast(msg: _data.message);
        getFamilyMembers();
      }
    });
  }

  onEditPressed(Data data) {
    Get.toNamed(Routes.EDIT_FAMILY, arguments: data);
  }

  getFamilyMembers() {
    _apiProvider.getFamilyMembers().then((value) {
      if (value.isOk) {
        FamilyMemberResponse _data = FamilyMemberResponse.fromJson(value.body);
        if (_data.data!.isEmpty) {
          change(null, status: RxStatus.empty());
        } else {
          change(_data, status: RxStatus.success());
        }
      } else {
        change(null, status: RxStatus.error(value.bodyString));
      }
    });
  }
}

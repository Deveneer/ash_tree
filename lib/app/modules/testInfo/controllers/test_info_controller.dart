import 'package:ash_tree/app/api/provider/api_provider.dart';
import 'package:ash_tree/app/constants/strings.dart';
import 'package:ash_tree/app/locale/sessions.dart';
import 'package:ash_tree/app/models/test_package_details_response.dart';
import 'package:ash_tree/app/routes/app_pages.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class TestInfoController extends GetxController
    with StateMixin<TestPackageDetailsResponse> {
  var packageId = Get.arguments;
  var visitType = 1.obs;
  RxBool isHomeVisitAvailable = false.obs;

  ApiProvider _apiProvider = Get.find();

  @override
  void onInit() {
    super.onInit();
    getPackageDetails();
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

  getPackageDetails() {
    Map<String, String> requestMap = {'test_packages_id': packageId.toString()};
    _apiProvider.testPackageDetails(requestMap).then(
      (value) {
        if (value.isOk) {
          TestPackageDetailsResponse _data =
              TestPackageDetailsResponse.fromJson(value.body);
          change(_data, status: RxStatus.success());
          isHomeVisitAvailable.value =
              _data.data!.isHomeVisitAvailable == '0' ? true : false;
        } else {
          Fluttertoast.showToast(msg: value.bodyString ?? '');
        }
      },
    );
  }

  onVisitSelected(int visit) {
    visitType.value = visit;
    SessionManager().saveString(kPackageIdKey, packageId);
    SessionManager().saveString(kVisitIdKey, visitType.value.toString());
    Get.offNamed(
      Routes.FAMILY_MEMBER_SELECT,
      arguments: {'isFromHomeScreen': false},
    );
  }
}

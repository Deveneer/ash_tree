import 'package:ash_tree/app/api/provider/api_provider.dart';
import 'package:ash_tree/app/models/test_packages_response.dart';
import 'package:get/get.dart';

class TestController extends GetxController
    with StateMixin<TestPackagesResponse> {
  var catId = Get.arguments;

  ApiProvider _apiProvider = Get.find();
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    change(null, status: RxStatus.loading());
    if (catId == null) {
      getPackages();
    } else {
      getCatPackages();
    }
  }

  @override
  void onClose() {
    super.onClose();
  }

  getPackages() {
    _apiProvider.getTestPackages().then((value) {
      if (value.isOk) {
        TestPackagesResponse _data = TestPackagesResponse.fromJson(value.body);
        if (_data.data!.isEmpty) {
          change(null, status: RxStatus.empty());
        } else {
          change(_data, status: RxStatus.success());
        }
      }
    });
  }

  getCatPackages() {
    Map<String, String> requestMap = {'cat_id': catId.toString()};
    _apiProvider.catTestPackages(requestMap).then((value) {
      if (value.isOk) {
        TestPackagesResponse _data = TestPackagesResponse.fromJson(value.body);
        if (_data.data!.isEmpty) {
          change(null, status: RxStatus.empty());
        } else {
          change(_data, status: RxStatus.success());
        }
      }
    });
  }
}

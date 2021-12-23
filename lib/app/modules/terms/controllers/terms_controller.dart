import 'package:ash_tree/app/api/provider/api_provider.dart';
import 'package:ash_tree/app/models/privacy_response.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class TermsController extends GetxController with StateMixin<PrivacyResponse> {
  ApiProvider _apiProvider = Get.find();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    change(null, status: RxStatus.loading());
    getPrivacy();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getPrivacy() {
    _apiProvider.getTerms().then((value) {
      if (value.isOk) {
        PrivacyResponse _data = PrivacyResponse.fromJson(value.body);
        if (_data.data!.isNotEmpty) {
          change(_data, status: RxStatus.success());
        } else {
          change(null, status: RxStatus.empty());
        }
      } else {
        Fluttertoast.showToast(msg: 'Something went wrong.');
      }
    });
  }
}

import 'package:ash_tree/app/api/provider/api_provider.dart';
import 'package:ash_tree/app/models/coupon_response.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class CouponController extends GetxController with StateMixin<CouponResponse> {
  ApiProvider _apiProvider = Get.find();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    change(null, status: RxStatus.loading());
    getCouponData();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getCouponData() {
    _apiProvider.getCoupon().then((value) {
      if (value.isOk) {
        CouponResponse _data = CouponResponse.fromJson(value.body);
        if (_data.data!.isNotEmpty) {
          change(_data, status: RxStatus.success());
        } else {
          change(null, status: RxStatus.empty());
        }
      } else {
        // change(null, status: RxStatus.error(value.bodyString));
        Fluttertoast.showToast(msg: value.bodyString??'');
      }
    });
  }
}

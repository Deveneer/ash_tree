import 'package:ash_tree/app/api/provider/api_handlers.dart';
import 'package:ash_tree/app/api/provider/api_provider.dart';
import 'package:ash_tree/app/models/all_address_response.dart';
import 'package:ash_tree/app/models/common_response.dart';
import 'package:ash_tree/app/routes/app_pages.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class AddressSelectController extends GetxController
    with StateMixin<AllAddressResponse> {
  ApiProvider _apiProvider = Get.find();
  var addressId = '1'.obs;
  @override
  void onInit() {
    super.onInit();
    getAddresses();
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

  getAddresses() {
    _apiProvider.getAddress().then((value) {
      if (value.isOk) {
        AllAddressResponse _data = AllAddressResponse.fromJson(value.body);
        if (_data.data!.isEmpty) {
          change(null, status: RxStatus.empty());
        } else {
          change(_data, status: RxStatus.success());
        }
      }
    });
  }

  onDeletePressed(String id) {
    ApiHandler().loading();
    Map<String, String> requestMap = {
      'address_id': id,
    };
    _apiProvider.deleteAddress(requestMap).then((value) {
      Get.back();
      if (value.isOk) {
        CommonResponse _data = CommonResponse.fromJson(value.body);
        Fluttertoast.showToast(msg: _data.message);
        getAddresses();
      }
    });
  }

  onEditPressed(Data data) {
    Get.toNamed(Routes.EDIT_ADDRESS, arguments: data);
  }
}

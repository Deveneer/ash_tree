import 'package:ash_tree/app/api/provider/api_provider.dart';
import 'package:ash_tree/app/constants/strings.dart';
import 'package:ash_tree/app/models/appointment_response.dart';
import 'package:get/get.dart';

class OrdersController extends GetxController
    with StateMixin<AppointmentResponse> {
  ApiProvider _apiProvider = Get.find();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    change(null, status: RxStatus.loading());
    getOrders();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getOrders() {
    _apiProvider.getOrders().then(
      (value) {
        if (value.isOk) {
          AppointmentResponse _data = AppointmentResponse.fromJson(value.body);
          if (_data.data!.isNotEmpty) {
            change(_data, status: RxStatus.success());
          } else {
            change(null, status: RxStatus.empty());
          }
        } else {
          Get.snackbar('Error Occured', somethingWentWrongTryLater);
        }
      },
    );
  }
}

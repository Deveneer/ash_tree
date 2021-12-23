import 'package:ash_tree/app/api/provider/api_provider.dart';
import 'package:ash_tree/app/models/notification_response.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController
    with StateMixin<NotificationResponse> {
  ApiProvider _apiProvider = Get.find();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    change(null, status: RxStatus.loading());
    getNotifications();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getNotifications() {
    _apiProvider.getNotification().then(
      (value) {
        if (value.isOk) {
          NotificationResponse _data =
              NotificationResponse.fromJson(value.body);
          if (_data.data!.isNotEmpty) {
            change(_data, status: RxStatus.success());
          } else {
            change(null, status: RxStatus.empty());
          }
        } else {
          Fluttertoast.showToast(
            msg: 'Something went wrong while fetching notifications.',
          );
        }
      },
    );
  }
}

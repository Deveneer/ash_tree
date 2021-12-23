import 'package:ash_tree/app/api/provider/api_provider.dart';
import 'package:ash_tree/app/models/appointment_response.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class AppointmentsController extends GetxController
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
    getAppointments();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getAppointments() {
    _apiProvider.getAppointment().then(
      (value) {
        if (value.isOk) {
          AppointmentResponse _data = AppointmentResponse.fromJson(value.body);
          if (_data.data!.isNotEmpty) {
            change(_data, status: RxStatus.success());
          } else {
            change(null, status: RxStatus.empty());
          }
        } else {
          Fluttertoast.showToast(
            msg: 'Something went wrong while fetching appointments.',
          );
        }
      },
    );
  }
}

import 'package:ash_tree/app/api/provider/api_provider.dart';
import 'package:ash_tree/app/models/order_and_status_response.dart';
import 'package:ash_tree/app/modules/appointments/controllers/appointments_controller.dart';
import 'package:ash_tree/app/routes/app_pages.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class PaymentOptionController extends GetxController {
  ApiProvider _apiProvider = Get.find();
  var paymentOption = 1.obs;
  var couponId = Get.arguments;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  onOrderDone() {
    Map<String, String> requestMap = {
      'payment_method': paymentOption.value.toString(),
      'coupon_id': couponId.toString(),
    };
    _apiProvider.order(requestMap).then(
      (value) {
        if (value.isOk) {
          OrderAndStatusResponse _data =
              OrderAndStatusResponse.fromJson(value.body);
          if (paymentOption.value == 1) {
            Get.toNamed(
              Routes.PAYMENT_WEB_VIEW,
              arguments: {
                'paymentLink': _data.message,
              },
            )!
                .then(
              (value) {
                _apiProvider.getOrderStatus(_data.orderId!).then(
                  (value) {
                    if (value.isOk) {
                      OrderAndStatusResponse orderStatusData =
                          OrderAndStatusResponse.fromJson(value.body);
                      if (orderStatusData.orderStatus == 'SUCCESS')
                        Fluttertoast.showToast(
                            msg: 'Payment has been done successfully.');

                      if (orderStatusData.orderStatus == 'PENDING')
                        Fluttertoast.showToast(
                            msg: 'Payment is under process.');

                      if (orderStatusData.orderStatus == 'FAILED')
                        Fluttertoast.showToast(msg: 'Payment has been failed.');

                      AppointmentsController appointmentsController =
                          Get.find();
                      // Refresh the booked test appointments.
                      appointmentsController.getAppointments();
                      Get.until(
                        (route) => route.settings.name == Routes.BOTTOMNAVBAR,
                      );
                    }
                  },
                );
              },
            );
          }
          // For COD.
          else {
            Fluttertoast.showToast(msg: _data.message);
            AppointmentsController appointmentsController = Get.find();
            // Refresh the booked test appointments.
            appointmentsController.getAppointments();
            Get.until(
              (route) => route.settings.name == Routes.BOTTOMNAVBAR,
            );
          }
        } else {
          Get.snackbar(
            'An Error Occured. Status Code - ${value.statusCode}.',
            'Something went wrong. Try again later',
          );
        }
      },
    );
  }
}

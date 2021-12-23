import 'package:get/get.dart';

import '../controllers/payment_web_view_controller.dart';

class PaymentWebViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PaymentWebViewController>(
      () => PaymentWebViewController(),
    );
  }
}

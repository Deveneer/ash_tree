import 'dart:io';
import 'package:ash_tree/app/api/provider/api_handlers.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentWebViewController extends GetxController {
  String paymentLink = Get.arguments['paymentLink'];
  String paymentLinkEndPoints = '/api/payment_handler';
  ApiHandler apiHandler = ApiHandler();

  @override
  void onInit() {
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void onPageFinish(String url) {
    Get.back();
    if (url.contains(paymentLinkEndPoints)) {
      Get.back();
    }
  }

  void showLoader() {
    apiHandler.loading();
  }
}

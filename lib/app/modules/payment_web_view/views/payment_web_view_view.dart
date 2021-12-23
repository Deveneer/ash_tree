import 'package:ash_tree/app/constants/colors.dart';
import 'package:ash_tree/app/utils/custom_appBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../controllers/payment_web_view_controller.dart';

class PaymentWebViewView extends GetView<PaymentWebViewController> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.defaultDialog(
          title: 'Cancel Payment?',
          middleText: 'Are you sure to cancel the payment process?',
          middleTextStyle: TextStyle(fontSize: 18),
          radius: 10,
          buttonColor: kTextFieldBorderColor,
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  dialogButtons(isCancel: true),
                  dialogButtons(isCancel: false),
                ],
              ),
            )
          ],
        );
        return true;
      },
      child: Scaffold(
        appBar: CustomAppBarNoBack(
          title: 'Payment',
          subTitle: 'Lorem Ipsum is simply dummy text',
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
            child: Center(
              child: WebView(
                initialUrl: controller.paymentLink,
                javascriptMode: JavascriptMode.unrestricted,
                onPageStarted: (value) {
                  controller.showLoader();
                },
                onPageFinished: (String url) {
                  controller.onPageFinish(url);
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  InkWell dialogButtons({required bool isCancel}) {
    return InkWell(
      onTap: () {
        Get.back();
        if (isCancel) Get.back();
      },
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(isCancel ? 'Cancel' : 'Resume'),
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: kTextFieldBorderColor,
          ),
          borderRadius: BorderRadius.circular(20),
          color: isCancel ? Colors.white : kTextFieldBorderColor,
        ),
      ),
    );
  }
}

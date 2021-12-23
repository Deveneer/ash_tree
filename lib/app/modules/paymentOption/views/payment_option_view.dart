import 'package:ash_tree/app/constants/assets.dart';
import 'package:ash_tree/app/constants/colors.dart';
import 'package:ash_tree/app/customs/custom_btn.dart';
import 'package:ash_tree/app/utils/custom_appBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../controllers/payment_option_controller.dart';

class PaymentOptionView extends GetView<PaymentOptionController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          title: 'Payment Option',
          subTitle: 'Lorem Ipsum is simply dummy text'),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomBtn(
          text: 'PAY',
          onPress: () => controller.onOrderDone(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _itemCard('Payment', kCardSVG, 1),
            _itemCard('', kCODSVG, 0)
          ],
        ),
      ),
    );
  }

  Widget _itemCard(String title, String icon, int id) => Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 7,
        child: Obx(
          () => RadioListTile(
            controlAffinity: ListTileControlAffinity.trailing,
            title: Row(
              children: [
                SvgPicture.asset(icon),
                SizedBox(
                  width: 8,
                ),
                Text(
                  title,
                  style: Get.textTheme.headline6!
                      .copyWith(fontWeight: FontWeight.bold, fontSize: 17),
                ),
              ],
            ),
            onChanged: (value) {
              controller.paymentOption.value = id;
              print('-------$id');
            },
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            value: id,
            groupValue: controller.paymentOption.value,
            activeColor: kPrimaryColor,
          ),
        ),
      );
}

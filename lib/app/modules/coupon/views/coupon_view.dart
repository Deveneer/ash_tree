import 'package:ash_tree/app/api/provider/api_handlers.dart';
import 'package:ash_tree/app/constants/colors.dart';
import 'package:ash_tree/app/models/coupon_response.dart';
import 'package:ash_tree/app/modules/cart/controllers/cart_controller.dart';
import 'package:ash_tree/app/utils/custom_appBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/coupon_controller.dart';

class CouponView extends GetView<CouponController> {
  final CartController _cartController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          title: 'Your Coupons', subTitle: 'National reference laboratory'),
      body: controller.obx(
          (state) => ListView.builder(
                itemBuilder: (_, i) => InkWell(
                    onTap: () {
                      _cartController.coupon.value = state!.data![i];
                      _cartController.getCartData();
                      Get.back();
                    },
                    child: _item(state!.data![i])),
                itemCount: state!.data!.length,
              ),
          onLoading: ApiHandler().progressIndicator(),
          onEmpty: ApiHandler().emptyWidget()),
    );
  }

  Widget _item(Data data) => Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: ListTile(
          title: Text(
            data.title ?? '',
            style: Get.textTheme.headline6,
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data.name ?? '',
                style: Get.textTheme.bodyText2,
              ),
              Text(
                'Min Amount: ${data.miniCartVal ?? ''}',
                style: Get.textTheme.bodyText2,
              )
            ],
          ),
          leading: Icon(
            CupertinoIcons.tag_solid,
            size: 32,
          ),
          trailing: Text(
            '-${data.price ?? ''}',
            style:
                Get.textTheme.headline6!.copyWith(color: kTextFieldBorderColor),
          ),
        ),
      );
}

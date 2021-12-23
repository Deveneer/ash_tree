import 'package:ash_tree/app/api/provider/api_handlers.dart';
import 'package:ash_tree/app/constants/colors.dart';
import 'package:ash_tree/app/constants/strings.dart';
import 'package:ash_tree/app/customs/custom_btn.dart';
import 'package:ash_tree/app/models/cart_reponse.dart';
import 'package:ash_tree/app/modules/cart/views/components/cartItem.dart';
import 'package:ash_tree/app/routes/app_pages.dart';
import 'package:ash_tree/app/utils/custom_appBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/cart_controller.dart';

class CartView extends GetView<CartController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Your Cart',
        subTitle: 'National reference laboratory',
      ),
      bottomNavigationBar: _bottomNavButton(),
      body: SingleChildScrollView(
        child: controller.obx(
          (state) => Column(
            children: [
              ListView.builder(
                physics: ClampingScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (_, i) => CartItem(
                  state!.data![i],
                  (itemId) {
                    controller.removeTestPackage(itemId);
                  },
                ),
                itemCount: state!.data!.length,
              ),
              _coupon(),
              Obx(
                () => controller.priceVisible.value
                    ? _priceDetails(state.priceDetails!)
                    : Container(),
              )
            ],
          ),
          onLoading: ApiHandler().progressIndicator(),
          onEmpty: ApiHandler().emptyWidget(),
          onError: (_) => Center(child: Text(somethingWentWrongTryLater)),
        ),
      ),
    );
  }

  Widget _bottomNavButton() => Obx(
        () => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              if (!controller.isCartEmpty.value)
                Obx(
                  () => Text(
                    'AED ${controller.priceData.value.paybleAmount ?? ''}',
                    style: Get.textTheme.headline6!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: kTextFieldBorderColor,
                      fontSize: 18.5,
                    ),
                  ),
                ),
              if (!controller.isCartEmpty.value)
                CustomBtn(
                  onPress: controller.onPlaceOrderPressed,
                  text: 'Place Order',
                  buttonPadding: 15,
                )
            ],
          ),
        ),
      );

  Widget _coupon() => Obx(() => ListTile(
        leading: Icon(
          CupertinoIcons.tag,
          size: 32,
        ),
        onTap: () => Get.toNamed(Routes.COUPON),
        title: Text(
          'Coupons',
          style: Get.textTheme.headline6,
        ),
        trailing: Text(
          controller.coupon.value.name ?? '',
          style:
              Get.textTheme.headline6!.copyWith(color: kTextFieldBorderColor),
        ),
        subtitle: Text(
          'Apply Coupon to get discounts',
          style: Get.textTheme.bodyText2,
        ),
      ));

  Widget _priceDetails(PriceDetails priceDetails) => Container(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Price Details',
              style: Get.textTheme.headline6,
            ),
            Divider(),
            _price('Bag Total', priceDetails.beforeDiscount ?? notAvailable),
            _price('Bag Discount', '0'),
            _price('Coupon Discount', priceDetails.couponPrice ?? '0'),
            _price('Coupon Applied', priceDetails.couponName ?? 'Apply Coupon'),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total amount',
                    style: Get.textTheme.headline6!
                        .copyWith(color: Colors.black54, fontSize: 18),
                  ),
                  Text(
                    priceDetails.paybleAmount ?? '',
                    style: Get.textTheme.headline6!
                        .copyWith(color: Colors.black54, fontSize: 18),
                  )
                ],
              ),
            )
          ],
        ),
      );
  Widget _price(String t1, String t2) => Padding(
        padding: const EdgeInsets.all(3.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              t1,
              style: Get.textTheme.bodyText2!.copyWith(color: Colors.black54),
            ),
            Text(
              t2,
              style: Get.textTheme.bodyText2!.copyWith(color: Colors.black54),
            )
          ],
        ),
      );
}

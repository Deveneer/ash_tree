import 'dart:ui';
import 'package:ash_tree/app/constants/assets.dart';
import 'package:ash_tree/app/constants/colors.dart';
import 'package:ash_tree/app/constants/strings.dart';
import 'package:ash_tree/app/models/cart_reponse.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ash_tree/app/utils/date_time_string_provider.dart';

class CartItem extends StatelessWidget {
  final Data data;
  final Function removeTestPackage;
  CartItem(this.data, this.removeTestPackage);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      margin: const EdgeInsets.all(8.0),
      color: kPrimaryColor,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              data.packageName!,
              style: Get.textTheme.headline6!
                  .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white),
                margin: EdgeInsets.only(top: 38),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 5, right: 5, top: 6),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _image(data.labImage ?? ''),
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    data.labName ?? 'Test Lab',
                                    style: Get.textTheme.subtitle1!.copyWith(
                                      fontSize: 17,
                                      color: kPrimaryColor,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  Text(data.labAddress ?? notAvailable),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  _timeRow(data.slotTime!, data.bookingDate!)
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 4),
                    Divider(
                      thickness: 0.15,
                      height: 10,
                      color: kPrimaryColor,
                    ),
                    _rowOfVisitAndPrice(data.visitPlace!, data.packagePrice!),
                    SizedBox(height: 4),
                    Divider(
                      thickness: 0.15,
                      height: 10,
                      color: kPrimaryColor,
                    ),
                    _rowOfFamilyMemberNameAndRemoveTestFromCart(
                      data.familyMemberName ?? notAvailable,
                      data.profileImage ?? '',
                      data.cartId!,
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _image(String labImage) => ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.network(
          labImage,
          height: 100,
          width: 120,
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) => Container(
            height: 100,
            width: 120,
            decoration: BoxDecoration(color: Colors.grey.withOpacity(0.3)),
            child: Icon(Icons.error),
          ),
        ),
      );

  Widget _timeRow(String time, String date) {
    TextStyle dataAndTimeTextStyle = Get.textTheme.subtitle1!.copyWith(
      fontSize: 16,
      color: kPrimaryColor,
      fontWeight: FontWeight.w500,
    );

    return Column(
      children: [
        Row(
          children: [
            Icon(
              Icons.access_time_sharp,
              color: kSecondaryColor,
              size: 20,
            ),
            SizedBox(
              width: 4,
            ),
            Text(
              '${time.timeWithAmPmProvider()}',
              style: dataAndTimeTextStyle,
            ),
          ],
        ),
        Row(
          children: [
            Icon(
              Icons.calendar_today_outlined,
              color: kSecondaryColor,
              size: 20,
            ),
            SizedBox(
              width: 4,
            ),
            Text(
              '${date.provideDateString()}',
              style: dataAndTimeTextStyle,
            )
          ],
        )
      ],
    );
  }

  Widget _rowOfVisitAndPrice(String visitPlace, String price) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  visitPlace == '0' ? kOutlinedHomeSVG : kLabSVG,
                  color: kSecondaryColor,
                ),
                SizedBox(
                  width: 4,
                ),
                Text(
                  visitPlace == '0' ? 'Visit to Home' : 'Visit to Lab',
                  style: Get.textTheme.headline6!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: kSecondaryColor,
                      fontSize: 18),
                ),
              ],
            ),
            Text(
              'AED $price',
              style: Get.textTheme.headline6!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: kTextFieldBorderColor,
                  fontSize: 18),
            ),
          ],
        ),
      );

  Widget _rowOfFamilyMemberNameAndRemoveTestFromCart(
          String name, String img, String cartId) =>
      Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          bottom: 8,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: SizedBox(
                    height: 24,
                    width: 24,
                    child: Image.network(
                      img,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) =>
                          Icon(Icons.account_circle_sharp),
                    ),
                  ),
                ),
                SizedBox(
                  width: 4,
                ),
                Text(name,
                    style: Get.textTheme.headline6!
                        .copyWith(fontWeight: FontWeight.bold, fontSize: 18))
              ],
            ),
            InkWell(
              child: Row(
                children: [
                  Icon(
                    Icons.remove_circle_outline_rounded,
                    color: kSecondaryColor,
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    'Remove Test',
                    style: Get.textTheme.headline6!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: kSecondaryColor,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              onTap: () {
                removeTestPackage(cartId);
              },
            ),
          ],
        ),
      );
}

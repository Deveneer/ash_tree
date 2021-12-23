import 'package:ash_tree/app/constants/assets.dart';
import 'package:ash_tree/app/constants/colors.dart';
import 'package:ash_tree/app/constants/strings.dart';
import 'package:ash_tree/app/locale/sessions.dart';
import 'package:ash_tree/app/models/appointment_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ash_tree/app/utils/date_time_string_provider.dart';

class AppointmentCard extends StatelessWidget {
  final Data data;
  AppointmentCard(
    this.data,
  );

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 6,
      margin: const EdgeInsets.all(8.0),
      color: data.orderStatus == '1' ? kPrimaryColor : kTextFieldBorderColor,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 8, right: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  data.orderId!,
                  style: Get.textTheme.bodyText2!.copyWith(
                      color: data.orderStatus == '1'
                          ? kTextFieldBorderColor
                          : Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  width: 15,
                ),
                Flexible(
                  child: Text(
                    data.packageName!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Get.textTheme.bodyText2!.copyWith(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ],
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
                      padding: const EdgeInsets.fromLTRB(8, 8, 8, 2),
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
                                    data.labName ?? notAvailable,
                                    style: Get.textTheme.headline6!.copyWith(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Text(data.labAddress ?? notAvailable),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  _rowVisit(data.visitPlace!)
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
                    _timeRow(data.slotTime!, data.bookingDate!),
                    SizedBox(height: 2),
                    Divider(
                      thickness: 0.15,
                      height: 10,
                      color: kPrimaryColor,
                    ),
                    SizedBox(height: 4),
                    _rowOfFamilyMemberNameAndPrice(
                      data.testBookedFor ?? USER_INFO.value.name!,
                      data.packagePrice!,
                    ),
                    SizedBox(height: 6)
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _image(String s) => ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.network(
          s,
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

  Widget _rowVisit(String s) => Row(
        children: [
          Row(
            children: [
              SvgPicture.asset(
                // 0 => Home Visit, 1 => Lab Visit.
                s == '0' ? kOutlinedHomeSVG : kLabSVG,
                width: 18,
              ),
              SizedBox(
                width: 4,
              ),
              Text(
                s == '0' ? 'Home Visit' : 'Visit to Lab',
                style: Get.textTheme.headline6!
                    .copyWith(color: kSecondaryColor, fontSize: 17),
              ),
            ],
          ),
        ],
      );

  Widget _timeRow(String time, String date) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.access_time_sharp,
            color: kPrimaryColor,
            size: 21,
          ),
          SizedBox(
            width: 3,
          ),
          Text(
            '${time.timeWithAmPmProvider()} - ',
            style: Get.textTheme.subtitle1!.copyWith(
              fontSize: 18,
              color: kPrimaryColor,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            '${date.provideDateString()}',
            style: Get.textTheme.subtitle1!.copyWith(
              fontSize: 18,
              color: kPrimaryColor,
              fontWeight: FontWeight.w700,
            ),
          )
        ],
      );

  _rowOfFamilyMemberNameAndPrice(String bookedFor, String price) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
        bottom: 4,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Row(
              children: [
                Icon(
                  Icons.account_circle_sharp,
                  color: kTextFieldBorderColor,
                  size: 22,
                ),
                SizedBox(width: 5),
                Expanded(
                  child: Text(
                    bookedFor,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Get.textTheme.subtitle1!.copyWith(
                      fontSize: 18,
                      color: kTextFieldBorderColor,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 15),
          Text(
            'AED $price',
            style: Get.textTheme.subtitle1!.copyWith(
              fontSize: 18,
              color: kTextFieldBorderColor,
              fontWeight: FontWeight.w800,
            ),
          )
        ],
      ),
    );
  }
}

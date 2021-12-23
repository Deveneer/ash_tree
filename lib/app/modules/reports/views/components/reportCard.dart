import 'package:ash_tree/app/constants/colors.dart';
import 'package:ash_tree/app/models/report_response.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class ReportCard extends StatelessWidget {
  final Data data;

  const ReportCard({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      margin: const EdgeInsets.all(8.0),
      color: kPrimaryColor,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    data.orderId!,
                    style:
                        Get.textTheme.bodyText2!.copyWith(color: Colors.white),
                  ),
                  Text(
                    'COMPLETE BLOOD COUNT',
                    style:
                        Get.textTheme.bodyText2!.copyWith(color: Colors.white),
                  ),
                ],
              )),
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: Colors.white),
                margin: EdgeInsets.only(top: 32),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _image(data.labImage!),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    data.labName!,
                                    style: Get.textTheme.headline6!.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  Text(
                                    data.slotTime!,
                                    style: Get.textTheme.subtitle2,
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                        child: Divider(
                      height: 1,
                    )),
                    _reportBtn(data.report!),
                    SizedBox(
                      height: 4,
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
          height: 50,
          width: 50,
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) => Container(
            height: 50,
            width: 80,
            decoration: BoxDecoration(color: Colors.grey.withOpacity(0.3)),
            child: Icon(Icons.error),
          ),
        ),
      );

  // Widget _timeRow() => Row(
  //       children: [
  //         Icon(
  //           Icons.access_time_filled,
  //           color: kSecondaryColor,
  //           size: 18,
  //         ),
  //         SizedBox(
  //           width: 8,
  //         ),
  //         Text(
  //           '08.00 AM - 17.00 PM',
  //           style: Get.textTheme.subtitle2,
  //         )
  //       ],
  //     );

  Widget _reportBtn(String report) => TextButton(
      onPressed: () async {
        await canLaunch(report)
            ? await launch(report)
            : Fluttertoast.showToast(msg: 'Could not launch $report');
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.picture_as_pdf,
            color: kTextFieldBorderColor,
          ),
          SizedBox(
            width: 8,
          ),
          Text(
            'View Report',
            style: Get.textTheme.headline6!
                .copyWith(color: kTextFieldBorderColor, fontSize: 18),
          ),
        ],
      ));
}

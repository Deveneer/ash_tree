import 'package:ash_tree/app/constants/colors.dart';
import 'package:ash_tree/app/models/test_packages_response.dart';
import 'package:ash_tree/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TestCard extends StatelessWidget {
  final TestPackagesData data;
  TestCard(this.data);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      margin: const EdgeInsets.fromLTRB(15, 5, 15, 12),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: Get.width * .5,
                      child: Text(
                        data.name!,
                        style: Get.textTheme.headline6!.copyWith(
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(validTestComponentsProvider()),
                    SizedBox(
                      height: 8,
                    ),
                    _dotText(data.preparation!),
                  ],
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    height: 80,
                    width: 80,
                    decoration:
                        BoxDecoration(color: Colors.grey.withOpacity(0.3)),
                    child: Image.network(
                      validImageProvider(),
                      width: Get.width,
                      fit: BoxFit.cover,
                      height: Get.height / 2,
                      errorBuilder: (_, __, ___) => Container(
                        width: Get.width,
                        color: Colors.grey.withOpacity(0.3),
                        height: Get.height / 2,
                        child: Icon(
                          Icons.error,
                        ),
                        alignment: Alignment.center,
                      ),
                    ),
                  ),
                )
              ],
            ),
            _rowCoupon(data.price!)
          ],
        ),
      ),
    );
  }

  Widget _dotText(String text) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.green,
              radius: 6,
            ),
            SizedBox(
              width: 8,
            ),
            Container(
              width: Get.width * .4,
              child: Text(
                text == 'None' ? 'No special preparation required.' : text,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Get.textTheme.button!.copyWith(color: Colors.grey),
              ),
            )
          ],
        ),
      );

  Widget _rowCoupon(String price) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'AED $price',
            style: Get.textTheme.headline6!.copyWith(
                fontWeight: FontWeight.bold,
                color: kTextFieldBorderColor,
                fontSize: 18),
          ),
          MaterialButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            padding: EdgeInsets.symmetric(horizontal: 32),
            color: kPrimaryColor,
            onPressed: () => Get.toNamed(Routes.TEST_INFO, arguments: data.id),
            child: Text(
              'ADD',
              style: Get.textTheme.headline6!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 18),
            ),
          )
        ],
      );

  String validImageProvider() {
    String validImage = '';
    if (data.thumbImg.toString() != 'null')
      validImage = data.thumbImg.toString();
    else
      validImage = data.image.toString();
    return validImage;
  }

  String validTestComponentsProvider() {
    String validTestComponents = 'NA';
    if (data.components.toString() != 'null')
      validTestComponents = data.components.toString();
    return validTestComponents;
  }
}

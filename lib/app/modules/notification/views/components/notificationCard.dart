import 'package:ash_tree/app/constants/colors.dart';
import 'package:ash_tree/app/models/notification_response.dart';
import 'package:ash_tree/app/utils/custom_html_tag_remover.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationCard extends StatelessWidget {
  final Data data;
  NotificationCard(this.data);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            _image(data.image ?? 'http://noimage.com'),
            SizedBox(
              width: 12,
            ),
            _textColumn(data.message!),
          ],
        ),
      ),
    );
  }

  Widget _image(imageUrl) => Container(
        height: 70,
        width: 80,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: kTextFieldBorderColor),
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) {
            return Icon(
              Icons.error,
              size: 40,
              color: Colors.white,
            );
          },
        ),
      );

  Widget _textColumn(String message) => Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              HtmlTagRemover.removeHtmlTags(message),
              style: Get.textTheme.button!
                  .copyWith(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      );
}

import 'package:ash_tree/app/api/provider/api_handlers.dart';
import 'package:ash_tree/app/utils/custom_appBar.dart';
import 'package:ash_tree/app/utils/custom_html_tag_remover.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/privacy_controller.dart';

class PrivacyView extends GetView<PrivacyController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          title: "Privacy Policy",
          subTitle: "Lorem Ipsum is simply dummy text"),
      body: controller.obx(
          (state) => Container(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 10, 16, 100),
                    child: Text(
                      HtmlTagRemover.removeHtmlTags(state!.data),
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
          onLoading: ApiHandler().progressIndicator(),
          onEmpty: ApiHandler().emptyWidget()),
    );
  }
}

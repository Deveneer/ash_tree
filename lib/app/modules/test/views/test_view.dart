import 'package:ash_tree/app/api/provider/api_handlers.dart';
import 'package:ash_tree/app/routes/app_pages.dart';
import 'package:ash_tree/app/utils/custom_appBar.dart';
import 'package:ash_tree/app/utils/custom_testCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/test_controller.dart';

class TestView extends GetView<TestController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWithAction(
          onActionPress: () {},
          title: 'Test Packages',
          icon: CupertinoIcons.cart,
          subTitle: 'National reference laboratory'),
      body: controller.obx(
          (state) => ListView.builder(
                itemBuilder: (_, i) => InkWell(
                    onTap: () => Get.toNamed(Routes.TEST_INFO,
                        arguments: state!.data![i].id),
                    child: TestCard(state!.data![i])),
                itemCount: state!.data!.length,
              ),
          onLoading: ApiHandler().progressIndicator(),
          onEmpty: ApiHandler().emptyWidget()),
    );
  }
}

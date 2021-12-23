import 'package:ash_tree/app/api/provider/api_handlers.dart';
import 'package:ash_tree/app/modules/address/views/components/addressCard.dart';
import 'package:ash_tree/app/routes/app_pages.dart';
import 'package:ash_tree/app/utils/custom_appBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../customs/custom_btn.dart';
import '../controllers/address_controller.dart';

class AddressView extends GetView<AddressController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          title: 'Your Address', subTitle: 'Family member details'),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: Get.width,
          child: CustomBtn(
            text: 'Add New',
            onPress: () {
              Get.toNamed(Routes.ADD_ADDRESS);
            },
          ),
        ),
      ),
      body: controller.obx(
          (state) => ListView.builder(
                itemBuilder: (_, i) => AddressCard(state!.data![i]),
                itemCount: state!.data!.length,
                shrinkWrap: true,
              ),
          onLoading: ApiHandler().progressIndicator(),
          onEmpty: ApiHandler().emptyWidget()),
    );
  }
}

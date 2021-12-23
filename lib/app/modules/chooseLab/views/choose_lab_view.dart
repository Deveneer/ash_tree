import 'package:ash_tree/app/api/provider/api_handlers.dart';
import 'package:ash_tree/app/constants/colors.dart';
import 'package:ash_tree/app/routes/app_pages.dart';
import 'package:ash_tree/app/utils/Custom_labCard.dart';
import 'package:ash_tree/app/utils/custom_appBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import '../controllers/choose_lab_controller.dart';

class ChooseLabView extends GetView<ChooseLabController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          title: 'Choose a Lab', subTitle: 'National reference laboratory'),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _locCard(),
            Expanded(
              child: controller.obx(
                  (state) => ListView.builder(
                        itemBuilder: (_, i) => InkWell(
                            onTap: () {
                              Get.toNamed(Routes.TEST_INFO_SLOT,
                                  arguments: state!.data![i]);
                            },
                            child: LabCardItem(
                              data: state!.data![i],
                            )),
                        shrinkWrap: true,
                        itemCount: state!.data!.length,
                      ),
                  onEmpty: Center(
                    child: Container(
                      child: Text(
                        'No Labs Available Near You.',
                        style: Get.textTheme.headline6,
                      ),
                    ),
                  ),
                  // ApiHandler().emptyWidget(),
                  onLoading: ApiHandler().progressIndicator()),
            ),
          ],
        ),
      ),
    );
  }

  Widget _locCard() => Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.white),
        padding: const EdgeInsets.all(16.0),
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Icon(
                Icons.my_location_sharp,
                color: kSecondaryColor,
              ),
              SizedBox(
                width: 8,
              ),
              Obx(() => Text(
                    controller.currentAddress.value,
                    style: Get.textTheme.headline4!
                        .copyWith(fontSize: 16, fontWeight: FontWeight.w600),
                  ))
            ],
          ),
        ),
      );
}

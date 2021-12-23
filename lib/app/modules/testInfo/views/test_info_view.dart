import 'package:ash_tree/app/api/provider/api_handlers.dart';
import 'package:ash_tree/app/constants/assets.dart';
import 'package:ash_tree/app/constants/colors.dart';
import 'package:ash_tree/app/customs/custom_btn.dart';
import 'package:ash_tree/app/models/test_package_details_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../controllers/test_info_controller.dart';

class TestInfoView extends GetView<TestInfoController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          width: Get.width,
          child: CustomBtn(
            text: 'BOOK APPOINTMENT',
            onPress: () {
              showDialog(
                context: context,
                builder: (_) => Center(
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    children: [
                      Stack(
                        children: [
                          Positioned(
                            child: Container(
                              margin: EdgeInsets.only(
                                  left: 8, right: 8, bottom: 24),
                              padding: EdgeInsets.only(top: 8),
                              height: 100,
                              width: Get.width,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(32),
                                  color: kPrimaryColor),
                              alignment: Alignment.topCenter,
                              child: Text(
                                'Select sample collection option',
                                style: Get.textTheme.headline5!.copyWith(
                                    fontSize: 16, color: Colors.white),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 8, right: 8, top: 40),
                            padding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 16),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(32),
                                color: Colors.white),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'CHOOSE VISIT',
                                  // 0 => Home Visit, 1 => Lab Visit.
                                  style: Get.textTheme.headline5!
                                      .copyWith(fontWeight: FontWeight.w700),
                                ),
                                if (controller.isHomeVisitAvailable.value)
                                  Divider(),
                                if (controller.isHomeVisitAvailable.value)
                                  MaterialButton(
                                    onPressed: () =>
                                        controller.onVisitSelected(0),
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(
                                          kOutlinedHomeSVG,
                                          width: 40,
                                        ),
                                        SizedBox(
                                          width: 16,
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Home Visit',
                                                style: Get.textTheme.headline6,
                                              ),
                                              Text(
                                                'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                                                style: Get.textTheme.bodyText2,
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                Divider(),
                                MaterialButton(
                                  onPressed: () =>
                                      controller.onVisitSelected(1),
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                        kLabSVG,
                                        width: 40,
                                      ),
                                      SizedBox(
                                        width: 16,
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Lab Visit',
                                              style: Get.textTheme.headline6,
                                            ),
                                            Text(
                                              'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                                              style: Get.textTheme.bodyText2,
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
      body: SafeArea(
        child: controller.obx(
            (state) => SingleChildScrollView(
                  child: Stack(
                    children: [
                      _image(state!.data!.image!),
                      _backBtn(),
                      _infoCard(state.data!),
                    ],
                  ),
                ),
            onLoading: ApiHandler().progressIndicator()),
      ),
    );
  }

  Widget _image(String image) => Image.network(
        image,
        width: Get.width,
        height: Get.width,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) => Container(
          width: Get.width,
          height: Get.width,
          color: Colors.grey.withOpacity(0.3),
          child: Icon(
            Icons.error,
            color: Colors.grey,
            size: 60,
          ),
          alignment: Alignment.center,
        ),
      );

  Widget _backBtn() => Positioned(
        left: 15,
        top: 20,
        child: InkWell(
          onTap: () => Get.back(),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 24,
            child: Icon(
              CupertinoIcons.back,
              color: Colors.black,
            ),
          ),
        ),
      );

  Widget _infoCard(Data data) => Container(
        margin: EdgeInsets.only(top: Get.width * .88, bottom: Get.height * .1),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24), topRight: Radius.circular(24))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Text(
                      data.name!,
                      style: Get.textTheme.headline6!.copyWith(
                        fontSize: 22,
                      ),
                    ),
                  ),
                ),
                Text(
                  'AED ${data.price}',
                  style: Get.textTheme.headline6!.copyWith(
                      fontSize: 18,
                      color: kTextFieldBorderColor,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Divider(),
            _bullets('Test Info:', data.testInfo!),
            _bullets('Use of Test:', data.useOfTest!),
            _bullets('Components:', data.components!),
            Divider(),
            Text(
              'Tests Included:',
              style: Get.textTheme.headline6!.copyWith(
                  fontSize: 20,
                  color: kTextFieldBorderColor,
                  fontWeight: FontWeight.bold),
            ),
            ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.only(bottom: 20),
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (_, i) => Text(
                data.includeTest![i].name!,
                style: Get.textTheme.headline6!.copyWith(fontSize: 16),
              ),
              itemCount: data.includeTest!.length,
            ),
          ],
        ),
      );

  Widget _bullets(String t1, String t2) => Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: kTextFieldBorderColor,
              radius: 8,
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              t1,
              style: Get.textTheme.caption!
                  .copyWith(fontSize: 14, letterSpacing: 1),
            ),
            SizedBox(
              width: 4,
            ),
            Expanded(
              child: Text(
                t2,
                style: Get.textTheme.button,
              ),
            ),
          ],
        ),
      );

  customDialog(BuildContext context) => Get.dialog(
      Center(
        child: Container(
          height: Get.height / 3,
          margin: EdgeInsets.symmetric(horizontal: 24),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24), color: kPrimaryColor),
          child: Scaffold(
            body: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: Get.height / 3,
                  width: Get.width,
                  padding: EdgeInsets.only(top: 8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: kPrimaryColor),
                  child: Text('Select sample collection option'),
                ),
                Positioned(
                  top: 10,
                  child: Container(
                    padding: EdgeInsets.only(top: 8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        color: Colors.white),
                    child: Column(
                      children: [
                        Text(
                          'Choose Visit',
                          style: Get.textTheme.headline5,
                        ),
                        Divider(),
                        Column(
                          children: [
                            dialogRadioItem('Home Visit', 0, kOutlinedHomeSVG),
                            dialogRadioItem('Lab Visit', 1, kLabSVG),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      barrierDismissible: true);
  Widget dialogRadioItem(String title, int id, String svg) => RadioListTile(
        controlAffinity: ListTileControlAffinity.trailing,
        title: Row(
          children: [
            SvgPicture.asset(svg),
            SizedBox(
              width: 8,
            ),
            Text(
              title,
              style: Get.textTheme.headline6!
                  .copyWith(fontWeight: FontWeight.bold, fontSize: 17),
            ),
          ],
        ),
        onChanged: (value) {
          controller.visitType.value = id;
          print('-------$id');
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        value: id,
        groupValue: controller.visitType.value,
        activeColor: kPrimaryColor,
      );
}

import 'package:ash_tree/app/api/provider/api_handlers.dart';
import 'package:ash_tree/app/constants/colors.dart';
import 'package:ash_tree/app/customs/custom_btn.dart';
import 'package:ash_tree/app/models/slot_response.dart';
import 'package:ash_tree/app/utils/Custom_labCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/test_info_slot_controller.dart';

class TestInfoSlotView extends GetView<TestInfoSlotController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Container(
        color: Colors.white,
        width: Get.width,
        padding: const EdgeInsets.all(10.0),
        child: CustomBtn(
          text: 'BOOK APPOINTMENT',
          onPress: controller.onBookPressed,
        ),
      ),
      body: SafeArea(
        child: controller.obx(
            (state) => SingleChildScrollView(
                  child: Stack(
                    children: [
                      _header(state!.data!.image!),
                      _backBtn(),
                      Container(
                        margin: EdgeInsets.only(
                          top: Get.width * .75,
                          bottom: Get.height * .1,
                        ),
                        child: Column(
                          children: [
                            _bg(),
                            _infoCard(state.data!),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
            onLoading: ApiHandler().progressIndicator()),
      ),
    );
  }

  Widget _header(String image) => Image.network(
        image,
        height: Get.width - 100,
        width: Get.width,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) => Container(
          height: Get.width,
          width: Get.width,
          color: Colors.grey.withOpacity(0.9),
          child: Icon(
            Icons.error,
            size: 80,
          ),
          alignment: Alignment.lerp(
            Alignment.topCenter,
            Alignment.center,
            0.65,
          ),
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

  Widget _bg() => Container(
        width: Get.width,
        padding: EdgeInsets.only(top: 12, bottom: 5),
        alignment: Alignment.topCenter,
        decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24), topRight: Radius.circular(24))),
        child: LabCardItem(
          data: controller.lab,
        ),
      );

  Widget _infoCard(Data data) => Container(
        width: Get.width,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    '${data.name!}',
                    style: Get.textTheme.headline5,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Text(
                      '${data.selectedTest!.name!}',
                      style: Get.textTheme.bodyText2!.copyWith(fontSize: 18),
                    ),
                  ),
                ),
                Text(
                  'AED ${data.selectedTest!.price}',
                  style: Get.textTheme.headline6!.copyWith(
                      fontSize: 18,
                      color: kTextFieldBorderColor,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Divider(),
            _bullets('Preparations:', data.selectedTest!.preparation!),
            _bullets('Components:', data.selectedTest!.components!),
            Divider(),
            _bookDate(data.timeSlots!),
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

  Widget _bookDate(List<TimeSlots> timeSlots) => Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Book a Date',
                style: Get.textTheme.headline6,
              ),
            ],
          ),
          _dateList(timeSlots),
          _bookSlots(timeSlots)
        ],
      );

  Widget _bookSlots(List<TimeSlots> timeSlots) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Select Time',
              style: Get.textTheme.headline6,
            ),
            SizedBox(
              height: 4,
            ),
            Obx(
              () => SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: controller
                            .removeEmptyStringFromList(
                                timeSlots[controller.selectedDateIndex.value]
                                    .slot)
                            .length >
                        0
                    ? Row(
                        children: List.generate(
                          controller
                              .removeEmptyStringFromList(
                                  timeSlots[controller.selectedDateIndex.value]
                                      .slot)
                              .length,
                          (i) => _slot(
                              controller.removeEmptyStringFromList(
                                  timeSlots[controller.selectedDateIndex.value]
                                      .slot)[i],
                              i),
                        ),
                      )
                    : Text(
                        'No Slots are available for this Date.',
                        style: Get.textTheme.subtitle1,
                      ),
              ),
            )
          ],
        ),
      );

  Widget _slot(String slot, int i) => InkWell(
        onTap: () {
          controller.selectedTime.value = slot;
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.green),
              color: controller.selectedTime.value == slot
                  ? Colors.green
                  : Colors.white),
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
          margin: EdgeInsets.all(4),
          child: Text(
            '$slot HRS',
            style: Get.textTheme.button!.copyWith(
                color: controller.selectedTime.value == slot
                    ? Colors.white
                    : Colors.green,
                fontSize: 18),
          ),
        ),
      );

  Widget _dateList(List<TimeSlots> timeSlots) => SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(
              timeSlots.length,
              (i) => InkWell(
                  onTap: () {
                    controller.selectedDateIndex.value = i;
                    controller.selectedDate.value = timeSlots[i].date!;
                    print(controller.selectedDateIndex.value);
                  },
                  child: _dateSlot(timeSlots[i], i))),
        ),
      );

  Widget _dateSlot(TimeSlots timeSlot, int i) => Obx(
        () => Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
              color: controller.selectedDateIndex.value == i
                  ? Colors.green
                  : Colors.white),
          padding: EdgeInsets.symmetric(horizontal: 6, vertical: 20),
          margin: EdgeInsets.symmetric(horizontal: 6, vertical: 8),
          width: 56,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                timeSlot.week!,
                style: Get.textTheme.headline6!.copyWith(
                  color: controller.selectedDateIndex.value == i
                      ? Colors.white
                      : Colors.green,
                  fontSize: 15,
                ),
              ),
              Text(
                timeSlot.date!.substring(0, 2),
                style: Get.textTheme.headline6!.copyWith(
                    color: controller.selectedDateIndex.value == i
                        ? Colors.white
                        : Colors.green,
                    fontSize: 16),
              ),
            ],
          ),
        ),
      );
}

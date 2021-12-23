import 'package:ash_tree/app/api/provider/api_handlers.dart';
import 'package:ash_tree/app/modules/appointments/views/components/appointmentCard.dart';
import 'package:ash_tree/app/utils/custom_appBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/appointments_controller.dart';

class AppointmentsView extends GetView<AppointmentsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarNoBack(
          title: 'Your Appointment',
          subTitle: 'Lorem Ipsum is simply dummy text'),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: controller.obx(
            (state) => ListView.builder(
                  itemBuilder: (_, i) => AppointmentCard(state!.data![i]),
                  itemCount: state!.data!.length,
                ),
            onLoading: ApiHandler().progressIndicator(),
            onEmpty: ApiHandler().emptyWidget()),
      ),
    );
  }
}

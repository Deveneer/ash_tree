import 'package:ash_tree/app/modules/appointments/controllers/appointments_controller.dart';
import 'package:ash_tree/app/modules/home/controllers/home_controller.dart';
import 'package:ash_tree/app/modules/notification/controllers/notification_controller.dart';
import 'package:ash_tree/app/modules/reports/controllers/reports_controller.dart';
import 'package:get/get.dart';
import '../controllers/bottom_navbar_controller.dart';

class BottomNavbarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomNavbarController>(
      () => BottomNavbarController(),
    );
    Get.put<HomeController>(HomeController());
    Get.put<NotificationController>(NotificationController());
    Get.put<AppointmentsController>(AppointmentsController());
    Get.put<ReportsController>(ReportsController());
  }
}

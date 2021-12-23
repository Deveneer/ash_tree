import 'package:get/get.dart';
import '../controllers/test_info_slot_controller.dart';

class TestInfoSlotBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TestInfoSlotController>(
      () => TestInfoSlotController(),
    );
  }
}

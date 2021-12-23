import 'package:get/get.dart';
import '../controllers/choose_lab_controller.dart';

class ChooseLabBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChooseLabController>(
      () => ChooseLabController(),
    );
  }
}

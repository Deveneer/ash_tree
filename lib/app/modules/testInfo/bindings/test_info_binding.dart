import 'package:get/get.dart';
import '../controllers/test_info_controller.dart';

class TestInfoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TestInfoController>(
      () => TestInfoController(),
    );
  }
}

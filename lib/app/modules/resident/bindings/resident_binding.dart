import 'package:get/get.dart';
import '../controllers/resident_controller.dart';

class ResidentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ResidentController>(
      () => ResidentController(),
    );
  }
}

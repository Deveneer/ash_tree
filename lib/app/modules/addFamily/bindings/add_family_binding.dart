import 'package:get/get.dart';
import '../controllers/add_family_controller.dart';

class AddFamilyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddFamilyController>(
      () => AddFamilyController(),
    );
  }
}

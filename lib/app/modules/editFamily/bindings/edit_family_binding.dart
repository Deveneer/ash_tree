import 'package:get/get.dart';
import '../controllers/edit_family_controller.dart';

class EditFamilyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditFamilyController>(
      () => EditFamilyController(),
    );
  }
}

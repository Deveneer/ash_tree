import 'package:get/get.dart';
import '../controllers/address_select_controller.dart';

class AddressSelectBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddressSelectController>(
      () => AddressSelectController(),
    );
  }
}

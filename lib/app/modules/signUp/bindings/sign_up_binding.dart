import 'package:ash_tree/app/modules/otp/controllers/otp_controller.dart';
import 'package:get/get.dart';
import '../controllers/sign_up_controller.dart';

class SignUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignUpController>(
      () => SignUpController(),
    );
    Get.lazyPut<OtpController>(
      () => OtpController(),
    );
  }
}

import 'package:ash_tree/app/locale/sessions.dart';
import 'package:ash_tree/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:ash_tree/app/constants/assets.dart';

class SplashController extends GetxController {
  final logo = kClearLogoSvg;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    Future.delayed(Duration(seconds: 3)).then(
      (_) {
        checkerForNewUser();
      },
    );
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void checkerForNewUser() {
    SessionManager().getToken().then(
      (token) {
        if (token != null) {
          SessionManager()
              .getToken()
              .then((userToken) => USER_TOKEN.value = userToken!);
          SessionManager()
              .getUser()
              .then((userData) => USER_INFO.value = userData!);
          Get.offNamed(Routes.BOTTOMNAVBAR);
        } else
          Get.offNamed(Routes.LANDING);
      },
    );
  }
}

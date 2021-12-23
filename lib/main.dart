import 'dart:async';
import 'package:ash_tree/app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'app/api/provider/api_provider.dart';
import 'app/constants/strings.dart';
import 'app/routes/app_pages.dart';

Future<void> main() async {
  Get.put<ApiProvider>(
    ApiProvider(),
  );
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );
  runZonedGuarded<Future<void>>(
    () async {
      runApp(
        GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              fontFamily: kNONITO_FONT,
              appBarTheme: AppBarTheme(
                  backgroundColor: Colors.transparent,
                  actionsIconTheme: IconThemeData(color: Colors.black))),
          title: "Application",
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
        ),
      );
    },
    (dynamic error, StackTrace stackTrace) {
      print('<<----------ERROR--------->> \n$error');
      print('\n<<----------STACK TRACE--------->> $stackTrace');
      Get.defaultDialog(
        title: unknownErrorOccured,
        middleText: somethingWentWrongTryLater,
        middleTextStyle: TextStyle(fontSize: 18),
        radius: 5,
        buttonColor: kTextFieldBorderColor,
        confirmTextColor: kPrimaryBgColor,
        textConfirm: 'Go Back',
        onConfirm: () {
          Get.back();
          Get.back();
        },
      );
    },
  );
}

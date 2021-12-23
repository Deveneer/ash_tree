import 'package:ash_tree/app/api/provider/api_provider.dart';
import 'package:ash_tree/app/models/labs_response.dart';
import 'package:ash_tree/app/modules/home/controllers/home_controller.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';

class ChooseLabController extends GetxController with StateMixin<LabsResponse> {
  var currentAddress = 'Loading... '.obs;
  ApiProvider _apiProvider = Get.find();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    getCurrentAddress();
    change(null, status: RxStatus.loading());
  }

  @override
  void onClose() {
    super.onClose();
  }

  getCurrentAddress() {
    if (LAT.value != 0.0 && LONG.value != 0.0) {
      GeocodingPlatform.instance
          .placemarkFromCoordinates(LAT.value, LONG.value)
          .then(
        (value) {
          print('This is your current location =>\n${value.first}');
          currentAddress.value = value.first.subLocality! +
              ', ' +
              value.first.locality! +
              ', ' +
              value.first.country! +
              ', Postal Code: ' +
              value.first.postalCode! +
              ".";
        },
      );
      getNearLabs(LAT.value.toString(), LONG.value.toString());
      // Currently there is no labs data available at other than
      // below given latitude & longitude.
      // getNearLabs(28.643037.toString(), 77.111266.toString());
    }
  }

  getNearLabs(String lat, String long) {
    Map<String, String> requestMap = {'latitude': lat, 'longitude': long};
    _apiProvider.nearLabs(requestMap).then(
      (value) {
        if (value.isOk) {
          LabsResponse _data = LabsResponse.fromJson(value.body);
          if (_data.data!.isNotEmpty) {
            change(_data, status: RxStatus.success());
          } else {
            change(null, status: RxStatus.empty());
          }
        } else {
          Fluttertoast.showToast(msg: value.bodyString ?? '');
        }
      },
    );
  }
}

import 'package:ash_tree/app/api/provider/api_provider.dart';
import 'package:ash_tree/app/constants/strings.dart';
import 'package:ash_tree/app/locale/sessions.dart';
import 'package:ash_tree/app/models/common_response.dart';
import 'package:ash_tree/app/models/labs_response.dart' as labs;
import 'package:ash_tree/app/models/slot_response.dart';
import 'package:ash_tree/app/routes/app_pages.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TestInfoSlotController extends GetxController
    with StateMixin<SlotResponse> {
  labs.Data lab = Get.arguments;
  var selectedDateIndex = 0.obs;
  Rx<SlotResponse> _slotData = SlotResponse().obs;

  ApiProvider _apiProvider = Get.find();

  var selectedTime = ''.obs;
  var selectedDate = ''.obs;
  var packageId = ''.obs;
  var familyId = ''.obs;
  var addressId = ''.obs;
  var visitId = ''.obs;
  var price = ''.obs;

  @override
  void onInit() {
    super.onInit();
    getStoredIds();
  }

  @override
  void onReady() {
    super.onReady();
    change(null, status: RxStatus.loading());
    getSlots();
  }

  @override
  void onClose() {
    super.onClose();
  }

  String getDay(int index) {
    String data = DateFormat('EEEE').format(DateTime(2021, 04, 15 + index));
    return data.substring(0, 3);
  }

  getSlots() async {
    packageId.value = await SessionManager().getString(kPackageIdKey) ?? '';
    Map<String, String> requestMap = {
      'lab_id': lab.id!,
      'package_id': packageId.value,
    };
    _apiProvider.getSlots(requestMap).then(
      (value) {
        if (value.isOk) {
          _slotData.value = SlotResponse.fromJson(value.body);
          change(_slotData.value, status: RxStatus.success());
          price.value = _slotData.value.data!.selectedTest!.price!;
          selectedDate.value =
              _slotData.value.data!.timeSlots![selectedDateIndex.value].date!;
        } else {
          Fluttertoast.showToast(msg: value.bodyString ?? '');
        }
      },
    );
  }

  getStoredIds() {
    SessionManager()
        .getString(kPackageIdKey)
        .then((value) => packageId.value = value.toString());
    SessionManager()
        .getString(kMemberIdKey)
        .then((value) => familyId.value = value.toString());
    SessionManager()
        .getString(kAddressIdKey)
        .then((value) => addressId.value = value.toString());
    SessionManager()
        .getString(kVisitIdKey)
        .then((value) => visitId.value = value.toString());
  }

  onBookPressed() {
    if (selectedTime.value.isNotEmpty) {
      Map<String, String> requestMap = {
        'visit_place': visitId.value,
        'address_id': addressId.value,
        'family_member_id': familyId.value,
        'lab_id': lab.id!,
        'package_id': packageId.value,
        'date': selectedDate.value,
        'slot_time': selectedTime.value,
        'price': price.value,
      };
      print(requestMap);
      _apiProvider.addToCart(requestMap).then((value) {
        if (value.isOk) {
          CommonResponse _data = CommonResponse.fromJson(value.body);
          Fluttertoast.showToast(msg: _data.message);
          Get.offAndToNamed(Routes.CART);
        } else {
          Fluttertoast.showToast(msg: value.bodyString ?? '');
        }
      });
    } else
      Get.snackbar('Time slot not selected.', 'Please select a time slot.');
  }

  List<String> removeEmptyStringFromList(List<String>? slotTimeList) {
    List<String> validSlotTimeList = [];
    if (slotTimeList != null)
      for (String slot in slotTimeList) {
        if (slot.isNotEmpty) {
          if (selectedDateIndex.value == 0) {
            if (isTodayTimeSlotValid(slot)) validSlotTimeList.add(slot);
          }
          if (selectedDateIndex.value != 0) validSlotTimeList.add(slot);
        }
      }
    return validSlotTimeList;
  }

  bool isTodayTimeSlotValid(String slot) {
    bool isValidTimeSlotForToday = false;
    DateTime currentDateTime = DateTime.now();
    int currentTimeHour = currentDateTime.hour;
    int currentSlotHour = int.parse(slot.split(":")[0]);
    if (currentSlotHour >= currentTimeHour + 1) isValidTimeSlotForToday = true;
    return isValidTimeSlotForToday;
  }
}

import 'package:ash_tree/app/api/services/base_services.dart';
import 'package:ash_tree/app/constants/strings.dart';
import 'package:ash_tree/app/locale/sessions.dart';
import 'package:ash_tree/app/models/common_response.dart';
import 'package:ash_tree/app/utils/session_expired_dialog_box.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class ApiProvider extends GetConnect with BaseApiServices {
  static const String _BASE_URL = 'https://demo.mbrcables.com/ashtree/api/';
  static const String _X_API_KEY = 'gpbKirgJMVEOnatf';

  @override
  void onInit() {
    httpClient.baseUrl = _BASE_URL;
    httpClient.timeout = Duration(seconds: 5);
    httpClient.errorSafety = true;

    httpClient.addRequestModifier(
      (Request<dynamic> request) async {
        RxBool isFirstTryDone = false.obs;
        RxBool isInternetAvailable = false.obs;

        while (isInternetAvailable.isFalse) {
          final connectivityResult = await (Connectivity().checkConnectivity());
          if (connectivityResult == ConnectivityResult.wifi ||
              connectivityResult == ConnectivityResult.mobile) {
            final bool isConnected =
                await InternetConnectionChecker().hasConnection;
            if (isConnected) {
              isInternetAvailable.value = true;
            } else {
              if (isFirstTryDone.isFalse)
                Get.snackbar(
                  'Network Error!',
                  'No Internet Connection. Please try again later.',
                );
              print('Internet is not available.');
            }
          } else {
            if (isFirstTryDone.isFalse)
              Get.snackbar(
                'Connnection Error!',
                'Device is not connected to wifi or mobile data.',
              );
            print('Device is not connected to wifi or mobile data.');
          }
          isFirstTryDone.value = true;
        }

        request.headers['x-api-key'] = _X_API_KEY;
        request.headers['authorization'] = USER_TOKEN.value;
        print('----Add addRequestModifier Called----');
        return request;
      },
    );

    httpClient.addResponseModifier(
      (request, response) {
        debugPrint(
          '\n╔══════════════════════════ Response ══════════════════════════\n'
          '╟ REQUEST ║ ${request.method.toUpperCase()}\n'
          '╟ url: ${request.url}\n'
          '╟ Headers: ${request.headers}\n'
          '╟ Body: ${request.bodyBytes.map((event) => event.asMap().toString())}\n'
          '╟ Status Code: ${response.statusCode}\n'
          '╟ Data: ${response.bodyString?.toString() ?? ''}'
          '\n╚══════════════════════════ Response ══════════════════════════\n',
          wrapWidth: 1024,
        );
        CommonResponse _data = CommonResponse.fromJson(response.body);
        if (response.statusCode == 400 &&
            _data.message == 'Your session has been expired.') {
          sessionExpiredDialogBox();
        }
      },
    );
  }

  @override
  Future<Response> residentDetails(Map<String, String> requestMap) async {
    final response = await post(
      API_RESIDENT_DETAILS,
      FormData(requestMap),
    );
    return response;
  }

  @override
  Future<Response> sendOtp(Map<String, String> requestMap) async {
    final response = await post(
      API_LOGIN,
      FormData(requestMap),
    );
    return response;
  }

  @override
  Future<Response> updateProfileData(Map<String, String> requestMap) async {
    final response =
        await post(API_UPDATE_PERSONAL_DETAILS, FormData(requestMap));
    return response;
  }

  @override
  Future<Response> updateProfileImage(Map<String, dynamic> requestMap) async {
    final response = await post(
      API_UPLOAD_PROFILE_IMAGE,
      FormData(requestMap),
    );
    return response;
  }

  @override
  Future<Response> verifyOtp(Map<String, String> requestMap) async {
    final response = await post(
      API_VERIFY_OTP,
      FormData(requestMap),
    );
    return response;
  }

  @override
  Future<Response> addFamily(Map<String, dynamic> requestMap) async {
    final response = await post(
      API_ADD_FAMILY,
      FormData(requestMap),
    );
    return response;
  }

  @override
  Future<Response> deleteFamily(Map<String, String> requestMap) async {
    final response = await post(
      API_DELETE_FAMILY_MEMBER,
      FormData(requestMap),
    );
    return response;
  }

  @override
  Future<Response> editFamily(Map<String, dynamic> requestMap) async {
    final response = await post(
      API_EDIT_FAMILY,
      FormData(requestMap),
    );
    return response;
  }

  @override
  Future<Response> getBanners() async {
    final response = await get(API_BANNERS);
    return response;
  }

  @override
  Future<Response> getFamilyMembers() async {
    final response = await get(API_FAMILY_MEMBER);
    return response;
  }

  @override
  Future<Response> getTestCategories() async {
    final response = await get(API_TEST_CAT);
    return response;
  }

  @override
  Future<Response> getTestPackages() async {
    final response = await get(API_TEST_PACKAGE);
    return response;
  }

  @override
  Future<Response> addAddress(Map<String, String> requestMap) async {
    final response = await post(
      API_ADD_ADDRESS,
      FormData(requestMap),
    );
    return response;
  }

  @override
  Future<Response> deleteAddress(Map<String, String> requestMap) async {
    final response = await post(
      API_DELETE_ADDRESS,
      FormData(requestMap),
    );
    return response;
  }

  @override
  Future<Response> editAddress(Map<String, String> requestMap) async {
    final response = await post(
      API_EDIT_ADDRESS,
      FormData(requestMap),
    );
    return response;
  }

  @override
  Future<Response> getAddress() async {
    final response = await get(API_GET_ADDRESS);
    return response;
  }

  @override
  Future<Response> nearLabs(Map<String, String> requestMap) async {
    final response = await post(
      API_NEAR_LABS,
      FormData(requestMap),
    );
    return response;
  }

  @override
  Future<Response> testDetails(Map<String, String> requestMap) async {
    final response = await post(
      API_TEST_DETAILS,
      FormData(requestMap),
    );
    return response;
  }

  @override
  Future<Response> testPackageDetails(Map<String, String> requestMap) async {
    final response = await post(
      API_TEST_PACKAGE_DETAILS,
      FormData(requestMap),
    );
    return response;
  }

  @override
  Future<Response> catTestPackages(Map<String, String> requestMap) async {
    final response = await post(
      API_TEST_CATEGORY_PACKAGE,
      FormData(requestMap),
    );
    return response;
  }

  @override
  Future<Response> getSlots(Map<String, String> requestMap) async {
    final response = await post(
      API_SLOTS,
      FormData(requestMap),
    );
    return response;
  }

  @override
  Future<Response> addToCart(Map<String, String> requestMap) async {
    final response = await post(
      API_ADD_TO_CART,
      FormData(requestMap),
    );
    return response;
  }

  @override
  Future<Response> getCart(String coupon) async {
    final response = await get(API_GET_CART, query: {'coupon_id': '$coupon'});
    return response;
  }

  @override
  Future<Response> getCoupon() async {
    final response = await get(API_COUPON);
    return response;
  }

  @override
  Future<Response> order(Map<String, String> requestMap) async {
    final response = await post(
      API_ORDER,
      FormData(requestMap),
    );
    return response;
  }

  @override
  Future<Response> getOrderStatus(String orderId) async {
    final response = await get(
      API_ORDERS_STATUS,
      query: {
        'order_id': '$orderId',
      },
    );
    return response;
  }

  @override
  Future<Response> getAppointment() async {
    final response = await get(API_MY_APPOINTMENT);
    return response;
  }

  @override
  Future<Response> getOrders() async {
    final response = await get(API_ORDERS);
    return response;
  }

  @override
  Future<Response> getNotification() async {
    final response = await get(API_NOTIFICATIONS);
    return response;
  }

  @override
  Future<Response> getPrivacy() async {
    final response = await get(API_PRIVACY);
    return response;
  }

  @override
  Future<Response> getReports() async {
    final response = await get(API_REPORTS);
    return response;
  }

  @override
  Future<Response> getTerms() async {
    final response = await get(API_TANDC);
    return response;
  }

  @override
  Future<Response> getTestPackageSearchResult(
      Map<String, String> requestMap) async {
    final response = await post(
      API_TEST_PACKAGES_SEARCH,
      FormData(requestMap),
    );
    return response;
  }

  @override
  Future<Response> addPreExistingCondition(
      Map<String, String> requestMap) async {
    final response = await post(
      API_ADD_AND_GET_USER_PRE_EXISTING_CONDITION,
      FormData(requestMap),
    );
    return response;
  }

  @override
  Future<Response> getPreExistingCondition() async {
    final response = await get(API_ADD_AND_GET_USER_PRE_EXISTING_CONDITION);
    return response;
  }

  @override
  Future<Response> removeTestFromCart(Map<String, String> requestMap) async {
    final response = await post(
      API_REMOVE_TEST_FROM_CART,
      FormData(requestMap),
    );
    return response;
  }
}

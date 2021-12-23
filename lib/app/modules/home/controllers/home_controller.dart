import 'package:ash_tree/app/api/provider/api_provider.dart';
import 'package:ash_tree/app/models/banner_response.dart';
import 'package:ash_tree/app/models/test_category_response.dart';
import 'package:ash_tree/app/models/test_packages_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';

// ignore: non_constant_identifier_names
var LAT = 0.0.obs;
// ignore: non_constant_identifier_names
var LONG = 0.0.obs;

class HomeController extends GetxController {
  GlobalKey<SliderMenuContainerState> drawerKey =
      GlobalKey<SliderMenuContainerState>();
  ScrollController scrollController = ScrollController();
  RxBool isDrawerOpen = false.obs;
  ApiProvider _apiProvider = Get.find();

  Rx<TestCategoryResponse?> testCategory = Rx<TestCategoryResponse?>(null);
  Rx<TestPackagesResponse?> testPackage = Rx<TestPackagesResponse?>(null);
  Rx<BannerResponse?> banners = Rx<BannerResponse?>(null);
  TextEditingController searchTextEditingController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    getCurrentLocation();
    getCategory();
    getPackages();
    getBanners();
  }

  @override
  void onReady() {
    super.onReady();
    print('Home On Ready Called');
  }

  @override
  void onClose() {
    super.onClose();
  }

  getCategory() {
    _apiProvider.getTestCategories().then(
      (value) {
        if (value.isOk) {
          TestCategoryResponse _data =
              TestCategoryResponse.fromJson(value.body);
          testCategory.value = _data;
        }
      },
    );
  }

  getPackages() {
    _apiProvider.getTestPackages().then(
      (value) {
        if (value.isOk) {
          TestPackagesResponse _data =
              TestPackagesResponse.fromJson(value.body);
          testPackage.value = _data;
        }
      },
    );
  }

  getBanners() {
    _apiProvider.getBanners().then(
      (value) {
        if (value.isOk) {
          BannerResponse _data = BannerResponse.fromJson(value.body);
          banners.value = _data;
        }
      },
    );
  }

  getCurrentLocation() async {
    Location location = new Location();
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    location.getLocation().then(
      (value) async {
        _locationData = value;
        LAT.value = _locationData.latitude!;
        LONG.value = _locationData.longitude!;
        print('Your location longitude is ${_locationData.longitude}');
        print('Your location latitude is ${_locationData.latitude}');
      },
    );
  }
}

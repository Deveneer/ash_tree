import 'package:ash_tree/app/api/provider/api_provider.dart';
import 'package:ash_tree/app/models/test_packages_response.dart';
import 'package:get/get.dart';

class SearchResultController extends GetxController
    with StateMixin<TestPackagesResponse> {
  String searchQuery = Get.arguments;
  ApiProvider _apiProvider = Get.find();
  Rx<TestPackagesResponse?> searchedTestPackagesResult =
      Rx<TestPackagesResponse?>(null);
  RxBool isSearchResultLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    getTestPackageSearchResultData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getTestPackageSearchResultData() {
    Map<String, String> requestMap = {'keyword': searchQuery};
    _apiProvider.getTestPackageSearchResult(requestMap).then(
      (value) {
        if (value.isOk) {
          isSearchResultLoading.value = false;
          final _data = TestPackagesResponse.fromJson(value.body);
          searchedTestPackagesResult.value = _data;
        } else {
          Get.snackbar('Unable to load search results.',
              'Something went wrong, Try again later.');
          Get.back();
        }
      },
    );
  }
}

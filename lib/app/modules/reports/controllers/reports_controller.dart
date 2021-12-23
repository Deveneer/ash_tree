import 'package:ash_tree/app/api/provider/api_provider.dart';
import 'package:ash_tree/app/models/report_response.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class ReportsController extends GetxController with StateMixin<ReportResponse> {
  ApiProvider _apiProvider = Get.find();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    change(null, status: RxStatus.loading());
    getReports();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getReports() {
    _apiProvider.getReports().then(
      (value) {
        if (value.isOk) {
          ReportResponse _data = ReportResponse.fromJson(value.body);
          if (_data.data!.isNotEmpty) {
            change(_data, status: RxStatus.success());
          } else {
            change(null, status: RxStatus.empty());
          }
        } else {
          Fluttertoast.showToast(
            msg: 'Something went wrong while fetching reports.',
          );
        }
      },
    );
  }
}

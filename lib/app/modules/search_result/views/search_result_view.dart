import 'package:ash_tree/app/api/provider/api_handlers.dart';
import 'package:ash_tree/app/routes/app_pages.dart';
import 'package:ash_tree/app/utils/custom_appBar.dart';
import 'package:ash_tree/app/utils/custom_testCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/search_result_controller.dart';

class SearchResultView extends GetView<SearchResultController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          title: 'Searched Test Packages',
          subTitle: 'National reference laboratory'),
      body: Obx(
        () => controller.isSearchResultLoading.value
            ? Center(child: CircularProgressIndicator())
            : controller.searchedTestPackagesResult.value!.data!.length > 0
                ? ListView.builder(
                    itemBuilder: (_, i) => InkWell(
                        onTap: () => Get.toNamed(Routes.TEST_INFO,
                            arguments: controller
                                .searchedTestPackagesResult.value?.data![i].id),
                        child: TestCard(controller
                            .searchedTestPackagesResult.value!.data![i])),
                    itemCount: controller
                        .searchedTestPackagesResult.value?.data!.length,
                  )
                : ApiHandler().emptyWidget(),
      ),
    );
  }
}

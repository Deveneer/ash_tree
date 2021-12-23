import 'package:ash_tree/app/api/provider/api_handlers.dart';
import 'package:ash_tree/app/constants/assets.dart';
import 'package:ash_tree/app/constants/colors.dart';
import 'package:ash_tree/app/constants/strings.dart';
import 'package:ash_tree/app/customs/custom_btn.dart';
import 'package:ash_tree/app/locale/sessions.dart';
import 'package:ash_tree/app/models/all_address_response.dart';
import 'package:ash_tree/app/routes/app_pages.dart';
import 'package:ash_tree/app/utils/custom_appBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../controllers/address_select_controller.dart';

class AddressSelectView extends GetView<AddressSelectController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          title: 'Your Address', subTitle: 'Family member details'),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: Get.width,
          child: CustomBtn(
            text: 'Add New',
            onPress: () {
              Get.toNamed(Routes.ADD_ADDRESS, arguments: 1);
            },
          ),
        ),
      ),
      body: controller.obx(
          (state) => ListView.builder(
                itemBuilder: (_, i) => _radioItem(state!.data![i]),
                itemCount: state!.data!.length,
                shrinkWrap: true,
              ),
          onLoading: ApiHandler().progressIndicator(),
          onEmpty: ApiHandler().emptyWidget()),
    );
  }

  Widget _radioItem(Data data) => Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
          child: Row(
            children: [
              SvgPicture.asset(
                kOutlinedHomeSVG,
                width: 40,
                color: Colors.grey,
              ),
              SizedBox(
                width: 16,
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    controller.addressId.value = data.id.toString();
                    SessionManager()
                        .saveString(kAddressIdKey, controller.addressId.value);
                    Get.toNamed(Routes.CHOOSE_LAB,
                        arguments: controller.addressId.value);
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                              child: Text(
                            data.name!,
                            style: Get.textTheme.headline6,
                          )),
                        ],
                      ),
                      Text(
                        data.address!,
                        style: Get.textTheme.bodyText2,
                      ),
                      Text(
                        '${data.city!} , ${data.state!} , ${data.pinCode!}',
                        style: Get.textTheme.bodyText2,
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        'Mobile: ${data.mobileNumber!}',
                        style: Get.textTheme.bodyText2,
                      ),
                    ],
                  ),
                ),
              ),
              Obx(
                () => Radio(
                  value: data.id!,
                  activeColor: kPrimaryColor,
                  groupValue: controller.addressId.value,
                  onChanged: (v) {
                    controller.addressId.value = v.toString();
                    SessionManager()
                        .saveString(kAddressIdKey, controller.addressId.value);
                    Get.toNamed(Routes.CHOOSE_LAB);
                  },
                ),
              )
            ],
          ),
        ),
      );
}

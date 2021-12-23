import 'package:ash_tree/app/api/provider/api_handlers.dart';
import 'package:ash_tree/app/constants/assets.dart';
import 'package:ash_tree/app/constants/colors.dart';
import 'package:ash_tree/app/locale/sessions.dart';
import 'package:ash_tree/app/modules/home/views/components/banner.dart';
import 'package:ash_tree/app/routes/app_pages.dart';
import 'package:ash_tree/app/utils/custom_testCard.dart';
import 'package:ash_tree/app/utils/custom_textfield.dart';
import 'package:ash_tree/app/utils/filter_according_to_priority.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import 'components/categoryCard.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SliderMenuContainer(
          key: controller.drawerKey,
          appBarColor: kPrimaryBgColor,
          sliderMenuOpenSize: 200,
          drawerIcon: IconButton(
            onPressed: () {
              if (controller.drawerKey.currentState!.isDrawerOpen) {
                controller.drawerKey.currentState!.closeDrawer();
                controller.isDrawerOpen.value = false;
              } else {
                controller.drawerKey.currentState!.openDrawer();
                controller.isDrawerOpen.value = true;
              }
            },
            icon: Obx(
              () => controller.isDrawerOpen.value
                  ? Icon(Icons.close)
                  : SvgPicture.asset(kMenuSVG),
            ),
          ),
          appBarPadding: EdgeInsets.only(left: 0, top: 10, right: 0),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  child: SvgPicture.asset(
                    kHeroLogoSvg,
                    width: 130,
                  ),
                ),
              ),
              InkWell(
                child: Icon(CupertinoIcons.cart),
                onTap: () => Get.toNamed(Routes.CART),
              )
            ],
          ),
          sliderMenu: Container(
            color: kPrimaryColor,
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  kClearLogoSvg,
                  width: 100,
                ),
                SizedBox(
                  height: 15,
                ),
                Divider(
                  color: Colors.grey,
                  thickness: 1,
                ),
                _clickableItem('Profile', () {
                  Get.toNamed(Routes.PROFILE);
                  controller.drawerKey.currentState!.closeDrawer();
                  controller.isDrawerOpen.value = false;
                }),
                Divider(
                  color: Colors.grey,
                ),
                _clickableItem('Family Members', () {
                  Get.toNamed(
                    Routes.FAMILY_MEMBERS,
                    arguments: {'isFromHomeScreen': true},
                  );
                  controller.drawerKey.currentState!.closeDrawer();
                  controller.isDrawerOpen.value = false;
                }),
                Divider(
                  color: Colors.grey,
                ),
                _clickableItem('Cart', () {
                  Get.toNamed(Routes.CART);
                  controller.drawerKey.currentState!.closeDrawer();
                  controller.isDrawerOpen.value = false;
                }),
                Divider(
                  color: Colors.grey,
                ),
                _clickableItem('Order', () {
                  Get.toNamed(Routes.ORDERS);
                  controller.drawerKey.currentState!.closeDrawer();
                  controller.isDrawerOpen.value = false;
                }),
                Divider(
                  color: Colors.grey,
                ),
                _clickableItem('Address', () {
                  Get.toNamed(Routes.ADDRESS);
                  controller.drawerKey.currentState!.closeDrawer();
                  controller.isDrawerOpen.value = false;
                }),
                Divider(
                  color: Colors.grey,
                ),
                _clickableItem('Terms & Conditions', () {
                  Get.toNamed(Routes.TERMS);
                  controller.drawerKey.currentState!.closeDrawer();
                  controller.isDrawerOpen.value = false;
                }),
                Divider(
                  color: Colors.grey,
                ),
                _clickableItem('Privacy Policy', () {
                  Get.toNamed(Routes.PRIVACY);
                  controller.drawerKey.currentState!.closeDrawer();
                  controller.isDrawerOpen.value = false;
                }),
                Spacer(),
                _clickableItem('Logout', () {
                  SessionManager().clearSession();
                  Get.offAllNamed(Routes.LANDING);
                }),
              ],
            ),
          ),
          sliderMain: Container(
            color: kPrimaryBgColor,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    controller: controller.scrollController,
                    child: _body(),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _clickableItem(String title, Function onPress) => Container(
        width: 200,
        child: InkWell(
          onTap: () => onPress(),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Text(
              title,
              style: Get.textTheme.headline6!.copyWith(
                color: kTextFieldBorderColor,
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      );

  Widget _searchCard() =>
      SearchTextField(controller: controller.searchTextEditingController);

  Widget _profileCard() => Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 24,
                backgroundColor: Color.fromRGBO(175, 211, 211, 1),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(120),
                  child: SizedBox(
                    height: 40,
                    width: 40,
                    child: Image.network(
                      USER_INFO.value.image ?? '',
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromRGBO(175, 211, 211, 1),
                          border: Border.all(
                            color: Color.fromRGBO(0, 105, 105, 1),
                          ),
                        ),
                        child: Icon(
                          Icons.person_sharp,
                          size: 35,
                          color: Color.fromRGBO(0, 105, 105, 1),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(
                    () => Container(
                      width: Get.width * .6,
                      child: Text(
                        'Hello, ${USER_INFO.value.name ?? ''}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Get.textTheme.headline4!.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: Get.width * .6,
                    child: Text(
                      'Let\'s improve your health with us.',
                      style: Get.textTheme.headline4!.copyWith(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );

  Widget _body() => Container(
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            _profileCard(),
            SizedBox(
              height: 15,
            ),
            Obx(() => controller.banners.value != null
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: CustomBanner(controller.banners.value!.data!),
                  )
                : ApiHandler().progressIndicator()),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
              ),
              child: _searchCard(),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              'Test Categories',
              style: Get.textTheme.headline5!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            Obx(
              () => controller.testCategory.value != null
                  ? Padding(
                      padding: const EdgeInsets.fromLTRB(15, 5, 15, 10),
                      child: GridView.count(
                        crossAxisCount: 4,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                        children: List.generate(
                          controller.testCategory.value!.data!.length,
                          (i) => InkWell(
                            onTap: () => Get.toNamed(
                              Routes.TEST,
                              arguments:
                                  filterAccordingToPriorityForTestCategories(
                                          controller
                                              .testCategory.value!.data!)[i]
                                      .id,
                            ),
                            child: CategoryCard(
                              title: filterAccordingToPriorityForTestCategories(
                                      controller.testCategory.value!.data!)[i]
                                  .name,
                              url: filterAccordingToPriorityForTestCategories(
                                      controller.testCategory.value!.data!)[i]
                                  .image,
                            ),
                          ),
                        ),
                      ),
                    )
                  : ApiHandler().progressIndicator(),
            ),
            InkWell(
              child: Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text(
                  'Test Packages',
                  style: Get.textTheme.headline5!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              onTap: () => Get.toNamed(Routes.TEST),
            ),
            Obx(() => controller.testPackage.value != null
                ? ListView.builder(
                    itemCount: controller.testPackage.value!.data!.length,
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemBuilder: (_, i) => InkWell(
                      onTap: () => Get.toNamed(Routes.TEST_INFO,
                          arguments: filterAccordingToPriorityForTestPackages(
                                  controller.testPackage.value!.data!)[i]
                              .id),
                      child: TestCard(filterAccordingToPriorityForTestPackages(
                          controller.testPackage.value!.data!)[i]),
                    ),
                  )
                : ApiHandler().progressIndicator()),
            SizedBox(
              height: 8,
            ),
            _copyRights()
          ],
        ),
      );

  Widget _copyRights() => Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: Container(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                kHeroLogoSvg,
                color: Colors.grey,
                width: 100,
              ),
              Text(
                'All rights reserved by Ash Tree Clinic LLC',
                style: Get.textTheme.caption,
              )
            ],
          ),
        ),
      );
}

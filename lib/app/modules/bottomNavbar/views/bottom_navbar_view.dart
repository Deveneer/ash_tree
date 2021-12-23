import 'package:ash_tree/app/constants/assets.dart';
import 'package:ash_tree/app/modules/appointments/views/appointments_view.dart';
import 'package:ash_tree/app/modules/home/views/home_view.dart';
import 'package:ash_tree/app/modules/notification/views/notification_view.dart';
import 'package:ash_tree/app/modules/reports/views/reports_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../controllers/bottom_navbar_controller.dart';

class BottomNavbarView extends GetView<BottomNavbarController> {
  final List<Widget> _body = [
    HomeView(),
    ReportsView(),
    AppointmentsView(),
    NotificationView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _bottomNav(),
      body: Obx(() => _body[controller.currentIndex.value]),
    );
  }

  Widget _bottomNav() => Obx(
        () => BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: _unselectedItem(kOutlinedHomeSVG),
                activeIcon: _selectedItem(kFilledHomesSVG),
                label: ''),
            BottomNavigationBarItem(
                icon: _unselectedItem(kFileSVG),
                activeIcon: _selectedItem(kFileSVG),
                label: ''),
            BottomNavigationBarItem(
                icon: _unselectedItem(kCalenderSVG),
                activeIcon: _selectedItem(kCalenderSVG),
                label: ''),
            BottomNavigationBarItem(
                icon: _unselectedItem(kNotificationsSVG),
                activeIcon: _selectedItem(kNotificationsSVG),
                label: ''),
          ],
          showUnselectedLabels: false,
          currentIndex: controller.currentIndex.value,
          onTap: controller.onPageChanged,
          showSelectedLabels: false,
        ),
      );

  Widget _unselectedItem(String svg) => Container(
        child: SvgPicture.asset(svg, color: Colors.black),
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey[400]!,
            ),
            borderRadius: BorderRadius.circular(20),
            color: Colors.white),
        padding: EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 6,
        ),
      );

  Widget _selectedItem(String svg) => Obx(
        () => Container(
          child: SvgPicture.asset(svg, color: Colors.white),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: Colors.black),
          padding: EdgeInsets.symmetric(
            horizontal: 18,
            vertical: controller.currentIndex.value == 0 ? 6.5 : 6,
          ),
        ),
      );
}

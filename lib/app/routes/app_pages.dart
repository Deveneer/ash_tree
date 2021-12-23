import 'package:get/get.dart';

import 'package:ash_tree/app/modules/addAddress/bindings/add_address_binding.dart';
import 'package:ash_tree/app/modules/addAddress/views/add_address_view.dart';
import 'package:ash_tree/app/modules/addFamily/bindings/add_family_binding.dart';
import 'package:ash_tree/app/modules/addFamily/views/add_family_view.dart';
import 'package:ash_tree/app/modules/address/bindings/address_binding.dart';
import 'package:ash_tree/app/modules/address/views/address_view.dart';
import 'package:ash_tree/app/modules/addressSelect/bindings/address_select_binding.dart';
import 'package:ash_tree/app/modules/addressSelect/views/address_select_view.dart';
import 'package:ash_tree/app/modules/appointments/bindings/appointments_binding.dart';
import 'package:ash_tree/app/modules/appointments/views/appointments_view.dart';
import 'package:ash_tree/app/modules/bottomNavbar/bindings/bottom_navbar_binding.dart';
import 'package:ash_tree/app/modules/bottomNavbar/views/bottom_navbar_view.dart';
import 'package:ash_tree/app/modules/cart/bindings/cart_binding.dart';
import 'package:ash_tree/app/modules/chooseLab/bindings/choose_lab_binding.dart';
import 'package:ash_tree/app/modules/chooseLab/views/choose_lab_view.dart';
import 'package:ash_tree/app/modules/coupon/bindings/coupon_binding.dart';
import 'package:ash_tree/app/modules/coupon/views/coupon_view.dart';
import 'package:ash_tree/app/modules/editAddress/bindings/edit_address_binding.dart';
import 'package:ash_tree/app/modules/editAddress/views/edit_address_view.dart';
import 'package:ash_tree/app/modules/editFamily/bindings/edit_family_binding.dart';
import 'package:ash_tree/app/modules/editFamily/views/edit_family_view.dart';
import 'package:ash_tree/app/modules/editProfile/bindings/edit_profile_binding.dart';
import 'package:ash_tree/app/modules/editProfile/views/edit_profile_view.dart';
import 'package:ash_tree/app/modules/familyMemberSelect/bindings/family_member_select_binding.dart';
import 'package:ash_tree/app/modules/familyMemberSelect/views/family_member_select_view.dart';
import 'package:ash_tree/app/modules/familyMembers/bindings/family_members_binding.dart';
import 'package:ash_tree/app/modules/familyMembers/views/family_members_view.dart';
import 'package:ash_tree/app/modules/home/bindings/home_binding.dart';
import 'package:ash_tree/app/modules/home/views/home_view.dart';
import 'package:ash_tree/app/modules/landing/bindings/landing_binding.dart';
import 'package:ash_tree/app/modules/landing/views/landing_view.dart';
import 'package:ash_tree/app/modules/notification/bindings/notification_binding.dart';
import 'package:ash_tree/app/modules/notification/views/notification_view.dart';
import 'package:ash_tree/app/modules/orders/bindings/orders_binding.dart';
import 'package:ash_tree/app/modules/orders/views/orders_view.dart';
import 'package:ash_tree/app/modules/otp/bindings/otp_binding.dart';
import 'package:ash_tree/app/modules/otp/views/otp_view.dart';
import 'package:ash_tree/app/modules/paymentOption/bindings/payment_option_binding.dart';
import 'package:ash_tree/app/modules/paymentOption/views/payment_option_view.dart';
import 'package:ash_tree/app/modules/payment_web_view/bindings/payment_web_view_binding.dart';
import 'package:ash_tree/app/modules/payment_web_view/views/payment_web_view_view.dart';
import 'package:ash_tree/app/modules/privacy/bindings/privacy_binding.dart';
import 'package:ash_tree/app/modules/privacy/views/privacy_view.dart';
import 'package:ash_tree/app/modules/profile/bindings/profile_binding.dart';
import 'package:ash_tree/app/modules/profile/views/profile_view.dart';
import 'package:ash_tree/app/modules/reports/bindings/reports_binding.dart';
import 'package:ash_tree/app/modules/reports/views/reports_view.dart';
import 'package:ash_tree/app/modules/resident/bindings/resident_binding.dart';
import 'package:ash_tree/app/modules/resident/views/resident_view.dart';
import 'package:ash_tree/app/modules/search_result/bindings/search_result_binding.dart';
import 'package:ash_tree/app/modules/search_result/views/search_result_view.dart';
import 'package:ash_tree/app/modules/signUp/bindings/sign_up_binding.dart';
import 'package:ash_tree/app/modules/signUp/views/sign_up_view.dart';
import 'package:ash_tree/app/modules/splash/bindings/splash_binding.dart';
import 'package:ash_tree/app/modules/splash/views/splash_view.dart';
import 'package:ash_tree/app/modules/terms/bindings/terms_binding.dart';
import 'package:ash_tree/app/modules/terms/views/terms_view.dart';
import 'package:ash_tree/app/modules/test/bindings/test_binding.dart';
import 'package:ash_tree/app/modules/test/views/test_view.dart';
import 'package:ash_tree/app/modules/testInfo/bindings/test_info_binding.dart';
import 'package:ash_tree/app/modules/testInfo/views/test_info_view.dart';
import 'package:ash_tree/app/modules/testInfoSlot/bindings/test_info_slot_binding.dart';
import 'package:ash_tree/app/modules/testInfoSlot/views/test_info_slot_view.dart';

import '../modules/cart/views/cart_view.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.LANDING,
      page: () => LandingView(),
      binding: LandingBinding(),
    ),
    GetPage(
      name: _Paths.OTP,
      page: () => OtpView(),
      binding: OtpBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_UP,
      page: () => SignUpView(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: _Paths.RESIDENT,
      page: () => ResidentView(),
      binding: ResidentBinding(),
    ),
    GetPage(
      name: _Paths.TEST,
      page: () => TestView(),
      binding: TestBinding(),
    ),
    GetPage(
      name: _Paths.CHOOSE_LAB,
      page: () => ChooseLabView(),
      binding: ChooseLabBinding(),
    ),
    GetPage(
      name: _Paths.CART,
      page: () => CartView(),
      binding: CartBinding(),
    ),
    GetPage(
      name: _Paths.ADD_FAMILY,
      page: () => AddFamilyView(),
      binding: AddFamilyBinding(),
    ),
    GetPage(
      name: _Paths.FAMILY_MEMBERS,
      page: () => FamilyMembersView(),
      binding: FamilyMembersBinding(),
    ),
    GetPage(
      name: _Paths.APPOINTMENTS,
      page: () => AppointmentsView(),
      binding: AppointmentsBinding(),
    ),
    GetPage(
      name: _Paths.REPORTS,
      page: () => ReportsView(),
      binding: ReportsBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATION,
      page: () => NotificationView(),
      binding: NotificationBinding(),
    ),
    GetPage(
      name: _Paths.PAYMENT_OPTION,
      page: () => PaymentOptionView(),
      binding: PaymentOptionBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.BOTTOMNAVBAR,
      page: () => BottomNavbarView(),
      binding: BottomNavbarBinding(),
    ),
    GetPage(
      name: _Paths.TEST_INFO,
      page: () => TestInfoView(),
      binding: TestInfoBinding(),
    ),
    GetPage(
      name: _Paths.TEST_INFO_SLOT,
      page: () => TestInfoSlotView(),
      binding: TestInfoSlotBinding(),
    ),
    GetPage(
      name: _Paths.ADDRESS,
      page: () => AddressView(),
      binding: AddressBinding(),
    ),
    GetPage(
      name: _Paths.ADD_ADDRESS,
      page: () => AddAddressView(),
      binding: AddAddressBinding(),
    ),
    GetPage(
      name: _Paths.TERMS,
      page: () => TermsView(),
      binding: TermsBinding(),
    ),
    GetPage(
      name: _Paths.PRIVACY,
      page: () => PrivacyView(),
      binding: PrivacyBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_PROFILE,
      page: () => EditProfileView(),
      binding: EditProfileBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_FAMILY,
      page: () => EditFamilyView(),
      binding: EditFamilyBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_ADDRESS,
      page: () => EditAddressView(),
      binding: EditAddressBinding(),
    ),
    GetPage(
      name: _Paths.FAMILY_MEMBER_SELECT,
      page: () => FamilyMemberSelectView(),
      binding: FamilyMemberSelectBinding(),
    ),
    GetPage(
      name: _Paths.ADDRESS_SELECT,
      page: () => AddressSelectView(),
      binding: AddressSelectBinding(),
    ),
    GetPage(
      name: _Paths.COUPON,
      page: () => CouponView(),
      binding: CouponBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH_RESULT,
      page: () => SearchResultView(),
      binding: SearchResultBinding(),
    ),
    GetPage(
      name: _Paths.ORDERS,
      page: () => OrdersView(),
      binding: OrdersBinding(),
    ),
    GetPage(
      name: _Paths.PAYMENT_WEB_VIEW,
      page: () => PaymentWebViewView(),
      binding: PaymentWebViewBinding(),
    ),
  ];
}

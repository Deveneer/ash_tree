import 'package:ash_tree/app/api/provider/api_provider.dart';
import 'package:ash_tree/app/models/cart_reponse.dart';
import 'package:ash_tree/app/models/coupon_response.dart' as Coupon;
import 'package:ash_tree/app/routes/app_pages.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class CartController extends GetxController with StateMixin<CartReponse> {
  ApiProvider _apiProvider = Get.find();
  Rx<PriceDetails> priceData = PriceDetails().obs;
  Rx<Coupon.Data> coupon = Coupon.Data().obs;
  var priceVisible = false.obs;
  RxBool isCartEmpty = true.obs;

  @override
  void onInit() {
    super.onInit();
    change(null, status: RxStatus.loading());
    getCartData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getCartData() {
    _apiProvider.getCart(coupon.value.id ?? '0').then(
      (value) {
        if (value.isOk) {
          CartReponse _data = CartReponse.fromJson(value.body);
          if (_data.data != null) {
            change(_data, status: RxStatus.success());
            priceData.value = _data.priceDetails!;
            isCartEmpty.value = false;
          } else {
            change(null, status: RxStatus.empty());
            isCartEmpty.value = true;
          }
        } else {
          change(null, status: RxStatus.error(value.bodyString));
        }
      },
    );
  }

  onPlaceOrderPressed() {
    if (priceVisible.value) {
      Get.toNamed(Routes.PAYMENT_OPTION, arguments: coupon.value.id);
    } else {
      priceVisible.value = true;
      getCartData();
    }
  }

  void removeTestPackage(String cartId) {
    Map<String, String> requestMap = {'item_id': cartId};
    Fluttertoast.showToast(msg: 'Please wait removing test from cart...');
    _apiProvider.removeTestFromCart(requestMap).then(
      (value) {
        if (value.isOk) {
          Fluttertoast.showToast(msg: 'Test Package removed successfully.');
          getCartData();
        } else
          Get.snackbar(
              'Error Occured.', 'Something went wrong. Try again later.');
      },
    );
  }
}

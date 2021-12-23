class CartReponse {
  bool? _status;
  String? _message;
  List<Data>? _data;
  PriceDetails? _priceDetails;

  bool? get status => _status;
  String? get message => _message;
  List<Data>? get data => _data;
  PriceDetails? get priceDetails => _priceDetails;

  CartReponse(
      {bool? status,
      String? message,
      List<Data>? data,
      PriceDetails? priceDetails}) {
    _status = status;
    _message = message;
    _data = data;
    _priceDetails = priceDetails;
  }

  CartReponse.fromJson(dynamic json) {
    _status = json["status"];
    _message = json["message"];
    if (json["data"] != null) {
      _data = [];
      json["data"].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
    _priceDetails = json["price_details"] != null
        ? PriceDetails.fromJson(json["price_details"])
        : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["status"] = _status;
    map["message"] = _message;
    if (_data != null) {
      map["data"] = _data?.map((v) => v.toJson()).toList();
    }
    if (_priceDetails != null) {
      map["price_details"] = _priceDetails?.toJson();
    }
    return map;
  }
}

class PriceDetails {
  String? _beforeDiscount;
  dynamic _couponPrice;
  String? _paybleAmount;
  String? _couponName;

  String? get beforeDiscount => _beforeDiscount;
  dynamic get couponPrice => _couponPrice;
  String? get paybleAmount => _paybleAmount;
  String? get couponName => _couponName;

  PriceDetails(
      {String? beforeDiscount, dynamic couponPrice, String? paybleAmount}) {
    _beforeDiscount = beforeDiscount;
    _couponName = couponName;
    _couponPrice = couponPrice;
    _paybleAmount = paybleAmount;
  }

  PriceDetails.fromJson(dynamic json) {
    _beforeDiscount = json["before_discount"];
    _couponPrice = json["coupon_price"];
    _couponName = json["coupon_name"];
    _paybleAmount = json["payble_amount"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["before_discount"] = _beforeDiscount;
    map["coupon_price"] = _couponPrice;
    map["payble_amount"] = _paybleAmount;
    map["coupon_name"] = _couponName;
    return map;
  }
}

class Data {
  String? _id;
  String? _cartId;
  String? _labName;
  String? _labAddress;
  String? _labImage;
  String? _packageName;
  String? _packagePrice;
  String? _familyMemberName;
  String? _profileImage;
  String? _bookingDate;
  String? _slotTime;
  String? _visitPlace;

  String? get id => _id;
  String? get cartId => _cartId;
  String? get labName => _labName;
  String? get labAddress => _labAddress;
  String? get labImage => _labImage;
  String? get packageName => _packageName;
  String? get packagePrice => _packagePrice;
  String? get familyMemberName => _familyMemberName;
  String? get profileImage => _profileImage;
  String? get bookingDate => _bookingDate;
  String? get slotTime => _slotTime;
  String? get visitPlace => _visitPlace;

  Data(
      {String? id,
      String? cartId,
      String? labName,
      String? labAddress,
      String? labImage,
      String? packageName,
      String? packagePrice,
      String? familyMemberName,
      String? profileImage,
      String? bookingDate,
      String? slotTime,
      String? visitPlace}) {
    _id = id;
    _cartId = cartId;
    _labName = labName;
    _labAddress = labAddress;
    _labImage = labImage;
    _packageName = packageName;
    _packagePrice = packagePrice;
    _familyMemberName = familyMemberName;
    _profileImage = profileImage;
    _bookingDate = bookingDate;
    _slotTime = slotTime;
    _visitPlace = visitPlace;
  }

  Data.fromJson(dynamic json) {
    _id = json["id"];
    _cartId = json["cart_id"];
    _labName = json["lab_name"];
    _labAddress = json["lab_address"];
    _labImage = json["lab_image"];
    _packageName = json["package_name"];
    _packagePrice = json["package_price"];
    _familyMemberName = json["family_member_name"];
    _profileImage = json["profile_image"];
    _bookingDate = json["booking_date"];
    _slotTime = json["slot_time"];
    _visitPlace = json["visit_place"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["cart_id"] = _cartId;
    map["lab_name"] = _labName;
    map["lab_address"] = _labAddress;
    map["lab_image"] = _labImage;
    map["package_name"] = _packageName;
    map["package_price"] = _packagePrice;
    map["family_member_name"] = _familyMemberName;
    map["profile_image"] = _profileImage;
    map["booking_date"] = _bookingDate;
    map["slot_time"] = _slotTime;
    map["visit_place"] = _visitPlace;
    return map;
  }
}

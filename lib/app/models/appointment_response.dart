class AppointmentResponse {
  bool? _status;
  String? _message;
  List<Data>? _data;

  bool? get status => _status;
  String? get message => _message;
  List<Data>? get data => _data;

  AppointmentResponse({bool? status, String? message, List<Data>? data}) {
    _status = status;
    _message = message;
    _data = data;
  }

  AppointmentResponse.fromJson(dynamic json) {
    _status = json["status"];
    _message = json["message"];
    if (json["data"] != null) {
      _data = [];
      json["data"].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["status"] = _status;
    map["message"] = _message;
    if (_data != null) {
      map["data"] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Data {
  String? _labName;
  String? _labAddress;
  String? _labImage;
  String? _packageName;
  String? _packagePrice;
  String? _orderId;
  String? _bookingDate;
  String? _slotTime;
  String? _visitPlace;
  String? _orderStatus;
  String? _testBookedFor;

  String? get labName => _labName;
  String? get labAddress => _labAddress;
  String? get labImage => _labImage;
  String? get packageName => _packageName;
  String? get packagePrice => _packagePrice;
  String? get orderId => _orderId;
  String? get bookingDate => _bookingDate;
  String? get slotTime => _slotTime;
  String? get visitPlace => _visitPlace;
  String? get orderStatus => _orderStatus;
  String? get testBookedFor => _testBookedFor;
  Data({
    String? labName,
    String? labAddress,
    String? labImage,
    String? packageName,
    String? packagePrice,
    String? orderId,
    String? bookingDate,
    String? slotTime,
    String? visitPlace,
    String? orderStatus,
    String? testBookedFor,
  }) {
    _labName = labName;
    _labAddress = labAddress;
    _labImage = labImage;
    _packageName = packageName;
    _packagePrice = packagePrice;
    _orderId = orderId;
    _bookingDate = bookingDate;
    _slotTime = slotTime;
    _visitPlace = visitPlace;
    _orderStatus = orderStatus;
    _testBookedFor = testBookedFor;
  }

  Data.fromJson(dynamic json) {
    _labName = json["lab_name"];
    _labAddress = json["lab_address"];
    _labImage = json["lab_image"];
    _packageName = json["package_name"];
    _packagePrice = json["package_price"];
    _orderId = json["order_id"];
    _bookingDate = json["booking_date"];
    _slotTime = json["slot_time"];
    _visitPlace = json["visit_place"];
    _orderStatus = json["order_status"];
    _testBookedFor = json['family_member'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["lab_name"] = _labName;
    map["lab_address"] = _labAddress;
    map["lab_image"] = _labImage;
    map["package_name"] = _packageName;
    map["package_price"] = _packagePrice;
    map["order_id"] = _orderId;
    map["booking_date"] = _bookingDate;
    map["slot_time"] = _slotTime;
    map["visit_place"] = _visitPlace;
    map["order_status"] = _orderStatus;
    map['family_member'] = _testBookedFor;
    return map;
  }
}

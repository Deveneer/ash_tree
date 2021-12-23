class AllAddressResponse {
  bool? _status;
  String? _message;
  List<Data>? _data;

  bool? get status => _status;
  String? get message => _message;
  List<Data>? get data => _data;

  AllAddressResponse({bool? status, String? message, List<Data>? data}) {
    _status = status;
    _message = message;
    _data = data;
  }

  AllAddressResponse.fromJson(dynamic json) {
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
  String? _id;
  String? _name;
  String? _mobileNumber;
  String? _address;
  String? _landmark;
  String? _city;
  String? _state;
  String? _pinCode;

  String? get id => _id;
  String? get name => _name;
  String? get mobileNumber => _mobileNumber;
  String? get address => _address;
  String? get landmark => _landmark;
  String? get city => _city;
  String? get state => _state;
  String? get pinCode => _pinCode;

  Data(
      {String? id,
      String? name,
      String? mobileNumber,
      String? address,
      String? landmark,
      String? city,
      String? state,
      String? pinCode}) {
    _id = id;
    _name = name;
    _mobileNumber = mobileNumber;
    _address = address;
    _landmark = landmark;
    _city = city;
    _state = state;
    _pinCode = pinCode;
  }

  Data.fromJson(dynamic json) {
    _id = json["id"];
    _name = json["name"];
    _mobileNumber = json["mobile_number"];
    _address = json["address"];
    _landmark = json["landmark"];
    _city = json["city"];
    _state = json["state"];
    _pinCode = json["pin_code"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["name"] = _name;
    map["mobile_number"] = _mobileNumber;
    map["address"] = _address;
    map["landmark"] = _landmark;
    map["city"] = _city;
    map["state"] = _state;
    map["pin_code"] = _pinCode;
    return map;
  }
}

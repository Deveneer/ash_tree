class CouponResponse {
  bool? _status;
  String? _message;
  List<Data>? _data;

  bool? get status => _status;
  String? get message => _message;
  List<Data>? get data => _data;

  CouponResponse({bool? status, String? message, List<Data>? data}) {
    _status = status;
    _message = message;
    _data = data;
  }

  CouponResponse.fromJson(dynamic json) {
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
  String? _title;
  dynamic _miniCartVal;
  String? _price;
  dynamic _startDate;
  String? _endDate;
  String? _status;
  String? _isDeleted;
  String? _createAt;

  String? get id => _id;
  String? get name => _name;
  String? get title => _title;
  dynamic get miniCartVal => _miniCartVal;
  String? get price => _price;
  dynamic get startDate => _startDate;
  String? get endDate => _endDate;
  String? get status => _status;
  String? get isDeleted => _isDeleted;
  String? get createAt => _createAt;

  Data(
      {String? id,
      String? name,
      String? title,
      dynamic miniCartVal,
      String? price,
      dynamic startDate,
      String? endDate,
      String? status,
      String? isDeleted,
      String? createAt}) {
    _id = id;
    _name = name;
    _title = title;
    _miniCartVal = miniCartVal;
    _price = price;
    _startDate = startDate;
    _endDate = endDate;
    _status = status;
    _isDeleted = isDeleted;
    _createAt = createAt;
  }

  Data.fromJson(dynamic json) {
    _id = json["id"];
    _name = json["name"];
    _title = json["title"];
    _miniCartVal = json["mini_cart_val"];
    _price = json["price"];
    _startDate = json["start_date"];
    _endDate = json["end_date"];
    _status = json["status"];
    _isDeleted = json["is_deleted"];
    _createAt = json["create_at"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["name"] = _name;
    map["title"] = _title;
    map["mini_cart_val"] = _miniCartVal;
    map["price"] = _price;
    map["start_date"] = _startDate;
    map["end_date"] = _endDate;
    map["status"] = _status;
    map["is_deleted"] = _isDeleted;
    map["create_at"] = _createAt;
    return map;
  }
}

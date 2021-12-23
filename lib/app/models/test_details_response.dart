class TestDetailsResponse {
  bool? _status;
  String? _message;
  Data? _data;

  bool? get status => _status;
  String? get message => _message;
  Data? get data => _data;

  TestDetailsResponse({bool? status, String? message, Data? data}) {
    _status = status;
    _message = message;
    _data = data;
  }

  TestDetailsResponse.fromJson(dynamic json) {
    _status = json["status"];
    _message = json["message"];
    _data = json["data"] != null ? Data.fromJson(json["data"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["status"] = _status;
    map["message"] = _message;
    if (_data != null) {
      map["data"] = _data?.toJson();
    }
    return map;
  }
}

class Data {
  String? _id;
  String? _name;
  String? _price;
  String? _preparation;
  String? _useOfTest;
  String? _components;
  String? _testInfo;
  String? _doDont;
  String? _homeVisit;
  dynamic _homeVisitCharges;
  String? _image;

  String? get id => _id;
  String? get name => _name;
  String? get price => _price;
  String? get preparation => _preparation;
  String? get useOfTest => _useOfTest;
  String? get components => _components;
  String? get testInfo => _testInfo;
  String? get doDont => _doDont;
  String? get homeVisit => _homeVisit;
  dynamic get homeVisitCharges => _homeVisitCharges;
  String? get image => _image;

  Data(
      {String? id,
      String? name,
      String? price,
      String? preparation,
      String? useOfTest,
      String? components,
      String? testInfo,
      String? doDont,
      String? homeVisit,
      dynamic homeVisitCharges,
      String? image}) {
    _id = id;
    _name = name;
    _price = price;
    _preparation = preparation;
    _useOfTest = useOfTest;
    _components = components;
    _testInfo = testInfo;
    _doDont = doDont;
    _homeVisit = homeVisit;
    _homeVisitCharges = homeVisitCharges;
    _image = image;
  }

  Data.fromJson(dynamic json) {
    _id = json["id"];
    _name = json["name"];
    _price = json["price"];
    _preparation = json["preparation"];
    _useOfTest = json["use_of_test"];
    _components = json["components"];
    _testInfo = json["test_info"];
    _doDont = json["do_dont"];
    _homeVisit = json["home_visit"];
    _homeVisitCharges = json["home_visit_charges"];
    _image = json["image"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["name"] = _name;
    map["price"] = _price;
    map["preparation"] = _preparation;
    map["use_of_test"] = _useOfTest;
    map["components"] = _components;
    map["test_info"] = _testInfo;
    map["do_dont"] = _doDont;
    map["home_visit"] = _homeVisit;
    map["home_visit_charges"] = _homeVisitCharges;
    map["image"] = _image;
    return map;
  }
}

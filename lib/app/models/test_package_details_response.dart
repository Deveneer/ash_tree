class TestPackageDetailsResponse {
  bool? _status;
  String? _message;
  Data? _data;

  bool? get status => _status;
  String? get message => _message;
  Data? get data => _data;

  TestPackageDetailsResponse({bool? status, String? message, Data? data}) {
    _status = status;
    _message = message;
    _data = data;
  }

  TestPackageDetailsResponse.fromJson(dynamic json) {
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
  String? _testId;
  String? _name;
  String? _price;
  String? _preparation;
  String? _useOfTest;
  String? _isHomeVisitAvailable;
  String? _components;
  String? _testInfo;
  String? _doDont;
  String? _homeVisit;
  String? _image;
  List<IncludeTest>? _includeTest;

  String? get id => _id;
  String? get testId => _testId;
  String? get name => _name;
  String? get price => _price;
  String? get preparation => _preparation;
  String? get useOfTest => _useOfTest;
  String? get isHomeVisitAvailable => _isHomeVisitAvailable;
  String? get components => _components;
  String? get testInfo => _testInfo;
  String? get doDont => _doDont;
  String? get homeVisit => _homeVisit;
  String? get image => _image;
  List<IncludeTest>? get includeTest => _includeTest;

  Data(
      {String? id,
      String? testId,
      String? name,
      String? price,
      String? preparation,
      String? useOfTest,
      String? isHomeVisitAvailable,
      String? components,
      String? testInfo,
      String? doDont,
      String? homeVisit,
      String? image,
      List<IncludeTest>? includeTest}) {
    _id = id;
    _testId = testId;
    _name = name;
    _price = price;
    _preparation = preparation;
    _useOfTest = useOfTest;
    _isHomeVisitAvailable = isHomeVisitAvailable;
    _components = components;
    _testInfo = testInfo;
    _doDont = doDont;
    _homeVisit = homeVisit;
    _image = image;
    _includeTest = includeTest;
  }

  Data.fromJson(dynamic json) {
    _id = json["id"];
    _testId = json["test_id"];
    _name = json["name"];
    _price = json["price"];
    _preparation = json["preparation"];
    _useOfTest = json["use_of_test"];
    _isHomeVisitAvailable = json['is_home_visit_available'];
    _components = json["components"];
    _testInfo = json["test_info"];
    _doDont = json["do_dont"];
    _homeVisit = json["home_visit"];
    _image = json["image"];
    if (json["include_test"] != null) {
      _includeTest = [];
      json["include_test"].forEach((v) {
        _includeTest?.add(IncludeTest.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["test_id"] = _testId;
    map["name"] = _name;
    map["price"] = _price;
    map["preparation"] = _preparation;
    map["use_of_test"] = _useOfTest;
    map['is_home_visit_available'] = _isHomeVisitAvailable;
    map["components"] = _components;
    map["test_info"] = _testInfo;
    map["do_dont"] = _doDont;
    map["home_visit"] = _homeVisit;
    map["image"] = _image;
    if (_includeTest != null) {
      map["include_test"] = _includeTest?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class IncludeTest {
  String? _id;
  String? _name;
  String? _price;
  String? _preparation;
  String? _useOfTest;
  String? _components;
  String? _testInfo;
  String? _doDont;
  String? _homeVisit;
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
  String? get image => _image;

  IncludeTest(
      {String? id,
      String? name,
      String? price,
      String? preparation,
      String? useOfTest,
      String? components,
      String? testInfo,
      String? doDont,
      String? homeVisit,
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
    _image = image;
  }

  IncludeTest.fromJson(dynamic json) {
    _id = json["id"];
    _name = json["name"];
    _price = json["price"];
    _preparation = json["preparation"];
    _useOfTest = json["use_of_test"];
    _components = json["components"];
    _testInfo = json["test_info"];
    _doDont = json["do_dont"];
    _homeVisit = json["home_visit"];
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
    map["image"] = _image;
    return map;
  }
}

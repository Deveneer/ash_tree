class TestPackagesResponse {
  bool? _status;
  String? _message;
  String? _keyword;
  List<TestPackagesData>? _data;

  bool? get status => _status;
  String? get message => _message;
  String? get keyword => _keyword;
  List<TestPackagesData>? get data => _data;

  TestPackagesResponse(
      {bool? status, String? message, List<TestPackagesData>? data}) {
    _status = status;
    _message = message;
    _keyword = keyword;
    _data = data;
  }

  TestPackagesResponse.fromJson(dynamic json) {
    _status = json["status"];
    _message = json["message"];
    _keyword = json["keyword"];
    if (json["data"] != null) {
      _data = [];
      json["data"].forEach((v) {
        _data?.add(TestPackagesData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["status"] = _status;
    map["message"] = _message;
    map["keyword"] = _keyword;
    if (_data != null) {
      map["data"] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class TestPackagesData {
  String? _id;
  String? _price;
  String? _name;
  String? _preparation;
  String? _components;
  String? _thumbImg;
  String? _image;
  int? _priority;

  String? get id => _id;
  String? get price => _price;
  String? get name => _name;
  String? get preparation => _preparation;
  String? get components => _components;
  String? get thumbImg => _thumbImg;
  String? get image => _image;
  int? get priority => _priority;

  TestPackagesData({
    String? id,
    String? price,
    String? name,
    String? preparation,
    String? components,
    String? image,
    String? thumbImg,
    int? priority,
  }) {
    _id = id;
    _price = price;
    _name = name;
    _preparation = preparation;
    _components = components;
    _thumbImg = thumbImg;
    _image = image;
    _priority = priority;
  }

  TestPackagesData.fromJson(dynamic json) {
    _id = json["id"];
    _price = json["price"];
    _name = json["name"];
    _preparation = json["preparation"];
    _components = json["components"];
    _thumbImg = json["thumb_img"];
    _image = json["image"];
    _priority = int.parse(json["priority"] ?? '0');
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["price"] = _price;
    map["name"] = _name;
    map["preparation"] = _preparation;
    map["components"] = _components;
    map["thumb_img"] = _thumbImg;
    map["image"] = _image;
    map["priority"] = _priority;
    return map;
  }
}

class BannerResponse {
  bool? _status;
  String? _message;
  List<Data>? _data;

  bool? get status => _status;
  String? get message => _message;
  List<Data>? get data => _data;

  BannerResponse({bool? status, String? message, List<Data>? data}) {
    _status = status;
    _message = message;
    _data = data;
  }

  BannerResponse.fromJson(dynamic json) {
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
  String? _packageId;
  String? _bannersImage;

  String? get id => _id;
  String? get packageId => _packageId;
  String? get bannersImage => _bannersImage;

  Data({
    String? id,
    String? packageId,
    String? bannersImage,
  }) {
    _id = id;
    _packageId = packageId;
    _bannersImage = bannersImage;
  }

  Data.fromJson(dynamic json) {
    _id = json["id"];
    _packageId = json["package_id"];
    _bannersImage = json["banners_image"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["packageId"] = _packageId;
    map["banners_image"] = _bannersImage;
    return map;
  }
}

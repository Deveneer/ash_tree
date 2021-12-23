class NotificationResponse {
  bool? _status;
  String? _message;
  List<Data>? _data;

  bool? get status => _status;
  String? get message => _message;
  List<Data>? get data => _data;

  NotificationResponse({bool? status, String? message, List<Data>? data}) {
    _status = status;
    _message = message;
    _data = data;
  }

  NotificationResponse.fromJson(dynamic json) {
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
  String? _message;
  dynamic _image;

  String? get id => _id;
  String? get message => _message;
  dynamic get image => _image;

  Data({String? id, String? message, dynamic image}) {
    _id = id;
    _message = message;
    _image = image;
  }

  Data.fromJson(dynamic json) {
    _id = json["id"];
    _message = json["message"];
    _image = json["image"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["message"] = _message;
    map["image"] = _image;
    return map;
  }
}

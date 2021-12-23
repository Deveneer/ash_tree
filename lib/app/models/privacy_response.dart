class PrivacyResponse {
  bool? _status;
  String? _message;
  String? _data;

  bool? get status => _status;
  String? get message => _message;
  String? get data => _data;

  PrivacyResponse({bool? status, String? message, String? data}) {
    _status = status;
    _message = message;
    _data = data;
  }

  PrivacyResponse.fromJson(dynamic json) {
    _status = json["status"];
    _message = json["message"].toString();
    _data = json["data"].toString();
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["status"] = _status;
    map["message"] = _message;
    map["data"] = _data;
    return map;
  }
}

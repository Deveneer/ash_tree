/// status : true
/// message : "User Already exists!!  OTP SEND!!"

class CommonResponse {
  late bool _status;
  late String _message;

  bool get status => _status;
  String get message => _message;

  CommonResponse({required bool status, required String message}) {
    _status = status;
    _message = message;
  }

  CommonResponse.fromJson(dynamic json) {
    _status = json["status"];
    _message = json["message"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["status"] = _status;
    map["message"] = _message;
    return map;
  }
}

class CommonResponseForUser {
  late bool _status;
  late String _message;
  late int _isUserExists;

  bool get status => _status;
  String get message => _message;
  int get isUserExists => _isUserExists;

  CommonResponseForUser({required bool status, required String message}) {
    _status = status;
    _message = message;
    _isUserExists = isUserExists;
  }

  CommonResponseForUser.fromJson(dynamic json) {
    _status = json["status"];
    _message = json["message"];
    _isUserExists = json["user_exist"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["status"] = _status;
    map["message"] = _message;
    map["user_exist"] = _isUserExists;
    return map;
  }
}

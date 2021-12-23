class LabsResponse {
  bool? _status;
  String? _message;
  List<Data>? _data;

  bool? get status => _status;
  String? get message => _message;
  List<Data>? get data => _data;

  LabsResponse({bool? status, String? message, List<Data>? data}) {
    _status = status;
    _message = message;
    _data = data;
  }

  LabsResponse.fromJson(dynamic json) {
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
  String? _distance;
  LabDetails? _labDetails;

  String? get id => _id;
  String? get distance => _distance;
  LabDetails? get labDetails => _labDetails;

  Data({String? id, String? distance, LabDetails? labDetails}) {
    _id = id;
    _distance = distance;
    _labDetails = labDetails;
  }

  Data.fromJson(dynamic json) {
    _id = json["id"];
    _distance = json["distance"];
    _labDetails = json["lab_details"] != null
        ? LabDetails.fromJson(json["lab_details"])
        : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["distance"] = _distance;
    if (_labDetails != null) {
      map["lab_details"] = _labDetails?.toJson();
    }
    return map;
  }
}

class LabDetails {
  String? _id;
  dynamic _testId;
  String? _name;
  String? _email;
  String? _mobile;
  String? _labAddress;
  String? _img;
  String? _longitude;
  String? _latitude;
  String? _accountHolderName;
  String? _bankName;
  String? _ifscCode;
  String? _branchName;
  String? _accountNumber;
  String? _adminCommission;
  String? _password;
  String? _status;
  String? _isDeleted;
  String? _createdAt;

  String? get id => _id;
  dynamic get testId => _testId;
  String? get name => _name;
  String? get email => _email;
  String? get mobile => _mobile;
  String? get labAddress => _labAddress;
  String? get img => _img;
  String? get longitude => _longitude;
  String? get latitude => _latitude;
  String? get accountHolderName => _accountHolderName;
  String? get bankName => _bankName;
  String? get ifscCode => _ifscCode;
  String? get branchName => _branchName;
  String? get accountNumber => _accountNumber;
  String? get adminCommission => _adminCommission;
  String? get password => _password;
  String? get status => _status;
  String? get isDeleted => _isDeleted;
  String? get createdAt => _createdAt;

  LabDetails(
      {String? id,
      dynamic testId,
      String? name,
      String? email,
      String? mobile,
      String? labAddress,
      dynamic img,
      String? longitude,
      String? latitude,
      String? accountHolderName,
      String? bankName,
      String? ifscCode,
      String? branchName,
      String? accountNumber,
      String? adminCommission,
      String? password,
      String? status,
      String? isDeleted,
      String? createdAt}) {
    _id = id;
    _testId = testId;
    _name = name;
    _email = email;
    _mobile = mobile;
    _labAddress = labAddress;
    _img = img;
    _longitude = longitude;
    _latitude = latitude;
    _accountHolderName = accountHolderName;
    _bankName = bankName;
    _ifscCode = ifscCode;
    _branchName = branchName;
    _accountNumber = accountNumber;
    _adminCommission = adminCommission;
    _password = password;
    _status = status;
    _isDeleted = isDeleted;
    _createdAt = createdAt;
  }

  LabDetails.fromJson(dynamic json) {
    _id = json["id"];
    _testId = json["test_id"];
    _name = json["name"];
    _email = json["email"];
    _mobile = json["mobile"];
    _labAddress = json["lab_address"];
    _img = json["img"];
    _longitude = json["longitude"];
    _latitude = json["latitude"];
    _accountHolderName = json["account_holder_name"];
    _bankName = json["bank_name"];
    _ifscCode = json["ifsc_code"];
    _branchName = json["branch_name"];
    _accountNumber = json["account_number"];
    _adminCommission = json["admin_commission"];
    _password = json["password"];
    _status = json["status"];
    _isDeleted = json["is_deleted"];
    _createdAt = json["created_at"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["test_id"] = _testId;
    map["name"] = _name;
    map["email"] = _email;
    map["mobile"] = _mobile;
    map["lab_address"] = _labAddress;
    map["img"] = _img;
    map["longitude"] = _longitude;
    map["latitude"] = _latitude;
    map["account_holder_name"] = _accountHolderName;
    map["bank_name"] = _bankName;
    map["ifsc_code"] = _ifscCode;
    map["branch_name"] = _branchName;
    map["account_number"] = _accountNumber;
    map["admin_commission"] = _adminCommission;
    map["password"] = _password;
    map["status"] = _status;
    map["is_deleted"] = _isDeleted;
    map["created_at"] = _createdAt;
    return map;
  }
}

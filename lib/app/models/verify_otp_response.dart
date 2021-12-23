class VerifyOtpResponse {
  bool? status;
  String? message;
  UserData? data;

  VerifyOtpResponse({this.status, this.message, this.data});

  VerifyOtpResponse.fromJson(dynamic json) {
    status = json["status"];
    message = json["message"];
    data = (json["data"] != null ? UserData.fromJson(json["data"]) : null)!;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["status"] = status;
    map["message"] = message;
    map["data"] = data!.toJson();
    return map;
  }
}

class UserData {
  String? id;
  String? mobile;
  String? name;
  String? email;
  String? dob;
  String? residentType;
  String? idNumber;
  String? gender;
  String? isVerified;
  String? image;
  String? token;
  bool? alreadyExists;

  UserData(
      {this.id,
      this.mobile,
      this.name,
      this.email,
      this.dob,
      this.residentType,
      this.idNumber,
      this.gender,
      this.isVerified,
      this.image,
      this.token,
      this.alreadyExists});

  UserData.fromJson(dynamic json) {
    id = json["id"];
    mobile = json["mobile"];
    name = json["name"];
    email = json["email"];
    dob = json["dob"];
    residentType = json["resident_type"];
    idNumber = json["id_number"];
    gender = json["gender"];
    isVerified = json["is_verified"];
    image = json["image"];
    token = json["token"];
    alreadyExists = json["already_exists"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["mobile"] = mobile;
    map["name"] = name;
    map["email"] = email;
    map["dob"] = dob;
    map["resident_type"] = residentType;
    map["id_number"] = idNumber;
    map["gender"] = gender;
    map["is_verified"] = isVerified;
    map["image"] = image;
    map["token"] = token;
    map["already_exists"] = alreadyExists;
    return map;
  }
}

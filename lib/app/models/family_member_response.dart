class FamilyMemberResponse {
  bool? status;
  String? message;
  List<Data>? data;

  FamilyMemberResponse({this.status, this.message, this.data});

  FamilyMemberResponse.fromJson(dynamic json) {
    status = json["status"];
    message = json["message"];
    if (json["data"] != null) {
      data = [];
      json["data"].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["status"] = status;
    map["message"] = message;
    if (data != null) {
      map["data"] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Data {
  String? id;
  String? name;
  String? profileImage;
  String? relationship;
  String? dob;
  String? gender;
  String? emergency;
  String? preExistingCondition;

  Data({
    this.id,
    this.name,
    this.profileImage,
    this.relationship,
    this.dob,
    this.gender,
    this.emergency,
    this.preExistingCondition,
  });

  Data.fromJson(dynamic json) {
    id = json["id"];
    name = json["name"];
    profileImage = json["profile_image"];
    relationship = json["relationship"];
    dob = json["dob"];
    gender = json["gender"];
    emergency = json["emergency"];
    preExistingCondition = json['pre_existing_conditions'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["name"] = name;
    map["profile_image"] = profileImage;
    map["relationship"] = relationship;
    map["dob"] = dob;
    map["gender"] = gender;
    map["emergency"] = emergency;
    map['pre_existing_conditions'] = preExistingCondition;
    return map;
  }
}

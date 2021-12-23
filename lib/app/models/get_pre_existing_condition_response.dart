import 'dart:convert';

GetPreExistingConditionResponse getPreExistingConditionResponseFromJson(
        String str) =>
    GetPreExistingConditionResponse.fromJson(json.decode(str));

String getPreExistingConditionResponseToJson(
        GetPreExistingConditionResponse data) =>
    json.encode(data.toJson());

class GetPreExistingConditionResponse {
  GetPreExistingConditionResponse({
    this.status,
    this.message,
    this.data,
  });

  bool? status;
  String? message;
  List<PreCondition>? data;

  factory GetPreExistingConditionResponse.fromJson(Map<String, dynamic> json) =>
      GetPreExistingConditionResponse(
        status: json["status"],
        message: json["message"],
        data: List<PreCondition>.from(
            json["data"].map((x) => PreCondition.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class PreCondition {
  PreCondition({
    this.preExistingConditions,
  });

  String? preExistingConditions;

  factory PreCondition.fromJson(Map<String, dynamic> json) => PreCondition(
        preExistingConditions: json["pre_existing_conditions"],
      );

  Map<String, dynamic> toJson() => {
        "pre_existing_conditions": preExistingConditions,
      };
}

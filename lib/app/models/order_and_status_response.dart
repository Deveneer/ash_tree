// To parse this JSON data, do
//     final orderStatusResponse = orderStatusResponseFromJson(jsonString);

import 'dart:convert';

OrderAndStatusResponse orderStatusResponseFromJson(String str) =>
    OrderAndStatusResponse.fromJson(json.decode(str));

String orderStatusResponseToJson(OrderAndStatusResponse data) =>
    json.encode(data.toJson());

class OrderAndStatusResponse {
  OrderAndStatusResponse({
    required this.status,
    required this.message,
    this.orderId,
    this.orderStatus,
  });

  bool status;
  String message;
  String? orderId;
  String? orderStatus;

  factory OrderAndStatusResponse.fromJson(Map<String, dynamic> json) =>
      OrderAndStatusResponse(
        status: json["status"],
        orderId: json["order_id"],
        message: json["message"],
        orderStatus: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "order_id": orderId,
        "message": message,
        "data": orderStatus,
      };
}

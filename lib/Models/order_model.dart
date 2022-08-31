// To parse this JSON data, do
//
//     final orderModel = orderModelFromJson(jsonString);

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

OrderModel orderModelFromJson(String str) => OrderModel.fromJson(json.decode(str));

String orderModelToJson(OrderModel data) => json.encode(data.toJson());

class OrderModel {
  OrderModel({
    required this.address,
    required this.clientId,
    required this.dateTime,
    required this.documentId,
    required this.orderStatus,
    required this.pName,
    required this.price,
    required this.productDescription,
    required this.productImage,
    required this.quantity,
    required this.userImage,
    required this.userMobileNo,
    required this.userName,
  });

  final String address;
  final String clientId;
  final Timestamp dateTime;
  final String documentId;
  final String orderStatus;
  final String pName;
  final String price;
  final String productDescription;
  final String productImage;
  final int quantity;
  final String userImage;
  final String userMobileNo;
  final String userName;

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
    address: json["address"],
    clientId: json["client_id"],
    dateTime: json["date_time"],
    documentId: json["document_id"],
    orderStatus: json["order_status"],
    pName: json["p_name"],
    price: json["price"],
    productDescription: json["product_description"],
    productImage: json["product_image"],
    quantity: json["quantity"],
    userImage: json["user_image"],
    userMobileNo: json["user_mobile_no"],
    userName: json["user_name"],
  );

  Map<String, dynamic> toJson() => {
    "address": address,
    "client_id": clientId,
    "date_time": dateTime,
    "document_id": documentId,
    "order_status": orderStatus,
    "p_name": pName,
    "price": price,
    "product_description": productDescription,
    "product_image": productImage,
    "quantity": quantity,
    "user_image": userImage,
    "user_mobile_no": userMobileNo,
    "user_name": userName,
  };
}

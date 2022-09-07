import 'package:cloud_firestore/cloud_firestore.dart';

class BrandsModel {
  static BrandsModel? model;
  final String brandName;
  final String brandDescription;
  final String brandImage;
  final Timestamp createdDate;
  final String documentId;

  BrandsModel({
    required this.documentId,
    required this.brandName,
    required this.brandDescription,
    required this.brandImage,
    required this.createdDate,

  });

  factory BrandsModel.fromJson(Map<String, dynamic> json) {
    return BrandsModel(
      brandName: json['brand_name'],
      brandDescription: json['brand_description'],
      brandImage: json['brand_image'],
      createdDate: json['created_date'],
      documentId: json['document_id']
    );
  }
}

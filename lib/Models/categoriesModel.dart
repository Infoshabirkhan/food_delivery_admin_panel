import 'package:cloud_firestore/cloud_firestore.dart';

class CategoriesModel {

  static CategoriesModel? model;
  final String categoryName;
  final String categoryDescription;
  final String categoryImage;
  final Timestamp createdDate;
  final String documentId;

  CategoriesModel({
    required this.categoryName,
    required this.categoryDescription,
    required this.categoryImage,
    required this.createdDate,
    required this.documentId,
  });


  factory CategoriesModel.fromJson(Map<String, dynamic> json){
    return CategoriesModel(categoryName: json['category_name'],
      categoryDescription: json['category_description'],
      categoryImage: json['category_image'],
      createdDate: json['created_date'],
      documentId: json['document_id'],);
  }
// 'category_image': data['category_image'],
// 'category_description': data['category_description'],
// 'category_name': data['category_name'],
// 'created_date': data['created_date'],
// 'document_id': data.id
}

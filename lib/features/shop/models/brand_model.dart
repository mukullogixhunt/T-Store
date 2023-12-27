import 'package:cloud_firestore/cloud_firestore.dart';

class BrandModel {
  String id;
  String name;
  String image;
  bool? isFeatured;
  int? productCount;

  BrandModel({
    required this.id,
    required this.name,
    required this.image,
    this.isFeatured,
    this.productCount,
  });

  ///Empty Helper Function
  static BrandModel empty() =>BrandModel(id: '', name: '', image: '');

  ///Covert model to json

  Map <String,dynamic> toJson(){
    return{
      'Id': id,
      'Name' :name,
      'Image': image,
      'IsFeatured' :isFeatured,
      'ProductCount' :productCount,
    };
  }

  ///Map Json oriented document snapshot from firebase

  factory BrandModel.fromJson(Map<String, dynamic> document) {
    final data = document;

    if (data.isEmpty) return BrandModel(id: '', name: '', image: '');

    return BrandModel(
      id: data['Id'] ?? '',
      name: data['Name'] ?? '',
      image: data['Image'] ?? '',
      isFeatured: data['IsFeatured'] ?? false,
      productCount: data['ProductCount'] ?? 0,
    );
  }

  ///Map Json oriented document snapshot from firebase

  factory BrandModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;

    if (data.isEmpty) return BrandModel(id: '', name: '', image: '');

    return BrandModel(
      id: data['Id'] ?? '',
      name: data['Name'] ?? '',
      image: data['Image'] ?? '',
      isFeatured: data['IsFeatured'] ?? false,
      productCount: data['ProductCount'] ?? 0,
    );
  }

}

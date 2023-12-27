import 'package:cloud_firestore/cloud_firestore.dart';

class ProductAttributeModel {
  String? name;
  final List<String>? values;

  ProductAttributeModel({this.name, this.values});

  ///Json Format
  Map<String, dynamic> toJson() {
    return {'Name': name, 'Values': values};
  }

  ///Map Json oriented document snapshot from firebase

  factory ProductAttributeModel.fromJson(
      Map<String, dynamic>document) {
    final data = document;

    if (data.isEmpty) return ProductAttributeModel();

    return ProductAttributeModel(
      name: data['Name'] ?? '',
      values: List<String>.from(data['Values']),
    );
  }

  ///Map Json oriented document snapshot from firebase

  factory ProductAttributeModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;

    if (data.isEmpty) return ProductAttributeModel();

    return ProductAttributeModel(
      name: data['Name'] ?? '',
      values: List<String>.from(data['Values']),
    );
  }
}

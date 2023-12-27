import 'package:cloud_firestore/cloud_firestore.dart';

class ProductVariationModel {
  final String id;
  String sku;
  String image;
  String? description;
  double price;
  double salePrice;
  int stock;
  Map<String, String> attributeValues;

  ProductVariationModel({
    required this.id,
    this.sku = '',
    this.image = '',
    this.description = '',
    this.price = 0.0,
    this.salePrice = 0.0,
    this.stock = 0,
    required this.attributeValues,
  });

  ///Empty Helper Function
  static ProductVariationModel empty() =>
      ProductVariationModel(id: '', attributeValues: {});

  ///Json Format
  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'Sku': sku,
      'Image': image,
      'Description': description,
      'Price': price,
      'SalePrice': salePrice,
      'Stock': stock,
      'AttributeValues': attributeValues,
    };
  }

  ///Map Json oriented document snapshot from firebase

  factory ProductVariationModel.fromJson(
      Map<String, dynamic> document) {
    final data = document;

    if (data.isEmpty) return ProductVariationModel(id: '', attributeValues: {});

    return ProductVariationModel(
      id: data['Id'] ?? '',
      sku: data['Sku'] ?? '',
      image: data['Image'] ?? '',
      description: data['Description'] ?? '',
      price: data['Price'] ?? '',
      salePrice: data['SalePrice'] ?? '',
      stock: data['Stock'] ?? '',
      attributeValues: Map<String,String>.from(data['AttributeValues']),
    );
  }

  ///Map Json oriented document snapshot from firebase

  factory ProductVariationModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;

    if (data.isEmpty) return ProductVariationModel(id: '', attributeValues: {});

    return ProductVariationModel(
      id: data['Id'] ?? '',
      sku: data['Sku'] ?? '',
      image: data['Image'] ?? '',
      description: data['Description'] ?? '',
      price: data['Price'] ?? '',
      salePrice: data['SalePrice'] ?? '',
      stock: data['Stock'] ?? '',
      attributeValues: Map<String,String>.from(data['AttributeValues']),
    );
  }

}

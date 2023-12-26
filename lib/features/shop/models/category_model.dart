import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  String id;
  String name;
  String image;
  String parentId;
  bool isFeatured;

  CategoryModel({
      required this.id,
      required this.name,
      required this.image,
      this.parentId = '',
      required this.isFeatured,
  });

  ///Empty Helper Function
  static CategoryModel empty() => CategoryModel(id: '', name: '', image: '', isFeatured: false);

  ///Convert Model to Json structure so that you can store data in Firebase
  Map <String,dynamic> toJson(){
    return{
      'Name':name,
      'Image':image,
      'ParentId':parentId,
      'IsFeatured':isFeatured,
    };
  }


  ///Map Json oriented document snapshot from firebase to CategoryModel

  factory CategoryModel.fromSnapshot(DocumentSnapshot<Map<String,dynamic>> document){
    if (document.data() != null) {
      final data = document.data()!;

      return CategoryModel(
        id: document.id,
        name: data['Name'] ?? '',
        image: data['Image'] ?? '',
        parentId: data['ParentId'] ?? '',
        isFeatured: data['IsFeatured'] ?? false,
      );

    }else{
      return CategoryModel.empty();
    }

  }


}

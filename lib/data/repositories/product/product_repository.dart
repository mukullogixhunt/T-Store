

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:t_store/features/shop/models/product_model.dart';

import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

class ProductRepository extends GetxController {
  static ProductRepository get instance => Get.find();

  ///Variables
  final _db = FirebaseFirestore.instance;


  ///Get all Featured Products
  Future<List<ProductModel>> getAllFeaturedProducts() async {
    try{
      final snapshot = await _db.collection('Products').where('IsFeature', isEqualTo: true).get();
      final list = snapshot.docs.map((document) => ProductModel.fromSnapshot(document)).toList();
      return list;
    }on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    }on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch(e){
      throw 'Something went wrong. Please try again';
    }
  }


  ///Get limited Featured Products
  Future<List<ProductModel>> getFeaturedProducts() async {
    try{
      final snapshot = await _db.collection('Products').where('IsFeature', isEqualTo: true).limit(4).get();
      final list = snapshot.docs.map((document) => ProductModel.fromSnapshot(document)).toList();
      return list;
    }on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    }on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch(e){
      throw 'Something went wrong. Please try again';
    }
  }


  ///Get product based on brands
  Future<List<ProductModel>> fetchProductsByQuery(Query query) async {
    try{
      final querySnapshot = await query.get();
      final List<ProductModel> productList = querySnapshot.docs.map((doc) => ProductModel.fromQuerySnapshot(doc)).toList();
      return productList;
    }on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    }on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch(e){
      throw 'Something went wrong. Please try again';
    }
  }


  /// --- Upload Categories to the Cloud Firebase.
  /*Future<void> uploadDummyData(List<ProductModel> products) async{
    try{
      //Upload  all the Categories along with their Images
      final storage = Get.put(TFirebaseStorageService());

      //loop through each category
      for (var product in products){
        // Get ImageData link from the local assets
        final file = await storage.getImageDataFromAssets(product.thumbnail);

        //Upload Image and get its URL
        final url = await storage.uploadImageData('Products/Images',file,product.thumbnail.toString());

        //assign URL to product.thumbnail attribute
        product.thumbnail = url;

        //Product List of images
        if(product.images != null && product.images!.isNotEmpty){
           List<String> imagesUrl = [];
           for (var image in product.images!){
             //Get image data from local assets
             final assetImage = await storage.getImageDataFromAssets(image);
             //Upload Image and get its URL
             final url = await storage.uploadImageData('Products/Images',assetImage,image);
             
             //assign URL to product.thumbnail attribute
             imagesUrl.add(url);
           }
           product.images!.clear();
           product.images!.addAll(imagesUrl);
           }





        //Store Category in Firestore
        await _db.collection("Categories").doc(category.id).set(category.toJson());
      }

    }on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    }on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch(e){
      throw 'Something went wrong. Please try again';
    }*/


}

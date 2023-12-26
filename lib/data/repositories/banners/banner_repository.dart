import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:t_store/features/shop/models/banner_model.dart';

import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';
import '../../services/FirebaseStorageService/firebase_storage_service.dart';

class BannerRepository extends GetxController {
  static BannerRepository get instance => Get.find();

  ///Variables
  final _db = FirebaseFirestore.instance;

  ///Get all banners

  Future<List<BannerModel>> fetchBanners() async {
    try{
      final snapshot = await _db.collection('Banners').where('Active', isEqualTo: true).get();
      final list = snapshot.docs.map((document) => BannerModel.fromSnapshot(document)).toList();
      return list;
    }on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    }on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch(e){
      throw 'Something went wrong. Please try again';
    }
  }

  /// --- Upload Categories to the Cloud Firebase.
  Future<void> uploadDummyData(List<BannerModel> banners) async{
    try{
      //Upload  all the Categories along with their Images
      final storage = Get.put(TFirebaseStorageService());

      //loop through each category
      for (var banner in banners){
        // Get ImageData link from the local assets
        final file = await storage.getImageDataFromAssets(banner.imageUrl);

        //Upload Image and get its URL
        final url = await storage.uploadImageData('Banners',file,banner.imageUrl);

        //assign URL to Category.image attribute
        banner.imageUrl = url;

        //Store Category in Firestore
        await _db.collection("Banners").doc().set(banner.toJson());
      }

    }on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    }on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch(e){
      throw 'Something went wrong. Please try again';
    }
  }

}

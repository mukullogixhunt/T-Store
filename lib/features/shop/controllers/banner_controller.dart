
import 'package:get/get.dart';
import 'package:t_store/data/repositories/banners/banner_repository.dart';

import '../../../utils/popups/loaders.dart';
import '../models/banner_model.dart';

class BannerController extends GetxController {
  static BannerController get instance => Get.find();


  ///Variables
  final carousalCurrentIndex = 0.obs;

  final _bannerRepository = Get.put(BannerRepository());
  RxList<BannerModel> banners = <BannerModel>[].obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    fetchBanners();
    super.onInit();
  }


  /// Update Page Navigation Dots
  void updatePageIndicator(index) {
    carousalCurrentIndex.value = index;
  }

  ///Fetch Banners

  Future<void> fetchBanners() async {
    try {
      // Show loader while loading categories
      isLoading.value = true;

      // Fetch banners from data source (Firestore, API, etc.)
      final banners = await _bannerRepository.fetchBanners();

      //Assign Banners
      this.banners.assignAll(banners);


    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      //Remove Loader
      isLoading.value = false;
    }
  }




}

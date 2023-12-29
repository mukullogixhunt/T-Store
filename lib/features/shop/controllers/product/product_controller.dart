import 'package:get/get.dart';
import 'package:t_store/features/shop/models/product_model.dart';

import '../../../../data/repositories/product/product_repository.dart';
import '../../../../utils/constants/enums.dart';
import '../../../../utils/popups/loaders.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();

  ///Variables
  RxList<ProductModel> featuredProducts = <ProductModel>[].obs;
  final isLoading = false.obs;
  final _productRepository = Get.put(ProductRepository());

  @override
  void onInit() {
    fetchFeaturedProducts();
    super.onInit();
  }

  Future<void> fetchFeaturedProducts() async {
    try {
      // Show loader while loading categories
      isLoading.value = true;

      // Fetch products from data source (Firestore, API, etc.)
      final featuredProducts = await _productRepository.getFeaturedProducts();

      //Assign products
      this.featuredProducts.assignAll(featuredProducts);
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      //Remove Loader
      isLoading.value = false;
    }
  }

  Future<List<ProductModel>> fetchAllFeaturedProducts() async {
    try {
      // Fetch products
      final products = await _productRepository.getFeaturedProducts();
      return products;
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }

  ///Get the product price or price range for variations.
  String getProductPrice(ProductModel product) {
    double smallestPrice = double.infinity;
    double largestPrice = 0.0;

    // If no variations exists, return the simple price or sale price
    if (product.productType == ProductType.single.toString()) {
      return (product.salePrice > 0.0 ? product.salePrice : product.price)
          .toString();
    } else {
      // Calculate the smallest and largest prices among variations
      for (var variation in product.productVariations!) {
        //Determine price to consider (sale price if available, otherwise regular price)
        double priceToConsider =
            variation.salePrice > 0.0 ? variation.salePrice : variation.price;

        //update smallest and largest price
        if (priceToConsider < smallestPrice) {
          smallestPrice = priceToConsider;
        }

        if (priceToConsider > largestPrice) {
          largestPrice = priceToConsider;
        }
      }

      //If Smallest and largest prices are the same, return a single price
      if (smallestPrice.isEqual(largestPrice)) {
        return largestPrice.toString();
      } else {
        return '$smallestPrice - \$$largestPrice';
      }
    }
  }

  ///Calculate discount percentage
  String? calculateSalePercentage(double originalPrice, double? salePrice) {
    if (salePrice == null || salePrice <= 0.0) return null;
    if (originalPrice <= 0) return null;

    double percentage = ((originalPrice - salePrice) / originalPrice) * 100;
    return percentage.toStringAsFixed(0);
  }

  ///Get Product Stock Status
  String getProductStockStatus(int stock) {
    return stock > 0 ? 'In Stock' : 'Out of Stock';
  }
}

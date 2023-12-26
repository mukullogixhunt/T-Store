import 'package:t_store/features/shop/models/banner_model.dart';
import 'package:t_store/utils/constants/image_strings.dart';

import '../../features/shop/models/category_model.dart';
import '../../routes/routes.dart';

class TDummyData {
  /// --- Banners
  static final List<BannerModel> banners = [
    BannerModel(imageUrl: TImages.banner1,targetScreen: TRoutes.order,active: false),
    BannerModel(imageUrl: TImages.banner2,targetScreen: TRoutes.cart,active: true),
    BannerModel(imageUrl: TImages.banner3,targetScreen: TRoutes.favourites,active: true),
    BannerModel(imageUrl: TImages.banner4,targetScreen: TRoutes.search,active: true),
    BannerModel(imageUrl: TImages.banner5,targetScreen: TRoutes.settings,active: true),
    BannerModel(imageUrl: TImages.banner6,targetScreen: TRoutes.userAddress,active: true),
    BannerModel(imageUrl: TImages.banner7,targetScreen: TRoutes.search,active: true),
    BannerModel(imageUrl: TImages.banner8,targetScreen: TRoutes.checkout,active: false),
  ];

  /// --- List of All Categories

  static final List<CategoryModel> categories = [
    CategoryModel(
        id: '1', name: 'Sports', image: TImages.sportIcon, isFeatured: true),
    CategoryModel(
        id: '5',
        name: 'Furniture',
        image: TImages.furnitureIcon,
        isFeatured: true),
    CategoryModel(
        id: '2',
        name: 'Electronics',
        image: TImages.electronicsIcon,
        isFeatured: true),
    CategoryModel(
        id: '3', name: 'Clothes', image: TImages.clothIcon, isFeatured: true),
    CategoryModel(
        id: '4', name: 'Animals', image: TImages.animalIcon, isFeatured: true),
    CategoryModel(
        id: '6', name: 'Shoes', image: TImages.shoeIcon, isFeatured: true),
    CategoryModel(
        id: '7',
        name: 'Cosmetics',
        image: TImages.cosmeticsIcon,
        isFeatured: true),
    CategoryModel(
        id: '14',
        name: 'Jewellery',
        image: TImages.jeweleryIcon,
        isFeatured: true),

    ///subCategories
    CategoryModel(
        id: '8',
        name: 'Sport Shoes',
        image: TImages.sportIcon,
        parentId: '1',
        isFeatured: false),
    CategoryModel(
        id: '9',
        name: 'Track Suits',
        image: TImages.sportIcon,
        parentId: '1',
        isFeatured: false),
    CategoryModel(
        id: '10',
        name: 'Sports Equipments',
        image: TImages.sportIcon,
        parentId: '1',
        isFeatured: false),

    //Furniture
    CategoryModel(
        id: '11',
        name: 'Bedroom furniture',
        image: TImages.sportIcon,
        parentId: '5',
        isFeatured: false),
    CategoryModel(
        id: '12',
        name: 'Kitchen furniture',
        image: TImages.sportIcon,
        parentId: '5',
        isFeatured: false),
    CategoryModel(
        id: '13',
        name: 'Office furniture',
        image: TImages.sportIcon,
        parentId: '5',
        isFeatured: false),

    //Electronics
    CategoryModel(
        id: '14',
        name: 'Laptop',
        image: TImages.electronicsIcon,
        parentId: '2',
        isFeatured: false),
    CategoryModel(
        id: '15',
        name: 'Mobile',
        image: TImages.electronicsIcon,
        parentId: '2',
        isFeatured: false),

    CategoryModel(
        id: '16',
        name: 'Shirts',
        image: TImages.clothIcon,
        parentId: '3',
        isFeatured: false),
  ];
}

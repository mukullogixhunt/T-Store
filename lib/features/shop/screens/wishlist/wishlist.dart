import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/app_bar/app_bar.dart';
import 'package:t_store/common/widgets/icons/t_circular_icon.dart';
import 'package:t_store/common/widgets/layouts/grid_layout.dart';
import 'package:t_store/features/shop/models/product_model.dart';
import 'package:t_store/features/shop/screens/home/home.dart';
import 'package:t_store/utils/constants/sizes.dart';

import '../../../../common/widgets/products/product_cards/product_card_vertical.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: TAppBar(
        title: SizedBox(width:double.infinity,child: Text('Wishlist',style: Theme.of(context).textTheme.headlineMedium)),
        actions:  [
          TCircularIcon(icon: Iconsax.add,onPressed: ()=> Get.to(const HomeScreen())),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
            TGridLayout(itemCount: 6, itemBuilder: (_, index) =>  TProductCardVertical(product: ProductModel.empty()))
            ],
          ),
        ),
      ),
    );
  }
}

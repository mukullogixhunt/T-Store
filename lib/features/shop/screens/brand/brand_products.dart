import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/brands/brand_card.dart';
import 'package:t_store/utils/constants/sizes.dart';

import '../../../../common/widgets/app_bar/app_bar.dart';
import '../../../../common/widgets/products/sortable/sortable_products.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: SizedBox(
            width: double.infinity,
            child:
                Text('Nike', style: Theme.of(context).textTheme.headlineSmall)),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              ///Brand Details
              TBrandCard(showBorder: true),
              SizedBox(height: TSizes.spaceBtwSections),
              TSortableProducts(),
            ],
          ),
        ),
      ),
    );
  }
}

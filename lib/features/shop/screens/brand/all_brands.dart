import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/brands/brand_card.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/utils/constants/sizes.dart';

import '../../../../common/widgets/app_bar/app_bar.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import 'brand_products.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: SizedBox(
            width: double.infinity,
            child: Text('Brands',
                style: Theme.of(context).textTheme.headlineSmall)),
      ),
    body: SingleChildScrollView(
      child: Padding(padding: const EdgeInsets.all(TSizes.defaultSpace),
      child:Column(
        children: [
          ///Headings
          const TSectionHeading(title: 'Brands',showActionButton: false,),
          const SizedBox(height: TSizes.spaceBtwItems),

          ///Brands
          TGridLayout(itemCount: 10, mainAxisExtent: 80,itemBuilder: (context,index)=>  TBrandCard(showBorder: true ,onTap: () => Get.to(()=> const BrandProducts()),)),
        ],
      )
        ,
      ),
    )
    );
  }
}

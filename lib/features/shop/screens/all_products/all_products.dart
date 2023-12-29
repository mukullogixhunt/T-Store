import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/shimmer/vertical_product_shimmer.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/cloud_helper_functions.dart';

import '../../../../common/widgets/app_bar/app_bar.dart';
import '../../../../common/widgets/products/sortable/sortable_products.dart';
import '../../controllers/all_product_controller.dart';
import '../../models/product_model.dart';

class AllProductsScreen extends StatelessWidget {
  const AllProductsScreen(
      {super.key, required this.title, this.query, this.futureMethod});

  final String title;
  final Query? query;
  final Future<List<ProductModel>>? futureMethod;

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(AllProductsController());
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: SizedBox(
            width: double.infinity,
            child: Text(title, style: Theme.of(context).textTheme.headlineSmall)),
      ),
      body:  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: FutureBuilder(future: futureMethod ?? controller.fetchProductQuery(query),
              builder: (context,snapshot) {

              //Check the state of FutureBuilder Snapshot
                const loader = TVerticalProductShimmer();
                /*if(snapshot.connectionState == ConnectionState.waiting){
                  return loader;
                }

                if(snapshot.hasData || snapshot.data == null || snapshot.data!.isEmpty){
                  return Center(child: Text('No Data Found!', style: Theme.of(context).textTheme.bodyMedium));
                }

                if(snapshot.hasError){
                  return Center(child: Text('Something went wrong.', style: Theme.of(context).textTheme.bodyMedium));
                }*/

                final widget = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot,loader: loader);

                //Return appropriate widget based on snap shot state
                if(widget != null) return widget;

                // products found!
                final products = snapshot.data!;

              return  TSortableProducts(products: products);
            }),
        ),
      ),
    );
  }
}

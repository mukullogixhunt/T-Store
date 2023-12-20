import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/features/personalization/screens/address/add_new_address.dart';
import 'package:t_store/features/personalization/screens/address/widgets/single_address.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';

import '../../../../common/widgets/app_bar/app_bar.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () => Get.to(() => const AddNewAddressScreen()),
          backgroundColor: TColors.primary,
          child: const Icon(Iconsax.add, color: TColors.white)),
      appBar: TAppBar(
        showBackArrow: true,
        title: SizedBox(
            width: double.infinity,
            child: Text('Address',
                style: Theme.of(context).textTheme.headlineSmall)),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
                    TSingleAddress(selectedAddress: false),
                    TSingleAddress(selectedAddress: true),
            ],
          ),
        ),
      ),
    );
  }
}

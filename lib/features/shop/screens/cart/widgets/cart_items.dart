import 'package:flutter/material.dart';

import '../../../../../common/widgets/products/cart/add_remove_button.dart';
import '../../../../../common/widgets/products/cart/cart_item.dart';
import '../../../../../common/widgets/products/product_cards/product_price_text.dart';
import '../../../../../utils/constants/sizes.dart';

class TCartItems extends StatelessWidget {
  const TCartItems({super.key, this.showAddRemoveButtons = true});

  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 2,
      separatorBuilder: (_, __) =>
          const SizedBox(height: TSizes.spaceBtwSections),
      itemBuilder: (_, index) =>  Column(
        children: [
          ///Cart Items
          const TCartItem(),

          if(showAddRemoveButtons) const SizedBox(height: TSizes.spaceBtwItems),

          ///Add Remove Button With Total Price
          if(showAddRemoveButtons) const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ///Extra Space
                  SizedBox(width: 70),

                  ///Add Remove Buttons
                  TProductQuantityWithAddRemoveButton(),
                ],
              ),
              TProductPriceText(price: '256'),
            ],
          ),
        ],
      ),
    );
  }
}

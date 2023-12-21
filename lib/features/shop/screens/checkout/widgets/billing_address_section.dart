import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/sizes.dart';

import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../utils/constants/colors.dart';

class TBillingAddressSection extends StatelessWidget {
  const TBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TSectionHeading(
            title: 'Shipping Address', buttonTitle: 'Change', onPressed: () {}),
        Text('Mukul Agrawal', style: Theme.of(context).textTheme.bodyLarge),
        const SizedBox(width: TSizes.spaceBtwItems / 2),
        Row(
          children: [
            const Icon(Icons.phone, color: TColors.darkGrey, size: 16),
            const SizedBox(width: TSizes.spaceBtwItems),
            Text('+91-790-995-1312',
                style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(width: TSizes.spaceBtwItems / 2),
        Row(
          children: [
            const Icon(Icons.location_history, color: TColors.darkGrey, size: 16),
            const SizedBox(width: TSizes.spaceBtwItems),
            Expanded(
                child: Text('South Liana, Maine 87695, USA',
                    style: Theme.of(context).textTheme.bodyMedium,
                    softWrap: true)),
          ],
        ),
      ],
    );
  }
}

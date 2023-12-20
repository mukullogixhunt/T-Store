import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/app_bar/app_bar.dart';
import 'package:t_store/features/shop/screens/product_reviews/widgets/rating_progress_indicator.dart';
import 'package:t_store/features/shop/screens/product_reviews/widgets/user_review_card.dart';
import 'package:t_store/utils/constants/sizes.dart';

import '../../../../common/widgets/products/ratings/rating_indicator.dart';

class ProductReviewScreen extends StatelessWidget {
  const ProductReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      /// --- App Bar
      appBar:
          const TAppBar(title: Text('Reviews & Ratings'), showBackArrow: true),

      /// --- Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                  "Rating and reviews are verified and are from people who use the same type of device that you use."),
              const SizedBox(height: TSizes.spaceBtwItems),

              ///Overall Product Rating
              const TOverallProductRating(),
              const TRatingBarIndicator(rating: 3.5),
              Text('12,615',style: Theme.of(context).textTheme.bodySmall,),
              const SizedBox(height: TSizes.spaceBtwSections),

              ///List of reviews
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),
            ],
          ),
        ),
      ),
    );
  }
}







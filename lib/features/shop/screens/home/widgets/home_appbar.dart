import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/features/personalization/controllers/user_controller.dart';

import '../../../../../common/widgets/app_bar/app_bar.dart';
import '../../../../../common/widgets/products/cart/cart_menu_icon.dart';
import '../../../../../common/widgets/shimmer/shimmer.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/text_strings.dart';

class THomeAppBar extends StatelessWidget {
  const THomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return TAppBar(
      title: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(TTexts.homeAppbarTitle,
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .apply(color: TColors.grey)),
            Obx(
              () {
                if(controller.profileLoading.value){
                  //Display a shimmer loader while user profile is being loaded
                  return const TShimmerEffect(width: 80,height: 15);
                }else{
                  return Text(controller.user.value.fullName,
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .apply(color: TColors.white));
                }

              },
            ),
          ],
        ),
      ),
      actions: [
        TCartCounterIcon(
          iconColor: TColors.white,
          onPressed: () {},
        )
      ],
    );
  }
}

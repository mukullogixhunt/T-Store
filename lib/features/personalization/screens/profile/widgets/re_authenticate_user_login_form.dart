import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/features/personalization/controllers/user_controller.dart';
import 'package:t_store/utils/constants/sizes.dart';

import '../../../../../common/widgets/app_bar/app_bar.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/validators/validation.dart';

class ReAuthLoinForm extends StatelessWidget {
  const ReAuthLoinForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      /// Custom App Bar
      appBar: TAppBar(
        showBackArrow: true,
        title: SizedBox(
          width: double.infinity,
          child: Text('Re-Authenticate User', style: Theme.of(context).textTheme.headlineSmall),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Form(
          key: controller.reAuthFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Email
              TextFormField(
                controller: controller.verifyEmail,
                validator: (value) => TValidator.validateEmail(value),
                decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.direct_right),
                    labelText: TTexts.email),
              ),
              const SizedBox(
                height: TSizes.spaceBtwInputFields,
              ),

              ///Password
              Obx(() => TextFormField(
                  expands: false,
                  validator: (value) =>
                      TValidator.validateEmptyText('Password', value),
                  controller: controller.verifyPassword,
                  obscureText: controller.hidePassword.value,
                  decoration: InputDecoration(
                    labelText: TTexts.password,
                    prefixIcon: const Icon(Iconsax.password_check),
                    suffixIcon: IconButton(
                      onPressed: () => controller.hidePassword.value =
                      !controller.hidePassword.value,
                      icon: Icon(controller.hidePassword.value
                          ? Iconsax.eye_slash
                          : Iconsax.eye),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              ///Sign In
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () =>  controller.reAuthenticateEmailAndPassword(),
                      child: const Text('Verify'))),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
            ],
          ),
        ),),
      ),
    );
  }
}

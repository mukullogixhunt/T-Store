import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/data/repositories/authentication/authentication_repository.dart';
import 'package:t_store/features/authentication/screens/password_configuration/reset_password.dart';

import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/helpers/network_manager.dart';
import '../../../../utils/popups/full_screen_loader.dart';
import '../../../../utils/popups/loaders.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  /// Variable
  final email = TextEditingController(); //Controller for email input
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  /// Send Reset Password Email
  sendPasswordResetEmail() async {
    try {

      //Start Loading
      TFullScreenLoader.openLoadingDialog('Processing your request...', TImages.docerAnimations);

      //Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!forgetPasswordFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Send Email to Reset Password
      await AuthenticationRepository.instance.sendPasswordResetEmail(email.text.trim());

      //Remove Loader
      TFullScreenLoader.stopLoading();

      //Show Success Message
      TLoaders.successSnackBar(title: 'Email Sent',message: 'Email Link Sent to Reset your Password'.tr);

      //Move to Verify Email Screen
      Get.to(() => ResetPasswordScreen(email: email.text.trim()));

    } catch (e) {
      //Remove Loader
      TFullScreenLoader.stopLoading();
      //Show some generic Error to the User
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  /// Resend Reset Password Email
  resendPasswordResetEmail(String email) async {
    try {

      //Start Loading
      TFullScreenLoader.openLoadingDialog('Processing your request...', TImages.docerAnimations);

      //Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Send Email to Reset Password
      await AuthenticationRepository.instance.sendPasswordResetEmail(email);

      //Remove Loader
      TFullScreenLoader.stopLoading();

      //Show Success Message
      TLoaders.successSnackBar(title: 'Email Sent',message: 'Email Link Sent to Reset your Password'.tr);


    } catch (e) {
      //Remove Loader
      TFullScreenLoader.stopLoading();
      //Show some generic Error to the User
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}

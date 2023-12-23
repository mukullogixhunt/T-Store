import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/data/repositories/authentication/authentication_repository.dart';
import 'package:t_store/data/repositories/user/user_repository.dart';
import 'package:t_store/features/authentication/screens/signup/verify_email.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/popups/loaders.dart';

import '../../../../utils/helpers/network_manager.dart';
import '../../../../utils/popups/full_screen_loader.dart';
import '../../../personalization/models/user_model.dart';


class SignupController extends GetxController{
  static SignupController get instance => Get.find();

  /// Variable
  final hidePassword = true.obs; // Observable for hiding / showing password
  final privacyPolicy = true.obs; // Observable for privacy Policy
  final firstName = TextEditingController(); //Controller for firstName input
  final lastName = TextEditingController(); //Controller for lastName input
  final userName = TextEditingController(); //Controller for userName input
  final email = TextEditingController(); //Controller for email input
  final phoneNumber = TextEditingController(); //Controller for phoneNumber input
  final password = TextEditingController(); //Controller for password input
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  ///Signup
  void signUp() async{
    try{
      //Start Loading
      TFullScreenLoader.openLoadingDialog('We are processing your information...', TImages.docerAnimations);

      //Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected) return;


      // Form Validation
      if(signupFormKey.currentState!.validate()) return;

      //Privacy Policy Check
      if(!privacyPolicy.value){
        TLoaders.warningSnackBar(title: 'Accept Privacy Policy',message: 'In order to create account, you must have to read and accept the privacy policy & Terms of Use. ');
        return;
      }

      //Register user in Firebase Authentication &  Save user data in the Firebase
      final userCredential = await AuthenticationRepository.instance.registerWithEmailAndPassword(email.text.trim(), password.text.trim());

      //Save Authenticated user data in Firebase Firestore
      final newUser = UserModel(
        id : userCredential.user!.uid,
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        userName: userName.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: '',
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      //Remove Loader
      TFullScreenLoader.stopLoading();

      //Show Success Message
      TLoaders.successSnackBar(title: 'Congratulations',message: 'Your account has been created! Verify email to continue.');

      //Move to Verify Email Screen
      Get.to(()=> const VerifyEmailScreen());


    }catch(e){
      //Remove Loader
      TFullScreenLoader.stopLoading();

      //Show some generic Error to the User
      TLoaders.errorSnackBar(title: 'Oh Snap!',message: e.toString());

    }/*finally{
      //Remove Loader
      TFullScreenLoader.stopLoading();
    }*/
  }

}
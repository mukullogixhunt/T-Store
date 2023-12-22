import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app.dart';
import 'data/repositories/authentication/authentication_repository.dart';
import 'firebase_options.dart';

Future<void> main() async {

  /// --- Widgets binding
  final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  ///--- Initialize GetX Local Storage
  await GetStorage.init();

  ///--- Await Native Splash
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  ///--- Initialize Firebase & Auth Repository
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then(
          (FirebaseApp value) => Get.put(AuthenticationRepository()),
  );

  ///Load all the Material Design / Themes / Localizations / Bindings
  runApp(const App());
}

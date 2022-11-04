import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:softina/routes/app_pages.dart';
import 'package:softina/services/device_status_service.dart';
import 'package:softina/services/path_service.dart';
import 'package:softina/services/simcard_service.dart';
import 'providers/news_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Get.putAsync((() => PathService().init()));
  await Get.putAsync(() => NewsApiClient().init());
  await Get.putAsync(() => DeviceStatuService().init());
  await Get.putAsync(() => SimCardService().init());

  runApp(
    GetMaterialApp(
      title: "Clic",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
    ),
  );
}

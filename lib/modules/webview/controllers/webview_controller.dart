import 'dart:async';
import 'package:get/get.dart';
import 'package:softina/services/path_service.dart';

class WebviewsController extends GetxController {
  final String path = Get.find<PathService>().getCurrentPath;
  final bool isShare = Get.find<PathService>().isShareIn;

  @override
  Future<void> onInit() async {
    super.onInit();
  }

  // save path to async if webview is succesfully opened
  savePath() async {
    if (!isShare) {
      return await Get.find<PathService>().savePath(path);
    }
  }
}

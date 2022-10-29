import 'dart:io';
import 'package:get/get.dart';
import 'package:softina/services/path_service.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewController extends GetxController {
  Rx<String> url = "".obs;
  final String path = Get.find<PathService>().getCurrentPath;
  final bool isShare = Get.find<PathService>().isShareIn;

  @override
  Future<void> onInit() async {
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
    url.value = path;
    savePath();
    super.onInit();
  }

  savePath() async {
    if (!isShare) {
      return await Get.find<PathService>().savePath(path);
    }
  }
}

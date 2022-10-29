import 'package:get/get.dart';
import 'package:softina/modules/webview/controllers/webview_controller.dart';

class WebViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WebviewController>(
      () => WebviewController(),
    );
  }
}

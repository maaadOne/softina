import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../controllers/webview_controller.dart';

class WebViewPage extends GetView<WebviewController> {
  const WebViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("WebView"),
      // ),
      body: SafeArea(
        child: WebView(
          initialUrl: controller.path,
          onWebViewCreated: (_) => controller.savePath(),
          onWebResourceError: (error) {
            debugPrint("print$error");
          },
        ),
      ),
    );
  }
}

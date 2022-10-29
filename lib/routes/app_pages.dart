import 'package:get/get.dart';

import '../middlewares/path_middleware.dart';
import '../modules/news/bindings/news_bindings.dart';
import '../modules/news/views/news_view.dart';
import '../modules/webview/bindings/webview_binding.dart';
import '../modules/webview/views/webview_page.dart';
import 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.INITIAL;

  static final routes = [
    GetPage(
      name: Routes.NEWS,
      page: () => const NewsView(),
      binding: NewsBinding(),
    ),
    GetPage(
        name: Routes.WEBVIEW,
        page: () => const WebViewPage(),
        binding: WebViewBinding(),
        middlewares: [
          PathMiddleware(),
        ]),
  ];
}

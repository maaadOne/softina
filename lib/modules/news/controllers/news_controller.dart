import 'package:get/get.dart';
import 'package:softina/repositories/news_repository.dart';

import '../../../common/ui.dart';
import '../../../models/news_model.dart';

class NewsController extends GetxController {
  NewsRepository? _newsRepository;

  final news = <Article>[].obs;

  NewsController() {
    _newsRepository = NewsRepository();
  }

  @override
  Future<void> onInit() async {
    await refreshPage();
    super.onInit();
  }

  Future refreshPage({bool showMessage = false}) async {
    await getTopNews();
    if (showMessage) {
      Get.showSnackbar(Ui.SuccessSnackBar(
          message: "Top Header News refreshed successfully"));
    }
  }

  Future getTopNews() async {
    try {
      news.assignAll(await _newsRepository!.getTopNews());
    } catch (e) {
      Get.showSnackbar(Ui.ErrorSnackBar(message: e.toString()));
    }
  }
}

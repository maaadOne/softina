import 'package:get/get.dart';
import '../models/news_model.dart';
import '../providers/news_provider.dart';

class NewsRepository {
  NewsApiClient? _laravelApiClient;

  NewsRepository() {
    _laravelApiClient = Get.find<NewsApiClient>();
  }

  // gets news from news_provider
  Future<List<Article>> getTopNews() {
    return _laravelApiClient!.getTopNews();
  }
}

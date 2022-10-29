import 'package:dio_http_cache/dio_http_cache.dart';
import '../models/news_model.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/foundation.dart' as foundation;

class NewsApiClient extends GetxService {
  dio.Dio? _httpClient;
  String? baseUrl;
  dio.Options? _optionsNetwork;
  dio.Options? _optionsCache;

  NewsApiClient() {
    _httpClient = dio.Dio();
  }

  Future<NewsApiClient> init() async {
    if (foundation.kIsWeb || foundation.kDebugMode) {
      _optionsNetwork = dio.Options();
      _optionsCache = dio.Options();
    } else {
      _optionsNetwork =
          buildCacheOptions(const Duration(days: 3), forceRefresh: true);

      _optionsCache =
          buildCacheOptions(const Duration(minutes: 10), forceRefresh: false);
    }
    return this;
  }

  // for refres pupropes
  void forceRefresh({Duration duration = const Duration(minutes: 10)}) {
    if (!foundation.kDebugMode) {
      _optionsCache = dio.Options();
    }
  }

  void unForceRefresh({Duration duration = const Duration(minutes: 10)}) {
    if (!foundation.kDebugMode) {
      _optionsCache = buildCacheOptions(duration, forceRefresh: false);
    }
  }

  Future<List<Article>> getTopNews() async {
    var response = await _httpClient!.get(
        "https://newsapi.org/v2/top-headlines?country=us&category=sports&apiKey=bb07cbd6779242d9973a3f15e55e7f3c");
    if (response.statusCode == 200) {
      return response.data['articles']
          .map<Article>((obj) => Article.fromJson(obj))
          .toList();
    } else {
      throw Exception(response.data['message']);
    }
  }
}

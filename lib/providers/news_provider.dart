import 'package:dio_http_cache/dio_http_cache.dart';

import '../models/news_model.dart';
import 'api_provider.dart';
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

  String getBaseUrl(String path) {
    if (!path.endsWith('/')) {
      path += '/';
    }
    if (path.startsWith('/')) {
      path = path.substring(1);
    }
    if (!baseUrl!.endsWith('/')) {
      return '${baseUrl!}/$path';
    }
    return baseUrl! + path;
  }

  String getApiBaseUrl(String path) {
    String _apiPath = "https://newsapi.org/v2/";
    if (path.startsWith('/')) {
      return getBaseUrl(_apiPath) + path.substring(1);
    }
    return getBaseUrl(_apiPath) + path;
  }

  // Uri getApiBaseUri(String path) {
  //   return Uri.parse(getApiBaseUrl(path));
  // }

  Future<NewsApiClient> init() async {
    if (foundation.kIsWeb || foundation.kDebugMode) {
      _optionsNetwork = dio.Options();
      _optionsCache = dio.Options();
    } else {
      _optionsNetwork =
          buildCacheOptions(const Duration(days: 3), forceRefresh: true);

      _optionsCache =
          buildCacheOptions(const Duration(minutes: 10), forceRefresh: false);
      _httpClient!.interceptors.add(
          DioCacheManager(CacheConfig(baseUrl: getApiBaseUrl(""))).interceptor);
    }
    return this;
  }

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

  // "https://newsapi.org/v2/top-headlines?country=ru&category=sports&apiKey=bb07cbd6779242d9973a3f15e55e7f3c"
  Future<List<Article>> getTopNews() async {
    // Uri uri = Uri.http('https://newsapi.org/v2',
    //     '/top-headlines?country=ru&category=sports&apiKey=bb07cbd6779242d9973a3f15e55e7f3c');
    // Get.log(uri.toString());
    // print(uri.host);
    var response = await _httpClient!.get(
        "https://newsapi.org/v2/top-headlines?country=us&category=sports&apiKey=bb07cbd6779242d9973a3f15e55e7f3c");
    print(response.data["articles"]);

    // // var response = await _httpClient!.getUri(uri);
    if (response.statusCode == 200) {
      // print(response.data["articles"]);
      // return response.data["articles"];
      return response.data['articles']
          .map<Article>((obj) => Article.fromJson(obj))
          .toList();
    } else {
      throw Exception(response.data['message']);
    }
  }
}

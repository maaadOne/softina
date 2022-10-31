import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:softina/modules/news/controllers/news_controller.dart';
import 'package:softina/providers/news_provider.dart';

class NewsView extends GetView<NewsController> {
  const NewsView({super.key});

  // bb07cbd6779242d9973a3f15e55e7f3c

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        var _news = controller.news;
        if (_news.isEmpty) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          return Scaffold(
            appBar: AppBar(
              title: Text("Top Header News"),
            ),
            body: RefreshIndicator(
              onRefresh: () async {
                Get.find<NewsApiClient>().forceRefresh();
                controller.refreshPage(showMessage: true);
                Get.find<NewsApiClient>().unForceRefresh();
              },
              child: ListView.separated(
                itemCount: controller.news.length,
                itemBuilder: (context, index) {
                  var singleNews = controller.news[index];
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 100,
                        width: 100,
                        child: singleNews.urlToImage == null
                            ? const Icon(Icons.abc_outlined)
                            : Image.network(singleNews.urlToImage!),
                      ),
                      const SizedBox(width: 10),
                      Flexible(
                          child: singleNews.title == null
                              ? const Text("No desctiption")
                              : Text(singleNews.title!)),
                    ],
                  );
                },
                separatorBuilder: ((context, index) {
                  return const Divider();
                }),
              ),
            ),
          );
        }
      },
    );
  }
}

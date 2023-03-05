import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app_task/interface/screens/launcher_screen/tabs/home_tab/service/home_service.dart';
import 'package:news_app_task/source/models/model_news_article.dart';
import 'package:news_app_task/utils/tools/enums.dart';

class HomeViewModel extends GetxController {
  TextEditingController searchTextCtrl = TextEditingController();
  RxList<NewsArticles> newsModel = <NewsArticles>[].obs;
  RxList<NewsArticles> dummyNewsModel = <NewsArticles>[].obs;

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  listTileNewsCardOnTap(NewsArticles? modelOfNews) => Get.toNamed(IRoutes.detail.path, arguments: modelOfNews);

  seachTextFieldOnChanged(String? value) {
    filterSearchText(query: value);
  }

  fetchData() async {
    await ServiceOfHome.shared.getNews(country: ApiCountryQuerry.us).then(
          (value) => {
            newsModel.addAll((value.articles ?? []).toList()),
            dummyNewsModel.addAll((value.articles ?? []).toList()),
            update(),
          },
        );
  }

  filterSearchText({String? query}) {
    List<NewsArticles> dummySearchList = [];
    dummySearchList.addAll(newsModel);
    if (query != null) {
      if (query.isNotEmpty) {
        List<NewsArticles> dummyQueryNews = [];
        for (var k in dummySearchList) {
          if (k.title!.toLowerCase().toString().contains(query.toLowerCase())) {
            dummyQueryNews.add(k);
          }
        }
        dummyNewsModel.clear();
        dummyNewsModel.addAll(dummyQueryNews);
      } else {
        dummyNewsModel.clear();
        dummyNewsModel.addAll(newsModel);
      }
    }
  }
}

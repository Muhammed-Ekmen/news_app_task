import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app_task/interface/screens/launcher_screen/tabs/home_tab/service/home_service.dart';
import 'package:news_app_task/source/models/model_news_article.dart';
import 'package:news_app_task/utils/tools/enums.dart';

class HomeViewModel extends GetxController {
  TextEditingController searchTextCtrl = TextEditingController();
  bottomNavigationBarOnTap(int index) {}
  listTileNewsCardOnTap(NewsArticles? modelOfNews) => Get.toNamed(IRoutes.detail.path, arguments: modelOfNews);
  seachTextFieldOnChanged(String? value) {}
  RxList<NewsArticles> newsModel = <NewsArticles>[].obs;

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  fetchData() async {
    await ServiceOfHome.shared.getNews(country: ApiCountryQuerry.us).then((value) => {newsModel.addAll((value.articles ?? []).toList()), update()});
  }

  // final duplicateItems = List<String>.generate(10000, (i) => "Eleman $i");
  // var items = [];

  // filterSearchResults(String query) {
  //   List<String> dummySearchList = [];
  //   dummySearchList.addAll(duplicateItems);
  //   if (query.isNotEmpty) {
  //     List<String> dummyListData = [];
  //     for (var item in dummySearchList) {
  //       if (item.contains(query)) {
  //         dummyListData.add(item);
  //       }
  //     }
  //     items.clear();
  //     items.addAll(dummyListData);
  //     return;
  //   } else {
  //     items.clear();
  //     items.addAll(duplicateItems);
  //   }
  // }
}

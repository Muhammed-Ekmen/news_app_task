import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app_task/source/models/model_news_article.dart';
import 'package:news_app_task/utils/helper/supervisor.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsSourceViewModel extends GetxController with Supervizor {
  WebViewController webViewCtrl = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(const Color(0x00000000))
    ..setNavigationDelegate(NavigationDelegate());

  @override
  void onInit() {
    getReadyToWebView();
    super.onInit();
  }

  getReadyToWebView() async {
    NewsArticles? dummyModel = Get.arguments as NewsArticles;
    await Future.microtask(() {
      nillable(
        willCheck: dummyModel,
        nill: webViewCtrl.loadRequest(Uri.parse("https://flutter.dev")),
        notNil: webViewCtrl.loadRequest(Uri.parse("${dummyModel.url}")),
      );
    });
  }
}

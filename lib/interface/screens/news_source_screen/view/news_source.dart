import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app_task/interface/screens/news_source_screen/view_model/news_source_view_model.dart';
import 'package:news_app_task/source/constants/const_texts.dart';
import 'package:news_app_task/source/models/model_news_article.dart';
import 'package:news_app_task/utils/helper/snail_shell.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsSourceView extends StatelessWidget with SnailShell {
  NewsSourceView({super.key, this.modelOfNews});
  final NewsSourceViewModel _newsSourceViewModel = Get.put(NewsSourceViewModel());
  final NewsArticles? modelOfNews;
  @override
  Widget build(BuildContext context) => SafeArea(child: Scaffold(appBar: _appBar, body: _webViewBody));

  AppBar get _appBar => AppBar(title: Text(IConstTexts.shared.newsSource), centerTitle: true);

  SizedBox get _webViewBody => SizedBox(
        width: Get.width,
        height: Get.height,
        child: WebViewWidget(controller: _newsSourceViewModel.webViewCtrl),
      );
}

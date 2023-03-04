import 'package:get/get.dart';
import 'package:news_app_task/source/models/model_news_article.dart';
import 'package:news_app_task/utils/tools/enums.dart';

class FavoritesViewModel extends GetxController {
  listTileNewsCardOnTap(NewsArticles? modelOfNews) => Get.toNamed(IRoutes.detail.path, arguments: modelOfNews);

  RxList<NewsArticles> listOfFavoriteNews = <NewsArticles>[].obs;
}

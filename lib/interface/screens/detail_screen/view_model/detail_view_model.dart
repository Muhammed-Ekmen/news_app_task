import 'package:get/get.dart';
import 'package:news_app_task/interface/screens/launcher_screen/tabs/favorites_tab/view_model/favorites_view_model.dart';
import 'package:news_app_task/source/models/model_news_article.dart';
import 'package:news_app_task/utils/helper/supervisor.dart';
import 'package:news_app_task/utils/tools/enums.dart';
import 'package:share_plus/share_plus.dart';

class DetailViewModel extends GetxController with Supervizor {
  @override
  void onInit() {
    checkFavoriteState(news: Get.arguments as NewsArticles);
    super.onInit();
  }

  RxBool addedFavorite = RxBool(false);

  backButtonOnTap() => Get.back();

  shareButtonOnTap() {
    NewsArticles? dummyNews = Get.arguments as NewsArticles;
    Share.share("${dummyNews.url}", subject: "Share");
  }

  addFavorite({NewsArticles? news}) {
    addedFavorite.value = true;
    if (news != null) {
      Get.find<FavoritesViewModel>().listOfFavoriteNews.add(news);
      addedFavorite.value = true;
    }
  }

  removeFavorite({NewsArticles? news}) {
    if (news != null) {
      int newsIndex = Get.find<FavoritesViewModel>().listOfFavoriteNews.indexWhere((element) => element.title == news.title);
      Get.find<FavoritesViewModel>().listOfFavoriteNews.removeAt(newsIndex);
      addedFavorite.value = false;
    }
  }

  newsSourceButtonOnTap(NewsArticles? modelOfNews) => Get.toNamed(IRoutes.newsSource.path, arguments: modelOfNews);

  favoriteButtonOnTap() {
    NewsArticles? dummyNews = Get.arguments as NewsArticles;
    bool result = checkFavoriteState(news: dummyNews);
    if (result == true) {
      removeFavorite(news: dummyNews);
    }
    if (result == false) {
      addFavorite(news: dummyNews);
    }
  }

  checkFavoriteState({NewsArticles? news}) {
    List<NewsArticles> dummyFavorites = Get.find<FavoritesViewModel>().listOfFavoriteNews;
    if (dummyFavorites.isEmpty) {
      //NOT Exist
      addedFavorite.value = false;
      return false;
    } else {
      //EXIST
      bool result = dummyFavorites.contains(news);
      if (result == true) {
        addedFavorite.value = true;
        return true;
      } else {
        addedFavorite.value = false;
        return false;
      }
    }
  }
}

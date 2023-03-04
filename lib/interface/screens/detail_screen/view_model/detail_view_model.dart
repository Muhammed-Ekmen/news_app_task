import 'package:get/get.dart';
import 'package:news_app_task/interface/screens/launcher_screen/tabs/favorites_tab/view_model/favorites_view_model.dart';
import 'package:news_app_task/source/models/model_news_article.dart';
import 'package:news_app_task/utils/tools/enums.dart';
import 'package:share_plus/share_plus.dart';

class DetailViewModel extends GetxController {
  RxBool addedFavorite = RxBool(false);
  backButtonOnTap() => Get.back();
  shareButtonOnTap() {
    NewsArticles? dummyNews = Get.arguments as NewsArticles;
    Share.share("${dummyNews.url}", subject: "Share");
  }

  favoriteButtonOnTap() {
    NewsArticles? dummyNews = Get.arguments as NewsArticles;
    RxList<NewsArticles> dummyFavoriteList = Get.find<FavoritesViewModel>().listOfFavoriteNews;
    if (dummyFavoriteList.isEmpty) {
      dummyFavoriteList.add(dummyNews);
      addedFavorite.value = true;
    } else {
      var isExist = checkingFavoriteList();
      if (isExist == true) {
        //EXISTS
        int willDeleteIndex = dummyFavoriteList.indexWhere((element) => element.author == dummyNews.author);
        dummyFavoriteList.removeAt(willDeleteIndex);
        addedFavorite.value = false;
      } else {
        // NOT EXIST
        dummyFavoriteList.add(dummyNews);
        addedFavorite.value = true;
      }
    }
  }

  newsSourceButtonOnTap(NewsArticles? modelOfNews) => Get.toNamed(IRoutes.newsSource.path, arguments: modelOfNews);

  checkingFavoriteList() {
    NewsArticles? dummyNews = Get.arguments as NewsArticles;
    for (var k in Get.find<FavoritesViewModel>().listOfFavoriteNews) {
      if (k.author != dummyNews.author) {
        addedFavorite.value = false;
        return false;
      } else {
        addedFavorite.value = true;
        return true;
      }
    }
  }

  @override
  void onInit() {
    checkingFavoriteList();
    super.onInit();
  }
}

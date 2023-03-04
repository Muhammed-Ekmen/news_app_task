import 'package:get/get.dart';
import 'package:news_app_task/interface/screens/launcher_screen/tabs/favorites_tab/view/favorites_view.dart';
import 'package:news_app_task/interface/screens/launcher_screen/tabs/home_tab/view/home_view.dart';

class LauncherViewModel extends GetxController {
  List tabs = [HomeView(), FavoritesView()];

  RxInt currentTabIndex = RxInt(0);

  launcherBottomNavigatorBarOnTap(int index) => currentTabIndex.value = index;

  // Rx<ModelOfNews?> modelOfNews = ModelOfNews(
  //   articles: [
  //     NewsArticles(
  //       author: "Sozcu",
  //       title: "Kılıçdaroğlu’ndan Akşener’e cevap: Kimse durduramaz - Sözcü",
  //       url: "https://news.google.com/rss/articles/CBMiXWh0dHBzOi8vd3d3LnNvemN1LmNvbS50ci8yMDIzL2d1bmRlbS9raWxpY2Rhcm9nbHUtc29mcmFtaXppLWJ1eXV0bWV5ZS1kZXZhbS1lZGVjZWdpei03NjEwMTc1L9IBYWh0dHBzOi8vd3d3LnNvemN1LmNvbS50ci8yMDIzL2d1bmRlbS9raWxpY2Rhcm9nbHUtc29mcmFtaXppLWJ1eXV0bWV5ZS1kZXZhbS1lZGVjZWdpei03NjEwMTc1L2FtcC8?oc=5",
  //       publishedAt: "2023-03-03T14:09:43Z",
  //       description: "description",
  //       urlToImage: "https://media.cnn.com/api/v1/images/stellar/prod/230215155112-file-warren-buffett.jpg?c=16x9&q=h_540,w_960,c_fill",
  //     ),
  //   ],
  // ).obs;
}

import 'package:get/get.dart';
import 'package:news_app_task/interface/screens/detail_screen/view/detail_view.dart';
import 'package:news_app_task/interface/screens/launcher_screen/view/launcher_view.dart';
import 'package:news_app_task/interface/screens/news_source_screen/view/news_source.dart';
import 'package:news_app_task/interface/screens/splash_screen/view/splash_view.dart';
import 'package:news_app_task/utils/tools/enums.dart';

abstract class BaseRoute {
  List<GetPage<dynamic>>? getPages = [
    GetPage(name: IRoutes.splash.path, page: () => SplashView()),
    GetPage(name: IRoutes.launcher.path, page: () => LauncherView()),
    GetPage(name: IRoutes.detail.path, page: () => DetailView(modelOfNews: Get.arguments)),
    GetPage(name: IRoutes.newsSource.path, page: () => NewsSourceView(modelOfNews: Get.arguments)),
  ];
}

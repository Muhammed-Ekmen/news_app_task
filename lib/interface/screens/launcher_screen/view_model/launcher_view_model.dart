import 'package:get/get.dart';
import 'package:news_app_task/interface/screens/launcher_screen/tabs/favorites_tab/view/favorites_view.dart';
import 'package:news_app_task/interface/screens/launcher_screen/tabs/home_tab/view/home_view.dart';

class LauncherViewModel extends GetxController {
  List tabs = [HomeView(), FavoritesView()];

  RxInt currentTabIndex = RxInt(0);

  launcherBottomNavigatorBarOnTap(int index) => currentTabIndex.value = index;
}

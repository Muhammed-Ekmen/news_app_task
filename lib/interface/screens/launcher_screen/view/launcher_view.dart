import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app_task/interface/screens/launcher_screen/view_model/launcher_view_model.dart';
import 'package:news_app_task/interface/widgets/bottom_navigator_bars/launcher_bottom_navigator_bar.dart';

class LauncherView extends StatelessWidget {
  LauncherView({super.key});
  final LauncherViewModel _launcherViewModel = Get.put(LauncherViewModel());
  @override
  Widget build(BuildContext context) => Obx(
        () => Scaffold(
          body: _launcherViewModel.tabs[_launcherViewModel.currentTabIndex.value],
          bottomNavigationBar: LauncherBottomNavigatorBar(
            onTap: _launcherViewModel.launcherBottomNavigatorBarOnTap,
            currentIndex: _launcherViewModel.currentTabIndex.value,
          ),
        ),
      );
}

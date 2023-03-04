import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app_task/utils/tools/enums.dart';

class LauncherBottomNavigatorBar extends StatelessWidget {
  const LauncherBottomNavigatorBar({super.key, this.onTap, required this.currentIndex});
  final void Function(int)? onTap;
  final int currentIndex;
  @override
  Widget build(BuildContext context) => BottomNavigationBar(
        currentIndex: currentIndex,
        elevation: 20,
        iconSize: Get.width / 20,
        backgroundColor: IColors.corduroy.apply,
        selectedLabelStyle: ITextStyles.short.apply.copyWith(fontWeight: FontWeight.bold),
        selectedItemColor: IColors.athenaGrey.apply,
        unselectedItemColor: IColors.athenaGrey.apply,
        onTap: onTap,
        items: LauncherTabs.values.map((e) => BottomNavigationBarItem(icon: e.getIcon, label: e.name)).toList(),
      );
}

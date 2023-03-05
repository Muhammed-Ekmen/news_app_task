import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app_task/utils/tools/enums.dart';

abstract class SnailShell {
  Container shellOfScrool({required List<Widget> children}) => Container(
        width: Get.width,
        margin: IMeasures.screenOrientation.adjust,
        child: CustomScrollView(slivers: [SliverFillRemaining(hasScrollBody: false, child: Column(children: children))]),
      );

  Padding shellOfWithOutScroll({required List<Widget> children}) => Padding(
        padding: IMeasures.screenOrientation.adjust,
        child: Column(children: children),
      );
}

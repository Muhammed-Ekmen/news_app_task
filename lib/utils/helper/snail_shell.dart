import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SnailShell {
  Container shellOfScrool({required List<Widget> children}) => Container(
        width: Get.width,
        margin: _screenOrientation,
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(hasScrollBody: false, child: Column(children: children)),
          ],
        ),
      );

  Padding shellOfWithOutScroll({required List<Widget> children}) => Padding(
        padding: _screenOrientation,
        child: Column(children: children),
      );

  EdgeInsetsGeometry get _screenOrientation => EdgeInsets.only(
        top: Get.height / 50,
        left: Get.width / 25,
        right: Get.width / 25,
      );
}

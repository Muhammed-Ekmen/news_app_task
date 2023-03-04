import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app_task/config/routes/app_routes.dart';
import 'package:news_app_task/config/theme/app_theme.dart';
import 'package:news_app_task/utils/tools/enums.dart';

void main(List<String> args) {
  runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget with Itheme, BaseRoute {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: baseTheme,
        getPages: getPages,
        initialRoute: IRoutes.splash.path,
      );
}

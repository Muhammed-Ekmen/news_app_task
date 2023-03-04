import 'package:flutter/material.dart';
import 'package:news_app_task/utils/tools/enums.dart';

abstract class Itheme {
  ThemeData baseTheme = ThemeData(appBarTheme: AppBarTheme(color: IColors.corduroy.apply, elevation: 0), iconTheme: IconThemeData(color: IColors.corduroy.apply), scaffoldBackgroundColor: IColors.athenaGrey.apply);
}

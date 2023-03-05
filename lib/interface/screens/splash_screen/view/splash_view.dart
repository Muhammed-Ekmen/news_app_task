import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app_task/interface/screens/splash_screen/view_model/splash_view_model.dart';
import 'package:news_app_task/source/constants/const_texts.dart';
import 'package:news_app_task/utils/tools/enums.dart';

class SplashView extends StatelessWidget {
  SplashView({super.key});
  // ignore: unused_field
  final SplashViewModel _splashViewModel = Get.put(SplashViewModel());
  @override
  Widget build(BuildContext context) => Scaffold(body: Center(child: _splashMessage));

  Text get _splashMessage => Text(
        IConstTexts.shared.newsApplication,
        style: ITextStyles.venti.apply.copyWith(color: IColors.corduroy.apply),
      );
}

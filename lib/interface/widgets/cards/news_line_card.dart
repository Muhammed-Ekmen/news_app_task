import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app_task/source/constants/const_texts.dart';
import 'package:news_app_task/source/models/model_news_article.dart';
import 'package:news_app_task/utils/tools/enums.dart';

class NewsLineCard extends StatelessWidget {
  const NewsLineCard({super.key, this.height, this.modelOfNews});
  final double? height;
  final NewsArticles? modelOfNews;
  @override
  Widget build(BuildContext context) => Container(
        height: height ?? Get.height / 25,
        decoration: _boxDecoration,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [_authorPlaceHolder, _publishedDate]),
      );

  BoxDecoration get _boxDecoration => BoxDecoration(color: IColors.corduroy.apply, borderRadius: BorderRadius.circular(7));

  Row get _authorPlaceHolder => Row(
        children: [
          Icon(Icons.newspaper, color: IColors.athenaGrey.apply),
          SizedBox(width: Get.width / 50),
          Text(modelOfNews?.author ?? IConstTexts.shared.none, style: ITextStyles.demi.apply),
        ],
      );

  Row get _publishedDate => Row(
        children: [
          Icon(Icons.calendar_month, color: IColors.athenaGrey.apply),
          SizedBox(width: Get.width / 50),
          Text(modelOfNews?.publishedAt?.substring(0, 10) ?? IConstTexts.shared.none, style: ITextStyles.demi.apply),
        ],
      );
}

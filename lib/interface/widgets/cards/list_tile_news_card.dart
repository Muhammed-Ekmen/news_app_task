import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app_task/source/constants/const_texts.dart';
import 'package:news_app_task/source/models/model_news_article.dart';
import 'package:news_app_task/utils/helper/supervisor.dart';
import 'package:news_app_task/utils/tools/enums.dart';

class ListTileNewsCard extends StatelessWidget with Supervizor {
  const ListTileNewsCard({super.key, this.onTap, this.modelOfArticle});
  final VoidCallback? onTap;
  final NewsArticles? modelOfArticle;
  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onTap,
        child: Container(
          width: Get.width,
          height: Get.height / 8,
          padding: EdgeInsets.all(Get.width / 40),
          decoration: _boxDecoration,
          child: _child,
        ),
      );

  BoxDecoration get _boxDecoration => BoxDecoration(
        color: IColors.athenaGrey.apply,
        border: Border(bottom: BorderSide(color: IColors.corduroy.apply, width: 2)),
      );

  Row get _child => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(flex: 7, child: _newsTitleAndContent),
          Expanded(flex: 3, child: _newsImage),
        ],
      );

  Column get _newsTitleAndContent => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            modelOfArticle?.title ?? IConstTexts.shared.none,
            style: ITextStyles.tall.apply.copyWith(color: IColors.corduroy.apply, fontWeight: FontWeight.bold),
            maxLines: 2,
          ),
          Text(
            modelOfArticle?.author ?? IConstTexts.shared.none,
            style: ITextStyles.short.apply.copyWith(color: IColors.corduroy.apply),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      );

  SizedBox get _newsImage => SizedBox(
        child: nillable(
          willCheck: modelOfArticle?.urlToImage,
          notNil: Image.network("${modelOfArticle?.urlToImage}", fit: BoxFit.cover),
          nill: Center(child: Icon(Icons.no_photography_outlined, size: Get.width / 10)),
        ),
      );
}

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
        borderRadius: BorderRadius.circular(13),
        color: IColors.corduroy.apply,
        boxShadow: [BoxShadow(color: IColors.fiord.apply.withOpacity(0.75), offset: const Offset(0, 5), blurRadius: 1)],
      );

  Row get _child => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(flex: 21, child: _newsTitleAndContent),
          const Spacer(flex: 1),
          Expanded(flex: 9, child: _newsImage),
        ],
      );

  Column get _newsTitleAndContent => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [_titleText, _authorText],
      );

  Text get _titleText => Text(
        modelOfArticle?.title ?? IConstTexts.shared.none,
        style: ITextStyles.short.apply.copyWith(fontWeight: FontWeight.bold),
        maxLines: 2,
      );

  Text get _authorText => Text(
        modelOfArticle?.author ?? IConstTexts.shared.none,
        style: ITextStyles.demi.apply,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      );

  SizedBox get _newsImage => SizedBox(
        child: nillable(
          willCheck: modelOfArticle?.urlToImage,
          notNil: _newsImageNotNil,
          nill: Center(child: Icon(Icons.no_photography_outlined, size: Get.width / 10, color: IColors.athenaGrey.apply)),
        ),
      );

  Container get _newsImageNotNil => Container(
        width: Get.width,
        height: Get.height,
        padding: EdgeInsets.all(Get.width / 80),
        decoration: _newsImageBoxDecoration,
      );

  BoxDecoration get _newsImageBoxDecoration => BoxDecoration(
        borderRadius: BorderRadius.circular(13),
        boxShadow: [BoxShadow(color: IColors.fiord.apply.withOpacity(0.75), offset: const Offset(0, 5), blurRadius: 1)],
        image: DecorationImage(image: NetworkImage("${modelOfArticle?.urlToImage}"), fit: BoxFit.cover),
      );
}

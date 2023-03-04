import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app_task/interface/screens/detail_screen/view_model/detail_view_model.dart';
import 'package:news_app_task/interface/widgets/buttons/regular_button.dart';
import 'package:news_app_task/interface/widgets/cards/news_line_card.dart';
import 'package:news_app_task/source/constants/const_texts.dart';
import 'package:news_app_task/source/models/model_news_article.dart';
import 'package:news_app_task/utils/helper/snail_shell.dart';
import 'package:news_app_task/utils/helper/supervisor.dart';
import 'package:news_app_task/utils/tools/enums.dart';

class DetailView extends StatelessWidget with SnailShell, Supervizor {
  DetailView({super.key, this.modelOfNews});
  final DetailViewModel _detailViewModel = Get.put(DetailViewModel());
  final NewsArticles? modelOfNews;
  @override
  Widget build(BuildContext context) => SafeArea(child: Obx(() => Scaffold(body: shellOfWithOutScroll(children: _children))));

  List<Widget> get _children => [
        Expanded(flex: 4, child: _header),
        Expanded(flex: 20, child: _newsImage),
        const Spacer(flex: 1),
        Expanded(flex: 6, child: _newsInfo),
        const Spacer(flex: 1),
        Expanded(flex: 20, child: _newsContent),
        Expanded(flex: 4, child: _newsSourceButton),
      ];

  Row get _header => Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [_headerBackButton, _headerShareAndFavorite]);

  IconButton get _headerBackButton => IconButton(
        padding: EdgeInsets.zero,
        alignment: Alignment.centerLeft,
        onPressed: _detailViewModel.backButtonOnTap,
        icon: const Icon(Icons.arrow_back_ios_new),
      );

  Row get _headerShareAndFavorite => Row(
        children: [
          _iconButton(_detailViewModel.shareButtonOnTap, Icons.ios_share),
          _iconButton(
            _detailViewModel.favoriteButtonOnTap,
            _detailViewModel.addedFavorite.value == false ? Icons.favorite_border : Icons.favorite,
          ),
        ],
      );

  IconButton _iconButton(VoidCallback onPressed, IconData icon) => IconButton(
        onPressed: onPressed,
        icon: Icon(icon),
        padding: EdgeInsets.zero,
        alignment: Alignment.centerRight,
      );

  SizedBox get _newsImage => SizedBox(
        child: nillable(
          willCheck: modelOfNews?.urlToImage,
          notNil: Image.network(modelOfNews?.urlToImage ?? "", fit: BoxFit.cover),
          nill: Center(child: Icon(Icons.no_photography_outlined, size: Get.width / 2)),
        ),
      );

  SizedBox get _newsInfo => SizedBox(
        width: Get.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [_newsTitle, NewsLineCard(modelOfNews: modelOfNews)],
        ),
      );

  Text get _newsTitle => Text(
        modelOfNews?.title ?? IConstTexts.shared.none,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: ITextStyles.tall.apply.copyWith(color: IColors.corduroy.apply, fontWeight: FontWeight.bold),
      );

  SingleChildScrollView get _newsContent => SingleChildScrollView(
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(modelOfNews?.description ?? IConstTexts.shared.none, maxLines: 40, overflow: TextOverflow.ellipsis),
        ),
      );

  Center get _newsSourceButton => Center(
        child: RegularButton(onTap: () => _detailViewModel.newsSourceButtonOnTap(modelOfNews), title: IConstTexts.shared.newsSource),
      );
}

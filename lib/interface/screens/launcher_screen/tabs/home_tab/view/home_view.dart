import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app_task/interface/screens/launcher_screen/tabs/home_tab/view_model/home_view_model.dart';
import 'package:news_app_task/interface/widgets/appbar/regular_app_bar.dart';
import 'package:news_app_task/interface/widgets/cards/list_tile_news_card.dart';
import 'package:news_app_task/interface/widgets/textfield/search_keyword_textfield.dart';
import 'package:news_app_task/source/constants/const_texts.dart';
import 'package:news_app_task/utils/helper/snail_shell.dart';

class HomeView extends StatelessWidget with SnailShell {
  HomeView({super.key});
  final HomeViewModel _homeViewModel = Get.put(HomeViewModel());
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: RegularAppBar(title: IConstTexts.shared.newsAppTitle),
        body: shellOfScrool(children: [_textField, _newsCards]),
      );

  SearchKeyWordTextField get _textField => SearchKeyWordTextField(
        controller: _homeViewModel.searchTextCtrl,
        onChanged: _homeViewModel.seachTextFieldOnChanged,
      );

  Obx get _newsCards => Obx(
        () => Container(
          margin: EdgeInsets.only(top: Get.height / 40),
          width: Get.width,
          height: Get.height,
          child: _listView,
        ),
      );

  ListView get _listView => ListView.separated(
        separatorBuilder: (context, index) => SizedBox(height: Get.height / 70),
        itemCount: _homeViewModel.dummyNewsModel.length,
        itemBuilder: _itemBuilder,
      );

  Widget? _itemBuilder(BuildContext context, int index) => ListTileNewsCard(
        onTap: () => _homeViewModel.listTileNewsCardOnTap(_homeViewModel.dummyNewsModel[index]),
        modelOfArticle: _homeViewModel.dummyNewsModel[index],
      );
}

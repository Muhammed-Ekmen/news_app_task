import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app_task/interface/screens/launcher_screen/tabs/favorites_tab/view_model/favorites_view_model.dart';
import 'package:news_app_task/interface/widgets/appbar/regular_app_bar.dart';
import 'package:news_app_task/interface/widgets/cards/list_tile_news_card.dart';
import 'package:news_app_task/source/constants/const_texts.dart';
import 'package:news_app_task/utils/helper/supervisor.dart';
import 'package:news_app_task/utils/tools/enums.dart';

class FavoritesView extends StatelessWidget with Supervizor {
  FavoritesView({super.key});
  final FavoritesViewModel _favoritesViewModel = Get.put(FavoritesViewModel());
  @override
  Widget build(BuildContext context) => Scaffold(appBar: _regularAppBar, body: _body);

  Padding get _body => Padding(padding: IMeasures.screenOrientation.adjust, child: _newsCards);

  RegularAppBar get _regularAppBar => RegularAppBar(title: IConstTexts.shared.favorites);

  Obx get _newsCards => Obx(
        () => Container(
          margin: EdgeInsets.only(top: Get.height / 40),
          width: Get.width,
          height: Get.height,
          child: _listViewBuilder,
        ),
      );

  ListView get _listViewBuilder => ListView.separated(separatorBuilder: _separatorBuilder, itemCount: _itemCount, itemBuilder: _itemBuilder);

  Widget _separatorBuilder(BuildContext context, int index) => SizedBox(height: Get.height / 40);

  dynamic get _itemCount => binaryCondition(
        trueCondition: _favoritesViewModel.listOfFavoriteNews.isNotEmpty,
        convenient: _favoritesViewModel.listOfFavoriteNews.length,
        inconvenient: 1,
      );

  Widget? _itemBuilder(BuildContext context, int index) => _favoritesViewModel.listOfFavoriteNews.isNotEmpty == true ? _itemBuilderConvenient(index) : _itemBuilderEmpty;

  ListTileNewsCard _itemBuilderConvenient(int index) => ListTileNewsCard(
        onTap: () => _favoritesViewModel.listTileNewsCardOnTap(_favoritesViewModel.listOfFavoriteNews[index]),
        modelOfArticle: _favoritesViewModel.listOfFavoriteNews[index],
      );

  Column get _itemBuilderEmpty => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.file_copy_outlined, size: Get.width / 10),
          Text(IConstTexts.shared.noFavorite, style: ITextStyles.short.apply.copyWith(color: IColors.corduroy.apply)),
        ],
      );
}

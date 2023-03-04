import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app_task/interface/screens/launcher_screen/tabs/favorites_tab/view_model/favorites_view_model.dart';
import 'package:news_app_task/interface/widgets/appbar/regular_app_bar.dart';
import 'package:news_app_task/interface/widgets/cards/list_tile_news_card.dart';
import 'package:news_app_task/source/constants/const_texts.dart';
import 'package:news_app_task/utils/helper/snail_shell.dart';

class FavoritesView extends StatelessWidget with SnailShell {
  FavoritesView({super.key});
  final FavoritesViewModel _favoritesViewModel = Get.put(FavoritesViewModel());
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: RegularAppBar(title: IConstTexts.shared.favorites),
        body: shellOfScrool(children: [_newsCards]),
      );

  Obx get _newsCards => Obx(
        () => Container(
          margin: EdgeInsets.only(top: Get.height / 40),
          width: Get.width,
          height: Get.height,
          child: ListView.builder(
            itemCount: _favoritesViewModel.listOfFavoriteNews.isNotEmpty ? _favoritesViewModel.listOfFavoriteNews.length : 1,
            itemBuilder: (context, index) => _favoritesViewModel.listOfFavoriteNews.isNotEmpty
                ? ListTileNewsCard(
                    onTap: () => _favoritesViewModel.listTileNewsCardOnTap(_favoritesViewModel.listOfFavoriteNews[index]),
                    modelOfArticle: _favoritesViewModel.listOfFavoriteNews[index],
                  )
                : const Center(child: Text("There is no favorites")),
          ),
        ),
      );
}

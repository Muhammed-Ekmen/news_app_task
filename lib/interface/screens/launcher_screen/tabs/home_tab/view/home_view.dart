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
          child: ListView.builder(
            itemCount: _homeViewModel.newsModel.length,
            itemBuilder: (context, index) => ListTileNewsCard(
              onTap: () => _homeViewModel.listTileNewsCardOnTap(_homeViewModel.newsModel[index]),
              modelOfArticle: _homeViewModel.newsModel[index],
            ),
          ),
        ),
      );
}

/////////////////////////

// class _MyHomePageState extends State<MyHomePage> {
//   TextEditingController editingController = TextEditingController();

//   final duplicateItems = List<String>.generate(10000, (i) => "Eleman $i");
//   var items = [];

//   @override
//   void initState() {
//     items.addAll(duplicateItems);
//     super.initState();
//   }

//   void filterSearchResults(String query) {
//     List<String> dummySearchList = [];
//     dummySearchList.addAll(duplicateItems);
//     if (query.isNotEmpty) {
//       List<String> dummyListData = [];
//       for (var item in dummySearchList) {
//         if (item.contains(query)) {
//           dummyListData.add(item);
//         }
//       }
//       setState(() {
//         items.clear();
//         items.addAll(dummyListData);
//       });
//       return;
//     } else {
//       setState(() {
//         items.clear();
//         items.addAll(duplicateItems);
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.deepOrange,
//         title: Text(widget.title),
//       ),
//       body: Container(
//         child: Column(
//           children: <Widget>[
//             Padding(
//               padding: const EdgeInsets.all(10.0),
//               child: TextField(
//                 onChanged: (value) {
//                   filterSearchResults(value);
//                 },
//                 controller: editingController,
//                 decoration: const InputDecoration(labelText: "Sınav ara", hintText: "Sınavı olduğun tarihi yaz", prefixIcon: Icon(Icons.search), border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10.0)))),
//               ),
//             ),
//             const SizedBox(height: 10),
//             Expanded(
//               child: ListView.builder(
//                 shrinkWrap: true,
//                 itemCount: items.length,
//                 itemBuilder: (context, index) {
//                   return ListTile(
//                     title: Text('Listedeki ${items[index]}'),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

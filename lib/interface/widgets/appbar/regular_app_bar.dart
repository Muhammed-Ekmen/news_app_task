import 'package:flutter/material.dart';
import 'package:news_app_task/source/constants/const_texts.dart';
import 'package:news_app_task/utils/tools/enums.dart';

class RegularAppBar extends StatelessWidget with PreferredSizeWidget {
  const RegularAppBar({super.key, this.title});
  final String? title;
  @override
  Widget build(BuildContext context) => AppBar(title: _title, centerTitle: true);

  Text get _title => Text(title ?? IConstTexts.shared.none, style: ITextStyles.venti.apply);

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app_task/source/constants/const_texts.dart';
import 'package:news_app_task/utils/tools/enums.dart';

class RegularButton extends StatelessWidget {
  const RegularButton({super.key, this.widht, this.height, this.title, this.onTap});
  final double? widht;
  final double? height;
  final String? title;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) => SizedBox(
        width: widht ?? Get.width / 1.5,
        height: height ?? Get.height / 20,
        child: OutlinedButton(style: _buttonStyle, onPressed: onTap, child: _text),
      );

  Text get _text => Text(
        title ?? IConstTexts.shared.none,
        style: ITextStyles.demi.apply.copyWith(color: IColors.corduroy.apply.withOpacity(0.7)),
      );

  ButtonStyle? get _buttonStyle => ButtonStyle(
        foregroundColor: MaterialStateProperty.all(IColors.corduroy.apply),
        side: MaterialStateProperty.all(BorderSide(color: IColors.corduroy.apply.withOpacity(0.5), width: 2, style: BorderStyle.solid)),
      );
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app_task/source/constants/const_texts.dart';
import 'package:news_app_task/utils/tools/enums.dart';

// ignore: must_be_immutable
class SearchKeyWordTextField extends StatelessWidget {
  SearchKeyWordTextField({super.key, this.controller, this.onChanged});
  final TextEditingController? controller;
  void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) => SizedBox(
        width: Get.width,
        child: TextFormField(
          controller: controller,
          decoration: _inputDecoration,
          onChanged: onChanged,
        ),
      );

  InputDecoration get _inputDecoration => InputDecoration(
        enabledBorder: _constBorder,
        border: _constBorder,
        focusedBorder: _constBorder.copyWith(borderSide: BorderSide(color: IColors.corduroy.apply.withOpacity(0.5), width: 2)),
        disabledBorder: _constBorder,
        errorBorder: _constBorder,
        focusedErrorBorder: _constBorder,
        contentPadding: EdgeInsets.symmetric(vertical: Get.height / 100),
        hintText: IConstTexts.shared.searchTextFieldHint,
        prefixIcon: Icon(Icons.search, color: IColors.corduroy.apply.withOpacity(0.5)),
      );

  OutlineInputBorder get _constBorder => OutlineInputBorder(
        borderRadius: BorderRadius.circular(13),
        borderSide: BorderSide(color: IColors.corduroy.apply.withOpacity(0.5), width: 1),
      );
}

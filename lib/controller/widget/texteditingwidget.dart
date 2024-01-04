import 'package:flutter/material.dart';

class TextFormFieldWidget extends TextFormField {
  final TextEditingController textEditingController;
  final  String hintText;
  final FormFieldValidator valiDator;

  TextFormFieldWidget(
      {required this.textEditingController,required this.hintText, required this.valiDator, super.key})
      : super(
            controller: textEditingController,
            decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                hintText: hintText),
            validator: valiDator);
}

import 'package:flutter/material.dart';

class TextWidget extends Text {
  final String? name;
  const TextWidget({required this.name, super.key})
      : super(
          name ?? 'N/L',
          style: const TextStyle(fontWeight: FontWeight.bold),
        );
}

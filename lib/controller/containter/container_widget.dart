import 'package:flutter/material.dart';

class ContainerWidget extends Container {
 final double height;
 final double width;
  ContainerWidget({required this.height,required this.width,required this.child, super.key})
      : super(
            height: height,
            width: width,
            child: ClipRect(
              child: child,
            ));
  final Widget child;
}

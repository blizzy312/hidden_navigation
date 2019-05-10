import 'package:flutter/material.dart';

class Screen{
  final String title;
  final DecorationImage backgroundImage;
  final WidgetBuilder contentBuilder;

  Screen({
    this.title,
    this.backgroundImage,
    this.contentBuilder,
  });
}
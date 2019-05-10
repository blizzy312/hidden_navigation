import 'package:flutter/material.dart';

class CustomAnimation {

  final double begin;
  final double end;
  final AnimationController animationController;
  final Curve curve;

  CustomAnimation({this.begin, this.end, this.animationController, this.curve});

  getCustomAnimation(){
    Animation<double> animation = Tween(begin: begin, end: end)
      .animate(
        CurvedAnimation(
          parent: animationController,
          curve: curve),
      );
    return animation;
  }
}

import 'package:flutter/material.dart';

class AnimatedMenuItem extends StatelessWidget {

  final AnimationController animationController;
  final Animation<double> opacityAnimation;
  final Animation<double> translationAnimation;
  final Widget content;

  AnimatedMenuItem({this.animationController, this.opacityAnimation, this.translationAnimation, this.content});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child){
        return Opacity(
          opacity: opacityAnimation.value,
          child: Transform(
            transform: Matrix4.translationValues(0.0, translationAnimation.value, 0.0),
            child: child,
          ),
        );
      },
      child: content,
    );
  }
}

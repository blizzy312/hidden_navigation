import 'package:flutter/material.dart';
import 'package:hidden_navigation/src/blocs/hidden_navigator_bloc.dart';
import 'package:hidden_navigation/src/blocs/hidden_navogator_provider.dart';
import 'package:hidden_navigation/src/widgets/animated_menu_item.dart';
import 'package:hidden_navigation/src/widgets/custom_animation.dart';
import 'package:hidden_navigation/src/widgets/menu_item.dart';


class MenuScreen extends StatefulWidget {
  final int selectedMenu;

  MenuScreen({this.selectedMenu});

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> with TickerProviderStateMixin{

  AnimationController animationController;
  Animation<double> titleAnimation;
  Animation<double> opacityAnimation;
  Animation<double> translationAnimation;

  static bool noStaggering = false;

  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 600)
    );
    titleAnimation = Tween(begin: 250.0, end: -50.0 )
        .animate(
      CurvedAnimation(
          parent: animationController,
          curve: Curves.easeOut),
    );

    opacityAnimation = Tween(begin: 0.0, end: 1.0)
        .animate(
      CurvedAnimation(
          parent: animationController,
          curve: Curves.easeOut),
    );
  }

  @override
  Widget build(BuildContext context) {


    final hiddenNavigatorBloc = HiddenNavigatorProvider.of(context);
    return Material(
      color: Colors.transparent,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/img/dark_background.jpg'),
              fit: BoxFit.cover
          ),
        ),
        child: StreamBuilder<Object>(
            stream: hiddenNavigatorBloc.currentMenuState,
            builder: (context, snapshot) {
              if(snapshot.data == MenuState.closed){
                noStaggering = true;
                animationController.reverse();
              }else{
                noStaggering = false;
                animationController.forward();
              }
              return Stack(
                children: <Widget>[
                  createMenuTitle(),
                  createMenuItems(hiddenNavigatorBloc),
                ],
              );
            }
        ),
      ),
    );
  }

  createMenuTitle(){

    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child){
        return Transform(
          transform: Matrix4.translationValues(
            titleAnimation.value,
            50.0,
            0.0,),

          child:  Opacity(
            opacity: opacityAnimation.value,
            child: child,
          ),
        );
      },
      child: OverflowBox(
        maxWidth: double.infinity,
        alignment: Alignment.topLeft,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            'Menu',
            style: TextStyle(
              color: Colors.grey[800],
              fontSize: 135.0,
              fontFamily: 'Aquatico'
            ),
            textAlign: TextAlign.left,
            softWrap: false,
          ),
        ),
      ),
    );

  }

  createMenuItems(hiddenNavigatorBloc){
    return Transform(
      transform: new Matrix4.translationValues(
        0.0,
        225.0,
        0.0,
      ),
      child: Column(
        children: <Widget>[
          AnimatedMenuItem(
            content: MenuItem(title: 'THE PADDOCK', isSelected: widget.selectedMenu == 0 ? true : false, hiddenNavigatorBloc: hiddenNavigatorBloc),
            animationController: animationController,
            opacityAnimation:  opacityAnimation,
            translationAnimation: new CustomAnimation(begin: 300.0, end: 0.0, animationController: animationController, curve: noStaggering == true ? Curves.easeOut : Interval(0.0, 0.5, curve: Curves.easeOut)).getCustomAnimation(),
          ),
          AnimatedMenuItem(
            content: MenuItem(title: 'THE HERO', isSelected: widget.selectedMenu == 1 ? true : false, hiddenNavigatorBloc: hiddenNavigatorBloc),
            animationController: animationController,
            opacityAnimation:  opacityAnimation,
            translationAnimation: new CustomAnimation(begin: 300.0, end: 0.0, animationController: animationController, curve: noStaggering == true ? Curves.easeOut : Interval(0.15, 0.65, curve: Curves.easeOut)).getCustomAnimation(),
          ),
          AnimatedMenuItem(
            content: MenuItem(title: 'HELP US GROW', isSelected: widget.selectedMenu == 2 ? true : false, hiddenNavigatorBloc: hiddenNavigatorBloc),
            animationController: animationController,
            opacityAnimation:  opacityAnimation,
            translationAnimation: new CustomAnimation(begin: 300.0, end: 0.0, animationController: animationController, curve: noStaggering == true ? Curves.easeOut : Interval(0.25, 0.75, curve: Curves.easeOut)).getCustomAnimation(),
          ),
          AnimatedMenuItem(
            content: MenuItem(title: 'SETTINGS', isSelected: widget.selectedMenu == 3 ? true : false, hiddenNavigatorBloc: hiddenNavigatorBloc),
            animationController: animationController,
            opacityAnimation:  opacityAnimation,
            translationAnimation: new CustomAnimation(begin: 300.0, end: 0.0, animationController: animationController, curve: noStaggering == true ? Curves.easeOut : Interval(0.35, 0.85, curve: Curves.easeOut)).getCustomAnimation(),
          ),
        ],
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:hidden_navigation/src/blocs/hidden_navigator_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hidden_navigation/src/blocs/hidden_navogator_provider.dart';
import '../screen_base.dart';

class HiddenNavigator extends StatefulWidget {

  final Widget menuScreen;
  final Screen activeScreen;
  final MenuState currentState;


  HiddenNavigator({
    this.menuScreen,
    this.activeScreen,
    this.currentState
  });

  @override
  _HiddenNavigatorState createState() => _HiddenNavigatorState();
}

class _HiddenNavigatorState extends State<HiddenNavigator> with TickerProviderStateMixin {

  Animation<double> slideAnimation;
  Animation<double> scaleAnimation;
  Animation<BorderRadius> borderAnimation;
  AnimationController animationController;

  Curve scaleDownCurve = new Interval(0.0, 0.3, curve:  Curves.easeOut);
  Curve scaleUpCurve = new Interval(0.0, 1.0, curve: Curves.easeOut);
  Curve slideOutCurve = new Interval(0.0, 1.0, curve: Curves.easeOut);
  Curve slideInCurve = new Interval(0.0, 1.0, curve: Curves.easeOut);

  double slideAnimationStart = 0.0;
  double slideAnimationEnd = 275.0;
  double scaleAnimationStart = 1.0;
  double scaleAnimationEnd = 0.8;
  double borderRadiusStart = 0.0;
  double borderRadiusEnd = 10.0;

  bool toggleRequired = false;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 550),
    );

    slideAnimation = Tween(begin: slideAnimationStart, end: slideAnimationEnd)
        .animate(
      CurvedAnimation(
          parent: animationController,
          curve: slideOutCurve),
    );


    scaleAnimation = Tween(begin: scaleAnimationStart, end: scaleAnimationEnd)
        .animate(
      CurvedAnimation(
          parent: animationController,
          curve: scaleDownCurve),
    );

    borderAnimation = BorderRadiusTween(begin: BorderRadius.circular(borderRadiusStart), end: BorderRadius.circular(borderRadiusEnd))
        .animate(
      CurvedAnimation(
          parent: animationController,
          curve: Curves.easeOut),
    );
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    ScreenUtil.instance = ScreenUtil(width: 1440, height: 2560, allowFontScaling: true)..init(context);

    return Stack(
        children: [
          widget.menuScreen,
          createContentDisplay(context)
        ]
    );
  }

  createContentDisplay(context){
    final bloc = HiddenNavigatorProvider.of(context);
    if (toggleRequired){
      bloc.toggleState();
      toggleRequired = false;
    }
    return  zoomAndSlideContext(
        bloc,
        Container(
          decoration: BoxDecoration(
              image: widget.activeScreen.backgroundImage,

          ),
          child: Scaffold (
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              title: Text(
                widget.activeScreen.title,
                style: TextStyle(
                  fontSize: 25.0,
                  fontFamily: 'AbrilFatface',
                ),
              ),
              leading: IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: (){
                    bloc.toggleState();
                    if(animationController.status == AnimationStatus.completed){
                      animationController.reverse();
                    }else{
                      animationController.forward();
                    }
                  }
              ),
            ),
            body: widget.activeScreen.contentBuilder(context),
          ),
        )
    );
  }

  zoomAndSlideContext(HiddenNavigatorBloc bloc, Widget content){
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child){
        return Transform(
          transform: Matrix4
              .translationValues(slideAnimation.value, 0.0, 0.0)
            ..scale(scaleAnimation.value,scaleAnimation.value),
          alignment: Alignment.centerLeft,
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  offset: Offset(0.0, 5.0),
                  blurRadius: 20.0,
                  spreadRadius: 10.0,
                )
              ],
            ),
            child: ClipRRect(
              borderRadius: borderAnimation.value,
              child: child,
            ),
          ),
        );
      },
      child: content,
    );
  }
}
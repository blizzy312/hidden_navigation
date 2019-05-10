import 'package:flutter/material.dart';
import 'package:hidden_navigation/src/blocs/hidden_navigator_bloc.dart';


class HiddenNavigatorProvider extends InheritedWidget {
  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }

  final bloc = HiddenNavigatorBloc();

  HiddenNavigatorProvider({Key key, Widget child})
      : super(key:key, child: child);

  static HiddenNavigatorBloc of(BuildContext context){
    return (context.inheritFromWidgetOfExactType(HiddenNavigatorProvider) as HiddenNavigatorProvider).bloc;
  }
}
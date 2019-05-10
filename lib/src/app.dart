import 'package:flutter/material.dart';
import 'package:hidden_navigation/src/screens/help_us_grow_screen.dart';
import 'package:hidden_navigation/src/screens/hidden_navigator_screen.dart';
import 'package:hidden_navigation/src/screens/menu_screen.dart';
import 'package:hidden_navigation/src/screens/settings_screen.dart';
import 'package:hidden_navigation/src/screens/the_hero_screen.dart';
import 'package:hidden_navigation/src/screens/the_paddock_screen.dart';

import 'blocs/hidden_navogator_provider.dart';


class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HiddenNavigatorProvider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: routes,
      ),
    );
  }

  Route routes (RouteSettings settings){

    switch (settings.name){
      case '/THE_PADDOCK':
        return MaterialPageRoute(
            builder: (context){
              final hiddenNavigatorBloc = HiddenNavigatorProvider.of(context);
              hiddenNavigatorBloc.init();
              return HiddenNavigator(
                menuScreen: MenuScreen(selectedMenu: 0),
                activeScreen: thePaddockScreen,
                currentState: hiddenNavigatorBloc.getState(),
              );
            }
        );
        break;
      case '/THE_HERO':
        return MaterialPageRoute(
            builder: (context){
              final hiddenNavigatorBloc = HiddenNavigatorProvider.of(context);
              return HiddenNavigator(
                menuScreen: MenuScreen(selectedMenu: 1),
                activeScreen: theHeroScreen,
                currentState: hiddenNavigatorBloc.getState(),
              );
            }
        );
        break;
      case '/HELP_US_GROW':
        return MaterialPageRoute(
            builder: (context){
              final hiddenNavigatorBloc = HiddenNavigatorProvider.of(context);
              return HiddenNavigator(
                menuScreen: MenuScreen(selectedMenu: 2),
                activeScreen: helpUsGrowScreen,
                currentState: hiddenNavigatorBloc.getState(),
              );
            }
        );
        break;
      case '/SETTINGS':
        return MaterialPageRoute(
            builder: (context){
              final hiddenNavigatorBloc = HiddenNavigatorProvider.of(context);
              return HiddenNavigator(
                menuScreen: MenuScreen(selectedMenu: 3),
                activeScreen: settingsScreen,
                currentState: hiddenNavigatorBloc.getState(),
              );
            }
        );
        break;
      default:
        break;
    }

    return MaterialPageRoute(
        builder: (context){
          final hiddenNavigatorBloc = HiddenNavigatorProvider.of(context);
          hiddenNavigatorBloc.init();
          return HiddenNavigator(
            menuScreen: MenuScreen(selectedMenu: 0),
            activeScreen: thePaddockScreen,
            currentState: hiddenNavigatorBloc.getState(),
          );
        }
    );
  }

}

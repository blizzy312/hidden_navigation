import 'package:rxdart/rxdart.dart';

class HiddenNavigatorBloc{
  MenuState currentState;

  final _stateListener = BehaviorSubject<MenuState>();

  Observable<MenuState> get currentMenuState => _stateListener.stream;


  init(){
    currentState = MenuState.closed;
    _stateListener.sink.add(currentState);
  }

  getState(){
    return currentState;
  }

  toggleState(){
    switch(currentState){
      case MenuState.open:
        currentState = MenuState.closed;
        break;
      case MenuState.closed:
        currentState = MenuState.open;
        break;
    }

    _stateListener.sink.add(currentState);
  }

  onDispose(){
    _stateListener.close();
  }
}




enum MenuState{
  open,
  closed,
}
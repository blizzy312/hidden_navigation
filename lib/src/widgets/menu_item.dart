import 'package:flutter/material.dart';
import 'package:hidden_navigation/src/blocs/hidden_navigator_bloc.dart';


class MenuItem extends StatelessWidget {

  final String title;
  final bool isSelected;
  final HiddenNavigatorBloc hiddenNavigatorBloc;

  MenuItem( {this.title, this.isSelected, this.hiddenNavigatorBloc});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.blue,
      onTap: isSelected ? null : () {
        hiddenNavigatorBloc.toggleState();
        Navigator.pushNamed(context, '/${title.replaceAll(' ', '_')}');
      },
      child: Container(
        width: double.infinity,
        child: Row(
          children: <Widget>[
            Container(
              width: 5,
              height: 50,
              color: isSelected ? Colors.red : Colors.transparent,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0, top:  15.0, bottom: 15.0),
              child: Text(
                title,
                style: TextStyle(
                  color: isSelected ? Colors.red : Colors.white,
                  fontSize: 20.0,
                  fontFamily: 'Aquatico'
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

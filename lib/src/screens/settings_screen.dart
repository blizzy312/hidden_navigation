import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../screen_base.dart';

final Screen settingsScreen = new Screen(
    title: 'SETTINGS',
    backgroundImage: DecorationImage(
        image: AssetImage('assets/img/wooden_background.png'),
        fit: BoxFit.cover
    ),
    contentBuilder: (BuildContext context) {
      return Container(
        height: double.infinity,
        width: double.infinity,
        child: ListView(
          children: <Widget>[
            Card(
              elevation: 10.0,
              color: Colors.blue,
              child: Column(
                children: <Widget>[
                  Container(
                    height: ScreenUtil.instance.setHeight(500),
                    width: double.infinity,
                  )
                ],
              ),
            )
          ],
        ),
      );
    }
);
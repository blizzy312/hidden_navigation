import 'package:flutter/material.dart';

class FoodCard extends StatelessWidget {

  final String foodImagePath;
  final IconData foodIcon;
  final Color foodIconColor;
  final String mainTitle;
  final String subtitle;
  final int likeNum;
  
  final double foodCardBorderRadius = 7.0;

  FoodCard({this.foodImagePath,this.foodIcon,this.foodIconColor, this.mainTitle, this.subtitle, this.likeNum});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(foodCardBorderRadius))
      ),
      margin: EdgeInsets.only(left: 15.0, right: 15.0, bottom: 15.0),
      elevation: 10.0,
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(foodCardBorderRadius)),
            child: Image.asset(
              '$foodImagePath',
              height: MediaQuery.of(context).size.height * 0.25,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Row(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(foodCardBorderRadius*2),
                  color: foodIconColor,
                ),
                margin: EdgeInsets.only(left: 8.0, top: 8.0, bottom: 8.0),
                padding: EdgeInsets.all(16.0),
                child: Icon(
                  foodIcon,
                  color: Colors.white,
                ),
              ),
              Expanded(
                child: ListTile(
                  title: Text(
                    mainTitle,
                    style: TextStyle(
                      fontFamily: 'AbrilFatface'
                    ),
                  ),
                  subtitle: Text(
                    subtitle,
                    style: TextStyle(
                        fontFamily: 'AbrilFatface'
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 10.0),
                child: Column(
                  children: <Widget>[
                    Icon(
                      Icons.favorite_border,
                      color: Colors.red,
                    ),
                    Text('$likeNum'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:hidden_navigation/src/widgets/food_card.dart';
import '../screen_base.dart';

final Screen thePaddockScreen = new Screen(
    title: 'THE PADDOCK',
    backgroundImage: DecorationImage(
        image: AssetImage('assets/img/wooden_background.png'),
        fit: BoxFit.cover
    ),
    contentBuilder: (BuildContext context) {
      return Container(
        child: ListView(
          children: <Widget>[
            FoodCard(
              foodImagePath: 'assets/img/pizza.jpg',
              foodIcon: Icons.fastfood,
              foodIconColor: Colors.pink,
              mainTitle: 'Pizza One',
              subtitle: 'The pizza made by cheif for our best guests',
              likeNum: 85,
            ),
            FoodCard(
              foodImagePath: 'assets/img/hamburger.jpg',
              foodIcon: Icons.fastfood,
              foodIconColor: Colors.yellow,
              mainTitle: 'Hamburger One',
              subtitle: 'The hamburger made by cheif for our best guests',
              likeNum: 55,
            ),
            FoodCard(
              foodImagePath: 'assets/img/sushi.jpg',
              foodIcon: Icons.fastfood,
              foodIconColor: Colors.green,
              mainTitle: 'Sushi One',
              subtitle: 'The sushi made by cheif for our best guests',
              likeNum: 25,
            ),
          ],
        ),
      );
    }
);
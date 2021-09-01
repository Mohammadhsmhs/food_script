import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:food_script/screens/categories_screen.dart';
import 'package:food_script/screens/category_meals_screen.dart';
import 'package:food_script/screens/filters_screen.dart';
import 'package:food_script/screens/tabs_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget _buildListTile(String title, IconData icon, Function() tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
            fontSize: 23,
            fontFamily: "RobotoCondensed",
            fontWeight: FontWeight.bold),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            width: double.infinity,
            height: 170,
            padding: EdgeInsets.all(15),
            color: Theme.of(context).accentColor,
            child: Text(
              "Cooking Up !",
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.w900,
                fontSize: 30,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          _buildListTile("Meals", Icons.restaurant, () {
            Navigator.of(context).pushReplacementNamed(TabsScreen.rout);
          }),
          _buildListTile("Filters", Icons.settings, () {
            Navigator.of(context).pushReplacementNamed(FiltersScreen.rout);
          }),
        ],
      ),
    );
  }
}

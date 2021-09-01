import 'package:flutter/material.dart';
import 'package:food_script/screens/meal_details_screen.dart';
import './screens/tabs_screen.dart';
import '../screens/categories_screen.dart';
import '../screens/category_meals_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Script',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 240, 200, 1),
        fontFamily: "Raleway",
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyText2: TextStyle(
              color: Color.fromRGBO(20, 20, 20, 1),
            ),
            bodyText1: TextStyle(
              color: Color.fromRGBO(20, 20, 20, 1),
            ),
            headline6: TextStyle(
              fontFamily: 'RobotoCondensed',
              fontSize: 20,
              fontWeight: FontWeight.bold,
            )),
      ),
      // home: CategoriesScreen(),
      routes: {
        "/": (ctx) => TabsScreen(),
        CategoryMealsScreen.route: (ctx) => CategoryMealsScreen(),
        MealDetailsScreen.rout: (ctx) => MealDetailsScreen(),
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:food_script/models/meal.dart';
import './data/dummy_data.dart';

import './screens/filters_screen.dart';
import './screens/meal_details_screen.dart';
import './screens/tabs_screen.dart';

import './screens/category_meals_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegeterian': false,
  };
  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoritMeals = [];

  void _toggleFavorit(String mealID) {
    final existingIndex = _favoritMeals.indexWhere((meal) => mealID == meal.id);
    if (existingIndex >= 0) {
      setState(() {
        _favoritMeals.removeAt(existingIndex);
      });
    } else
      setState(() {
        _favoritMeals
            .add(DUMMY_MEALS.firstWhere((element) => element.id == mealID));
      });
  }

  bool _checkFavorit(String mealId) {
    return _favoritMeals.any((element) => element.id == mealId);
  }

  void _setFilters(Map<String, bool> selectedFiltres) {
    setState(() {
      _filters = selectedFiltres;

      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] as bool && !meal.isGlutenFree) return false;
        if (_filters['lactose'] as bool && !meal.isLactoseFree) return false;
        if (_filters['vegan'] as bool && !meal.isVegan) return false;
        if (_filters['vegeterian'] as bool && !meal.isVegetarian) return false;
        return true;
      }).toList();
    });
  }

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
        TabsScreen.rout: (ctx) => TabsScreen(_favoritMeals),
        CategoryMealsScreen.route: (ctx) =>
            CategoryMealsScreen(_availableMeals),
        MealDetailsScreen.rout: (ctx) =>
            MealDetailsScreen(_toggleFavorit, _checkFavorit),
        FiltersScreen.rout: (ctx) => FiltersScreen(_setFilters, _filters),
      },
    );
  }
}

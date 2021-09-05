import 'package:flutter/material.dart';
import 'package:food_script/models/meal.dart';
import 'package:food_script/widgets/main_drawer.dart';
import '../screens/categories_screen.dart';
import '../screens/favorits_screen.dart';

class TabsScreen extends StatefulWidget {
  static const rout = "/";

  final List<Meal> _favoritMeals;

  TabsScreen(this._favoritMeals);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  var _selectedPage = 0;
  late List<Map<String, Object>> _pages;
  void _selectPage(int value) {
    setState(() {
      _selectedPage = value;
    });
  }

  @override
  void initState() {
    _pages = [
      {
        "page": CategoriesScreen(),
        "title": "Categories",
      },
      {
        "page": FavoritsScreen(widget._favoritMeals),
        "title": "Favorits",
      },
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPage]["title"] as String),
      ),
      drawer: MainDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedPage,
        onTap: _selectPage,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: "Category",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "Favorits",
          ),
        ],
      ),
      body: _pages[_selectedPage]["page"] as Widget,
    );
  }
}

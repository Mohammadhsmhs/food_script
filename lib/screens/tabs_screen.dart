import 'package:flutter/material.dart';
import 'package:food_script/widgets/main_drawer.dart';
import '../screens/categories_screen.dart';
import '../screens/favorits_screen.dart';

class TabsScreen extends StatefulWidget {
  static const rout = "/";

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  var _selectedPage = 0;
  void _selectPage(int value) {
    setState(() {
      _selectedPage = value;
    });
  }

  final List<Map<String, Object>> _pages = [
    {
      "page": CategoriesScreen(),
      "title": "Categories",
    },
    {
      "page": FavoritsScreen(),
      "title": "Favorits",
    },
  ];

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

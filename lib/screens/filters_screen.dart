import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const rout = "/filters";

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _isGlutenFree = false;
  var _isVegan = false;
  var _isVegetarian = false;
  var _isLactoseFree = false;

  Widget _buildSwitchTile(
      bool val, String title, String subTitle, Function(bool) onChange) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subTitle),
      value: val,
      onChanged: onChange,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MainDrawer(),
        appBar: AppBar(
          title: Text("Your Filters"),
        ),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(15),
              alignment: Alignment.center,
              child: Text(
                "Adjust your meals here :",
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  _buildSwitchTile(
                    _isGlutenFree,
                    "Gluten-free",
                    "only include gluten-free meals",
                    (_) {
                      setState(() {
                        _isGlutenFree = !_isGlutenFree;
                      });
                    },
                  ),
                  _buildSwitchTile(
                    _isLactoseFree,
                    "Lactose-free",
                    "only include lactose-free meals",
                    (_) {
                      setState(() {
                        _isLactoseFree = !_isLactoseFree;
                      });
                    },
                  ),
                  _buildSwitchTile(
                    _isVegan,
                    "Vegan",
                    "only include Vegan meals",
                    (_) {
                      setState(() {
                        _isVegan = !_isVegan;
                      });
                    },
                  ),
                  _buildSwitchTile(
                    _isVegetarian,
                    "Vegeterian",
                    "only include vegeterian meals",
                    (_) {
                      setState(() {
                        _isVegetarian = !_isVegetarian;
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}

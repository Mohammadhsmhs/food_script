import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const rout = "/filters";

  final Function(Map<String, bool>) saveFilters;
  final Map<String, bool> filters;

  FiltersScreen(this.saveFilters, this.filters);
  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _isGlutenFree = false;
  var _isVegan = false;
  var _isVegetarian = false;
  var _isLactoseFree = false;

  @override
  void initState() {
    _isGlutenFree = widget.filters['gluten'] as bool;
    _isVegan = widget.filters['vegan'] as bool;
    _isVegetarian = widget.filters['vegeterian'] as bool;
    _isLactoseFree = widget.filters['lactose'] as bool;
    super.initState();
  }

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
          actions: [
            IconButton(
              onPressed: () {
                Map<String, bool> selectedFilters = {
                  'gluten': _isGlutenFree,
                  'lactose': _isLactoseFree,
                  'vegan': _isVegan,
                  'vegeterian': _isVegetarian,
                };
                widget.saveFilters(selectedFilters);
              },
              icon: Icon(Icons.save),
            )
          ],
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

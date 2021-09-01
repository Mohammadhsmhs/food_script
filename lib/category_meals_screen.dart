import 'package:flutter/material.dart';
import 'package:food_script/dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  static final route = "/category-meals";
  // final String title;
  // final String id;

  // CategoryMealsScreen(this.id, this.title);

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context)!.settings.arguments as Map;
    final title = routeArgs['title'];
    final id = routeArgs['id'];

    final categoryMeals = DUMMY_MEALS
        .where((element) => element.categories.contains(id))
        .toList();

    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return Text(categoryMeals[index].title);
          },
          itemCount: categoryMeals.length,
        ));
  }
}

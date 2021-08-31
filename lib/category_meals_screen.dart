import 'package:flutter/material.dart';

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

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text("this is shown in this screen"),
      ),
    );
  }
}

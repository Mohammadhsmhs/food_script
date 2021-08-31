import 'package:flutter/material.dart';
import 'package:food_script/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final Color color;
  final String title;
  CategoryItem(this.id, this.title, this.color);

  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(CategoryMealsScreen.route,
        arguments: {"id": id, "title": title});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        alignment: Alignment.topCenter,
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline6,
        ),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(.7),
              color,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}

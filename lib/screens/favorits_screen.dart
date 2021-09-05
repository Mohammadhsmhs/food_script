import 'package:flutter/material.dart';
import 'package:food_script/models/meal.dart';
import '../widgets/meal_item.dart';

class FavoritsScreen extends StatelessWidget {
  final List<Meal> favoritMeals;

  const FavoritsScreen(this.favoritMeals);

  @override
  Widget build(BuildContext context) {
    if (favoritMeals.isEmpty) {
      return Center(
        child: Text("you have no favorits yet"),
      );
    } else
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: favoritMeals[index].id,
            imageURL: favoritMeals[index].imageUrl,
            title: favoritMeals[index].title,
            duration: favoritMeals[index].duration,
            complexity: favoritMeals[index].complexity,
            affordability: favoritMeals[index].affordability,
          );
        },
        itemCount: favoritMeals.length,
      );
  }
}

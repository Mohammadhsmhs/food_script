import 'package:flutter/material.dart';
import 'package:food_script/data/dummy_data.dart';

class MealDetailsScreen extends StatelessWidget {
  static final rout = "./meal-details";

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)!.settings.arguments;
    final meal = DUMMY_MEALS.firstWhere((element) => element.id == id);

    Widget _buildTilte(BuildContext context, String title) {
      return Container(
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline6,
        ),
        padding: EdgeInsets.all(5),
        margin: EdgeInsets.symmetric(vertical: 10),
      );
    }

    Widget _buildContainer(Widget child) {
      return Container(
          width: 300,
          height: 200,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: child);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("${meal.title}"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Image.network(
                meal.imageUrl,
                fit: BoxFit.cover,
              ),
              width: double.infinity,
              height: 300,
            ),
            _buildTilte(context, "Ingredients"),
            _buildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) => Card(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                    child: Text(meal.ingredients[index]),
                  ),
                  color: Theme.of(context).accentColor,
                ),
                itemCount: meal.ingredients.length,
              ),
            ),
            _buildTilte(context, "Steps"),
            _buildContainer(ListView.builder(
              itemBuilder: (ctx, index) => Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      child: Text("# ${index + 1}"),
                    ),
                    title: Text("${meal.steps[index]}"),
                  ),
                  Divider(),
                ],
              ),
              itemCount: meal.steps.length,
            ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pop(id);
        },
        child: Icon(Icons.delete),
      ),
    );
  }
}

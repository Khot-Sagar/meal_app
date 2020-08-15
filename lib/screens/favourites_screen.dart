import 'package:flutter/material.dart';
import 'package:meal_app/widgets/meal_item.dart';
import '../models/meal.dart';

class FavouritesScreen extends StatelessWidget {
  final List<Meal> favMeal;

  FavouritesScreen(this.favMeal);

  @override
  Widget build(BuildContext context) {
    if (favMeal.isEmpty) {
      return Center(
        child: Text('You have no favourite meals'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
            id: favMeal[index].id,
            title: favMeal[index].title,
            affordability: favMeal[index].affordability,
            complexity: favMeal[index].complexity,
            duration: favMeal[index].duration,
            imageUrl: favMeal[index].imageUrl,
          );
        },
        itemCount: favMeal.length,
      );
    }
  }
}

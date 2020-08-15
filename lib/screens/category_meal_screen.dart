import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import '../widgets/meal_item.dart';

class CategoryMealScreen extends StatelessWidget {
  final List<Meal> _availableMeals;
  CategoryMealScreen(this._availableMeals);
  // final String catId;
  // final String catTitle;

  // CategoryMealScreen(this.catId, this.catTitle);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final title = routeArgs['title'];
    final id = routeArgs['id'];

    final categoryMeals = _availableMeals.where((meal) {
      return meal.categories.contains(id);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
            id: categoryMeals[index].id,
            title: categoryMeals[index].title,
            affordability: categoryMeals[index].affordability,
            complexity: categoryMeals[index].complexity,
            duration: categoryMeals[index].duration,
            imageUrl: categoryMeals[index].imageUrl,
          );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}

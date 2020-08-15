import 'package:flutter/material.dart';

import './dummy_data.dart';
import './models/meal.dart';
import './screens/filters_screen.dart';
import './screens/tab_screen.dart';
import './screens/category_meal_screen.dart';
import './screens/meal_detail_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filterData = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegeterian': false,
  };
  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  bool _isFavorite(String id) {
    return _favoriteMeals.any((meal) => meal.id == id);
  }

  void _toggleFav(String id) {
    final existingIndex = _favoriteMeals.indexWhere((meal) => meal.id == id);
    if (existingIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == id));
      });
    }
  }

  void _setFilters(Map<String, bool> filt) {
    setState(() {
      _filterData = filt;
      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filterData['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filterData['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        if (_filterData['vegan'] && !meal.isVegan) {
          return false;
        }
        if (_filterData['vegeterian'] && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meal App',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
            headline3: TextStyle(
              color: Color.fromRGBO(35, 51, 51, 1),
            ),
            headline4: TextStyle(
              color: Color.fromRGBO(35, 51, 51, 1),
            ),
            headline6: TextStyle(
              fontFamily: 'RobotoCondensed',
              fontSize: 20,
              fontWeight: FontWeight.bold,
            )),
      ),
      home: TabsScreen(_favoriteMeals),
      routes: {
        '/category_meal_screen': (ctx) => CategoryMealScreen(_availableMeals),
        '/meal_detail_screen': (ctx) =>
            MealDetailScreen(_isFavorite, _toggleFav),
        '/filters_screen': (ctx) => FiltersScreen(_filterData, _setFilters),
      },
    );
  }
}

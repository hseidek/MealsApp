import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';
import 'package:meal_app/screens/FilterScreen.dart';
import 'package:meal_app/screens/MealDetailScreen.dart';
import 'package:meal_app/screens/TabsScreen.dart';
import 'file:///C:/Users/Haitham/AndroidStudioProjects/meal_app/lib/screens/CategoryMealScreen.dart';

import 'models/meal.dart';
import 'screens/CategoryScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegeterian': false
  };

  List<Meal> _availableMeals = DUMMY_MEALS;

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] == true && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] == true && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] == true && !meal.isVegan) {
          return false;
        }
        if (_filters['vegeterian'] == true && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
            body1: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            title: TextStyle(
                fontFamily: 'RobotoCondensed',
                fontSize: 20,
                fontWeight: FontWeight.bold)),
      ),
      routes: {
        '/': (ctx) => TabsScreen(),
        CategoryMealScreen.routeName: (ctx) =>
            CategoryMealScreen(_availableMeals),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
        FilterScreen.routeName: (ctx) => FilterScreen(_filters,_setFilters),
      },

      // onUnknownRoute: in named route with pushedName that is not registered in the route table - we put here a default route
      // to be directed to
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => CategoryScreen());
      },
    );
  }
}

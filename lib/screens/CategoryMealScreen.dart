import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/widgets/MealItem.dart';

class CategoryMealScreen extends StatelessWidget {
  static const routeName = 'category-meal';
  final List<Meal> availableMeals;

  CategoryMealScreen(this.availableMeals);

  @override
  Widget build(BuildContext context) {
    final routeArg =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryId = routeArg['id'];
    final categoryTitle = routeArg['title'];
    final categoryMeal = availableMeals.where((meal) => meal.categories.contains(categoryId))
        .toList();


    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
             id: categoryMeal[index].id,
              title: categoryMeal[index].title,
              imageUrl: categoryMeal[index].imageUrl,
              duration: categoryMeal[index].duration,
              complexity: categoryMeal[index].complexity,
              affordability: categoryMeal[index].affordability);
        },
        itemCount: categoryMeal.length,
      ),
    );
  }
}

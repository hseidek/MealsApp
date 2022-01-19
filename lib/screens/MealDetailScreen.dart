import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = 'meal-detail';

  Widget buildSectionTitle(BuildContext context, String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.title,
      ),
    );
  }

  Widget buildContainerDecoration(Widget child) {
    return Container(
      width: 300,
      height: 200,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10)),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((e) => e.id == mealId);

    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedMeal.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                height: 300,
                width: double.infinity,
                child: Image.network(
                  selectedMeal.imageUrl,
                  fit: BoxFit.cover,
                )),
            buildSectionTitle(context, "Ingredients"),
            buildContainerDecoration(
              ListView.builder(
                  itemCount: selectedMeal.ingredients.length,
                  itemBuilder: (ctx, index) {
                    return Card(
                      color: Theme.of(context).accentColor,
                      child: Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          child: Text(selectedMeal.ingredients[index])),
                    );
                  }),
            ),
            buildSectionTitle(context, "Steps"),
            buildContainerDecoration(ListView.builder(
                itemCount: selectedMeal.steps.length,
                itemBuilder: (ctx, index) => Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            child: Text("# ${index + 1}"),
                          ),
                          title: Text(selectedMeal.steps[index]),
                        ),
                        Divider(),
                      ],
                    )))
          ],  
        ),
      ),
    );
  }
}

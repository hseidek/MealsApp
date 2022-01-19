import 'package:flutter/material.dart';
import 'file:///C:/Users/Haitham/AndroidStudioProjects/meal_app/lib/screens/CategoryMealScreen.dart';

class CategoryItem extends StatelessWidget {

  final String id;
  final String title;
  final Color color;

  CategoryItem({this.title, this.color,this.id});

  void selectCategory(BuildContext ctx) {
    Navigator.pushNamed(ctx, CategoryMealScreen.routeName,arguments: {'id':id, 'title':title});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=> selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: EdgeInsets.all(15),
        child: Text(
          title,
          style: Theme.of(context).textTheme.title,
        ),
        decoration: BoxDecoration(
          color: color,
          gradient: LinearGradient(
              colors: [color.withOpacity(0.7), color],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}

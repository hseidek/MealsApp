import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'file:///C:/Users/Haitham/AndroidStudioProjects/meal_app/lib/widgets/CategoryItem.dart';
import 'package:meal_app/dummy_data.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(25),


        children:
        DUMMY_CATEGORIES.map(
              (catData)=> CategoryItem(title: catData.title,color: catData.color,id: catData.id,),

        ).toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent:200,

            childAspectRatio: 3/2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20
        ));


  }
}

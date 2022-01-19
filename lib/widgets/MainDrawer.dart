import 'package:flutter/material.dart';
import 'package:meal_app/screens/FilterScreen.dart';

class MainDrawer extends StatelessWidget {

  Widget buildListTile (BuildContext context,IconData icon, String text, Function tabHandler ){
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
        color: Theme.of(context).primaryColor,
      ),
      title: Text(
        text,
        style: TextStyle(
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold,
            fontSize: 24),
      ),
      onTap:tabHandler ,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.all(20),
            color: Theme.of(context).accentColor,
            child: Text(
              "Yummy Food!",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  color: Theme.of(context).primaryColor),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile(context, Icons.restaurant, "Meals",(){
            Navigator.pushReplacementNamed(context, '/');
          }),
         buildListTile(context, Icons.settings, "Filter",(){
           Navigator.pushReplacementNamed(context, FilterScreen.routeName);
         })
        ],
      ),
    );
  }
}

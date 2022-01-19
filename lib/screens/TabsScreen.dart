import 'package:flutter/material.dart';
import 'package:meal_app/screens/CategoryScreen.dart';
import 'package:meal_app/widgets/MainDrawer.dart';

import 'FavouriteScreen.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, dynamic>> _pages = [
    {'page': CategoryScreen(), 'title': 'Category'},
    {'page': FavouriteScreen(), 'title': 'Your Favourite'}
  ];
  int _selectedPageIndex = 0;

  void _selectedPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectedPage,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.category), title: Text("Categort")),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), title: Text("Favourite"))
        ],
      ),
    );
  }
}

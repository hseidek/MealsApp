import 'package:flutter/material.dart';
import 'package:meal_app/widgets/MainDrawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = 'filters';

  final Function saveFilters;
  final Map<String,bool> currentFilter;

  FilterScreen(this.currentFilter,this.saveFilters);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  initState (){
    _glutenFree = widget.currentFilter['gluten'];
    _vegetarian = widget.currentFilter['vegeterian'];
    _vegan = widget.currentFilter['vegan'];
    _lactoseFree = widget.currentFilter['lactose'];

    super.initState();
  }

  Widget buildSwitchTile(
      String title, String subtitle, bool value, Function updatedValue) {
    return SwitchListTile(
      value: value,
      onChanged: updatedValue,
      title: Text(title),
      subtitle: Text(subtitle),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Your Favourite"),
          actions: [
            IconButton(
              icon: Icon(Icons.save),
              onPressed:
              () {

                final _selceted =  {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegeterian': _vegetarian 
                };
                widget.saveFilters(_selceted);

              }
            )
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: [
            Container(
              child: Text(
                'Adjust your meal Selection',
                style: Theme.of(context).textTheme.title,
              ),
              padding: EdgeInsets.all(20),
            ),
            Expanded(
                child: ListView(
              children: [
                buildSwitchTile("Gluten-free",
                    "Only include Gluten-free meals.", _glutenFree, (newValue) {
                  setState(() {
                    _glutenFree = newValue;
                  });
                }),
                buildSwitchTile(
                    "Lactose-free",
                    "Only include Lactose-free meals.",
                    _lactoseFree, (newValue) {
                  setState(() {
                    _lactoseFree = newValue;
                  });
                }),
                buildSwitchTile("Vegan", "Only include Vegan meals.", _vegan,
                    (newValue) {
                  setState(() {
                    _vegan = newValue;
                  });
                }),
                buildSwitchTile(
                    "Vegeterian", "Only include Vegeterian meals.", _vegetarian,
                    (newValue) {
                  setState(() {
                    _vegetarian = newValue;
                  });
                })
              ],
            ))
          ],
        ));
  }
}

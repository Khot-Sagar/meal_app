import 'package:flutter/material.dart';
import '../widgets/main-drawer.dart';

class FiltersScreen extends StatefulWidget {
  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _lactoseFree = false;
  bool _vegan = false;
  bool _vegeterian = false;

  Widget _buildSwitchTile(String title, bool value, String subTitle) {
    return SwitchListTile(
      title: Text(title),
      value: value,
      subtitle: Text(subTitle),
      onChanged: (newValue) {
        value = newValue;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            child: Text(
              'Setup Filters',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                _buildSwitchTile(
                  'Gluten Free',
                  _glutenFree,
                  'Only Gluten Free Meals',
                ),
                _buildSwitchTile(
                  'Lactose Free',
                  _lactoseFree,
                  'Only Lactose Free Meals',
                ),
                _buildSwitchTile(
                  'Vegan Free',
                  _vegan,
                  'Only Vegan Meals',
                ),
                _buildSwitchTile(
                  'Vegetarian Free',
                  _vegeterian,
                  'Only Vegeterian Meals',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

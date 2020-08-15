import 'package:flutter/material.dart';
import '../widgets/main-drawer.dart';

class FiltersScreen extends StatefulWidget {
  final Map<String, bool> filters;
  final Function setFilters;
  FiltersScreen(this.filters, this.setFilters);
  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _lactoseFree = false;
  bool _vegan = false;
  bool _vegeterian = false;

  Widget _buildSwitchTile(
      String title, bool value, String subTitle, Function updateValue) {
    return SwitchListTile(
        title: Text(title),
        value: value,
        subtitle: Text(subTitle),
        onChanged: updateValue);
  }

  @override
  void initState() {
    _glutenFree = widget.filters['gluten'];
    _lactoseFree = widget.filters['lactose'];
    _vegan = widget.filters['vegan'];
    _vegeterian = widget.filters['vegeterian'];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: [
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                Map<String, bool> selectedFilters = {
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegan': _vegan,
                  'vegeterian': _vegeterian,
                };
                widget.setFilters(selectedFilters);
              })
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(vertical: 15),
            child: Text(
              'Filters Meals',
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                _buildSwitchTile(
                    'Gluten Free', _glutenFree, 'Only Gluten Free Meals',
                    (newValue) {
                  setState(() {
                    _glutenFree = newValue;
                  });
                }),
                _buildSwitchTile(
                    'Lactose Free', _lactoseFree, 'Only Lactose Free Meals',
                    (newValue) {
                  setState(() {
                    _lactoseFree = newValue;
                  });
                }),
                _buildSwitchTile('Vegan Free', _vegan, 'Only Vegan Meals',
                    (newValue) {
                  setState(() {
                    _vegan = newValue;
                  });
                }),
                _buildSwitchTile(
                    'Vegetarian Free', _vegeterian, 'Only Vegeterian Meals',
                    (newValue) {
                  setState(() {
                    _vegeterian = newValue;
                  });
                }),
              ],
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  Widget _showItem(IconData icon, String title, Function handler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 30,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 24,
          fontFamily: 'RobotoCondensed',
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: handler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            color: Theme.of(context).accentColor,
            width: double.infinity,
            height: 100,
            padding: EdgeInsets.all(10),
            alignment: Alignment.centerLeft,
            child: Text(
              'Cooking UP!!',
              style: TextStyle(
                fontSize: 30,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          _showItem(
            Icons.restaurant,
            'Meals',
            () {
              Navigator.of(context).pushNamed('/');
            },
          ),
          _showItem(
            Icons.settings,
            'filters',
            () {
              Navigator.of(context).pushNamed('/filters_screen');
            },
          ),
        ],
      ),
    );
  }
}

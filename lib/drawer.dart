import 'package:flutter/material.dart';

bool darktheme = false;

class navdrawer extends StatefulWidget {
  @override
  _navdrawerState createState() => _navdrawerState();
}

class _navdrawerState extends State<navdrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          ListTile(
            trailing: Switch(
                value: darktheme,
                onChanged: (darktheme) {
                  setState(() {
                    darktheme = true;
                  });
                }),
            title: Text('dark mode'),
          ),
        ],
      ),
    );
  }
}

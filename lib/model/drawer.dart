import 'package:flutter/material.dart';

Widget buildDrawerIconButton(BuildContext context) {
  return Drawer(
    child: ListView(
      children: [
        DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Text(
            'Weather Detection',
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text('Settings'),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.account_circle),
          title: Text('Account'),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.privacy_tip),
          title: Text('Privacy Policy'),
          onTap: () {},
        ),
      ],
    ),
  );
}

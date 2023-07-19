import 'package:flutter/material.dart';

Drawer buildAppDrawer(BuildContext context) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          child: Text(
            'My App',
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
        ),
        ListTile(
          leading: Icon(Icons.home),
          title: Text('Home'),
          onTap: () {
            Navigator.pop(context); // Close the drawer
            // Navigate to the home page
          },
        ),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text('Settings'),
          onTap: () {
            Navigator.pop(context); // Close the drawer
            // Navigate to the settings page
          },
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.exit_to_app),
          title: Text('Logout'),
          onTap: () {
            Navigator.pop(context); // Close the drawer
            // Logout the user and navigate to the login page
          },
        ),
      ],
    ),
  );
}

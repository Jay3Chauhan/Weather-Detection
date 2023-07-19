import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CityPopup extends StatefulWidget {
  @override
  _CityPopupState createState() => _CityPopupState();
}

class _CityPopupState extends State<CityPopup> {
  final _formKey = GlobalKey<FormState>();
  late String _username;
  late String _password;

  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Login'),
          content: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Enter username',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter username';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _username = value!;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Enter password',
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter password';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _password = value!;
                  },
                ),
              ],
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: Text('Login'),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  Fluttertoast.showToast(
                    msg: 'Username: $_username\nPassword: $_password',
                    gravity: ToastGravity.CENTER,
                  );
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text('Show Popup'),
          onPressed: _showDialog,
        ),
      ),
    );
  }
}

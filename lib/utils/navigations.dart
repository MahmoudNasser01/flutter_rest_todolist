import 'package:flutter/material.dart';

import '../screens/home_screen.dart';

/*

this class is responsible for the navigation between the screens and the success messages

 */

class Navigation {
  static void ShowSuccessMessage(String message, context) async {
    await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(message),
            actions: [
              TextButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
    final route = MaterialPageRoute(builder: (context) => const HomeScreen());
    await Navigator.push(context, route);
  }

  static void ShowErrorMessage(String message, context) async {
    await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(message),
            actions: [
              TextButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }
}

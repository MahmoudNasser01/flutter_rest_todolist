import 'package:flutter/material.dart';

/*
  * This widget is displayed when there are no todos
 */

class NoTodosFound extends StatelessWidget {
  const NoTodosFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'No Todos..',
        style: Theme.of(context).textTheme.headline4,
      ),
    );
  }
}

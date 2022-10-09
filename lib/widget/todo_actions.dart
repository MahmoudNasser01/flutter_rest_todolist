import 'package:flutter/material.dart';

/*

This is the main widget that will be used to display the todo actions
it takes:
  - a todo object
  - a function to update the todo
  - a function to delete the todo
 */

class TodoActions extends StatelessWidget {
  final Function(String) deleteTodo;
  final Function(Map) goToEditTodoScreen;
  final Map item;

  const TodoActions(
      {Key? key,
      required this.deleteTodo,
      required this.goToEditTodoScreen,
      required this.item})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        IconButton(
          onPressed: () {
            // delete the todo
            deleteTodo(item['_id']);
          },
          icon: const Icon(Icons.delete),
        ),
        IconButton(
          onPressed: () {
            // edit the todo
            goToEditTodoScreen(item);
          },
          icon: const Icon(Icons.edit),
        ),
      ],
    );
  }
}

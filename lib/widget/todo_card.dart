import 'package:flutter/material.dart';
import 'package:rest_todolist/widget/todo_actions.dart';


/*

  This widget is used to display a todo card

  It takes in the following parameters:

  - index: the index of the todo in the list
  - item: the todo item
  - goToEditTodoScreen: a function that takes in a todo item and navigates to the edit todo screen
  - deleteTodo: a function that takes in a todo id and deletes the todo
 */

class TodoCard extends StatelessWidget {
  final int index;
  final Map item;
  final Function(Map) goToEditTodoScreen;
  final Function(String) deleteTodo;

  const TodoCard(
      {Key? key,
      required this.index,
      required this.item,
      required this.goToEditTodoScreen,
      required this.deleteTodo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(item['title']),
        subtitle: Text(item['description']),
        trailing: TodoActions(
          deleteTodo: deleteTodo,
          goToEditTodoScreen: goToEditTodoScreen,
          item: item,
        ),
      ),
    );
  }
}

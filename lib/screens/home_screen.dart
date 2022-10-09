import 'package:flutter/material.dart';
import 'package:rest_todolist/widget/no_todos.dart';
import '../remote_data_services/todo_service.dart';
import '../widget/todo_card.dart';
import 'todo_form_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List todos = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    // fetch the todos from the server
    fetchTodos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _goToAddTodoScreen,
        hoverColor: Colors.blueAccent,
        child: const Icon(Icons.add),
      ),
      body: Visibility(
        visible: isLoading,
        replacement: RefreshIndicator(
          onRefresh: fetchTodos,
          child: Visibility(
            visible: todos.isNotEmpty,
            replacement: const NoTodosFound(),
            child: ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                return TodoCard(
                  index: index,
                  item: todos[index],
                  goToEditTodoScreen: _goToEditTodoScreen,
                  deleteTodo: deleteTodo,
                );
              },
            ),
          ),
        ),
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }

  // methods
  Future<void> _goToAddTodoScreen() async {
    // navigate to add screen
    final route = MaterialPageRoute(builder: (context) => const AddPage());
    await Navigator.push(context, route);
    setState(() {
      isLoading = true;
    });
    fetchTodos();
  }

  void _goToEditTodoScreen(item) {
    // navigate to edit screen
    final route = MaterialPageRoute(builder: (context) => AddPage(todo: item));
    Navigator.push(context, route);
  }

  Future<void> fetchTodos() async {
    // get the todos from the api
    final todos = await TodoService.getTodos();
    if (todos != null) {
      setState(() {
        this.todos = todos;
      });
    } else {
      // show error message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Something went wrong'),
        ),
      );
    }
    setState(() {
      isLoading = false;
    });
  }

  Future<void> deleteTodo(String id) async {
    // delete the todo
    bool isDeleted = await TodoService.deleteTodo(id);
    if (isDeleted) {
      // show success message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Todo deleted successfully'),
        ),
      );
      // refresh the list
      fetchTodos();
    } else {
      // show error message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Something went wrong'),
        ),
      );
    }
  }
}

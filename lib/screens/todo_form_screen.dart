import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rest_todolist/remote_data_services/todo_service.dart';
import 'package:rest_todolist/screens/home_screen.dart';

import '../utils/navigations.dart';

class AddPage extends StatefulWidget {
  final Map? todo;

  const AddPage({Key? key, this.todo}) : super(key: key);

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  bool isEditing = false;

  @override
  void initState() {
    super.initState();
    if (widget.todo != null) {
      _titleController.text = widget.todo!['title'];
      _descriptionController.text = widget.todo!['description'];
      isEditing = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? 'Edit Todo' : 'Add Todo'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          TextField(
            controller: _titleController,
            decoration: InputDecoration(
              hintText: 'Enter Todo Title',
            ),
          ),
          TextField(
            controller: _descriptionController,
            minLines: 8,
            maxLines: 10,
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              hintText: 'Enter Description',
            ),
          ),
          SizedBox(height: 16),
          ElevatedButton(
              onPressed: isEditing ? updateData : submitData,
              child: const Text(
                "Save",
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
    );
  }

  Future<void> submitData() async {
    // get the values from the form
    final enteredTitle = _titleController.text;
    final enteredDescription = _descriptionController.text;
    final requestBody = {
      "title": enteredTitle,
      "description": enteredDescription,
      "is_completed": false
    };
    // send the data to the server
    final response = await TodoService.createTodo(requestBody);
    if (response.statusCode == 201) {
      // reset the form
      _titleController.clear();
      _descriptionController.clear();
      Navigation.ShowSuccessMessage("Todo Added Successfully", context);
    } else {
      Navigation.ShowErrorMessage("Cannot create this todo", context);
    }
  }

  Future<void> updateData() async {
    // get the values from the form
    final enteredTitle = _titleController.text,
        enteredDescription = _descriptionController.text;
    final requestBody = {
      "title": enteredTitle,
      "description": enteredDescription,
      "is_completed": false
    };

    // send the data to the server
    final response =
        await TodoService.updateTodo(requestBody, widget.todo!['_id']);
    if (response.statusCode == 200) {
      // reset the form
      _titleController.clear();
      _descriptionController.clear();
      // show a snackbar
      Navigation.ShowSuccessMessage("Todo Updated Successfully", context);
      // navigate back to home screen

    } else {
      Navigation.ShowErrorMessage("Cannot Update this todo", context);
    }
  }
}

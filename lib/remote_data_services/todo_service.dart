import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../config/constants.dart';

/*
  * This class is responsible for making the HTTP requests to the REST API.
 */

class TodoService {
  // delete a todo
  static Future<bool> deleteTodo(id) async {
    // delete the todo
    final url = Uri.parse('$BASE_API_URL/$id');
    final response = await http.delete(url);
    return response.statusCode == 200;
  }

  // get list of todos
  static Future<List?> getTodos() async {
    // get the todos from the api
    final url = Uri.parse(BASE_API_URL);
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final responseBody = jsonDecode(response.body) as Map;
      final todos = responseBody['items'] as List;
      return todos;
    } else {
      return null;
    }
  }

  // update a todo

  static Future<Response> updateTodo(requestBody, id) async {
    return await http.put(
      Uri.parse('$BASE_API_URL/$id'),
      body: jsonEncode(requestBody),
      headers: API_HEADERS,
    );
  }

  // create a todo
  static Future<Response> createTodo(requestBody) async {
    return await http.post(
      Uri.parse(BASE_API_URL),
      body: jsonEncode(requestBody),
      headers: API_HEADERS,
    );
  }
}

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:todo_list/model/todo_model.dart';
import 'package:todo_list/service/services_enm.dart';
import 'package:todo_list/service/todo_service/ITodo_service.dart';

class TodoService extends ITodoService {
  final String baseUrl = "https://jsonplaceholder.typicode.com/";
  late final dio = Dio(BaseOptions(baseUrl: baseUrl));

  @override
  Future<List<TodoModel>?> getAllTodos() async {
    try {
      final response = await dio.get(services.todos.name);
      if (response.statusCode == HttpStatus.ok) {
        final _todos = response.data;
        if (_todos is List) {
          return _todos.map((e) => TodoModel.fromJson(e)).toList();
        }
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Future<List<TodoModel>?> getUserIdTodos(int id) async {
    try {
      final response = await dio.get("${services.todos.name}/?userId=$id");
      if (response.statusCode == HttpStatus.ok) {
        final _todos = response.data;
        if (_todos is List) {
          return _todos.map((e) => TodoModel.fromJson(e)).toList();
        }
      }
    } catch (e) {
      print(e);
    }
  }
}

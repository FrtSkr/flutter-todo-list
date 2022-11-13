import 'package:flutter/material.dart';
import 'package:todo_list/model/todo_model.dart';
import 'package:todo_list/model/user_model.dart';
import 'package:todo_list/project_colors.dart';
import 'package:todo_list/service/todo_service/ITodo_service.dart';
import 'package:todo_list/service/todo_service/todo_service.dart';

class ToDoPage extends StatefulWidget {
  ToDoPage({super.key, required this.user});
  UserModel? user;
  @override
  State<ToDoPage> createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {
  ITodoService? _todoService;
  List<TodoModel>? _todoItems;

  _ToDoPageState() {}

  @override
  void initState() {
    _todoService = TodoService();
    _getTodos();
    super.initState();
  }

  void _getTodos() async {
    _todoItems = await _todoService?.getUserIdTodos(widget.user?.id ?? 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("To Do Page")),
      body: Container(
        child: Text(
          _todoItems?[0].title.toString() ?? '',
          style: Theme.of(context).textTheme.subtitle1?.copyWith(
                fontSize: 18,
                color: CustomColors().white,
              ),
        ),
      ),
    );
  }
}

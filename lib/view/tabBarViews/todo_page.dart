import 'package:flutter/material.dart';
import 'package:todo_list/model/todo_model.dart';
import 'package:todo_list/model/user_model.dart';
import 'package:todo_list/progress_indicator.dart';
import 'package:todo_list/project_colors.dart';
import 'package:todo_list/service/todo_service/ITodo_service.dart';
import 'package:todo_list/service/todo_service/todo_service.dart';

class ToDoPage extends StatefulWidget {
  ToDoPage({super.key, required this.user});
  UserModel? user;
  @override
  State<ToDoPage> createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> with ProgressIndicatorView, CustomColors {
  ITodoService? _todoService;

  List<TodoModel>? _todoItems;

  bool isLoading = false;

  _ToDoPageState() {}

  @override
  void initState() {
    _todoService = TodoService();
    _getTodos();
    super.initState();
  }

  void _getTodos() async {
    _todoItems = await _todoService?.getUserIdTodos(widget.user?.id ?? 0);
    changedLoading();
  }

  void changedLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? ListView.builder(
              itemCount: _todoItems?.length ?? 0,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                      title: Text(
                    _todoItems?[index].title ?? '',
                    style: Theme.of(context).textTheme.headline6?.copyWith(
                          color: _todoItems?[index].completed ?? false ? lightSeaGreen : red,
                        ),
                  )),
                );
              })
          : Center(child: circularProgressIndicator()),
    );
  }
}

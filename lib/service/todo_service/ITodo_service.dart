import 'package:todo_list/model/todo_model.dart';

abstract class ITodoService {
  Future<List<TodoModel>?> getAllTodos();
}

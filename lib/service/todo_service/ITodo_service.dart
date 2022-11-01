import 'package:social_media_project/model/todo_model.dart';

abstract class ITodoService {
  Future<List<TodoModel>?> getAllTodos();
}

import 'package:todo_list/model/user_model.dart';

abstract class IUserService {
  Future<List<UserModel>?> getAllUser();
}

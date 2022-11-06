import 'package:todo_list/controller/IUser_controller.dart';
import 'package:todo_list/model/user_model.dart';
import 'package:todo_list/service/user_service/IUser_service.dart';
import 'package:todo_list/service/user_service/user_service.dart';

class UserController extends IUserController {
  IUserService? _userService;
  List<UserModel>? _users;

  UserController() {
    _userService = UserService();
    _getAllUser();
  }

  void _getAllUser() async {
    _users = await _userService?.getAllUser();
  }

  @override
  bool checkUserName(String userName) {
    bool result;
    print("User Leng: ${_users?.length}");
    try {
      if (_users != null && userName.isNotEmpty) {
        result = _users?.any((user) => user.username == userName ? true : false) ?? false;
        return result;
      }
    } catch (e) {
      print(e);
    }
    return false;
  }
}

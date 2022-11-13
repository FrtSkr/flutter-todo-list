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
  List checkUserName(String userName) {
    bool _isThere;
    UserModel? _user;
    List _result = [];
    try {
      if (_users != null && userName.isNotEmpty) {
        _isThere = _users?.any((user) => user.username == userName ? true : false) ?? false;
        _user = _users?.firstWhere((element) => element.username == userName);
        _result.add(_isThere);
        _result.add(_user);

        return _result;
      }
    } catch (e) {
      print(e);
    }
    return _result;
  }
}

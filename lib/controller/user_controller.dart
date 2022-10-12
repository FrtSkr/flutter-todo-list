import 'package:social_media_project/controller/IUser_controller.dart';
import 'package:social_media_project/model/user_model.dart';
import 'package:social_media_project/service/user_service/IUser_service.dart';
import 'package:social_media_project/service/user_service/user_service.dart';

class UserController extends IUserController {
  IUserService? _userService;
  List<UserModel>? _users;

  UserController() {
    _userService = UserService();
  }

  void getAllUser() async {
    _users = await _userService?.getAllUser();
  }

  @override
  bool checkUserName(String userName) {
    bool result;
    getAllUser();
    try {
      if (_users != null && userName.isNotEmpty) {
        result = _users?.any((user) => user.username?.contains(userName) ?? false) ?? false;
        return result;
      }
    } catch (e) {
      print(e);
    }
    return false;
  }
}

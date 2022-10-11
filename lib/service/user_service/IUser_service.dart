import 'package:social_media_project/model/user_model.dart';

abstract class IUserService {
  Future<List<UserModel>?> getAllUser();
}

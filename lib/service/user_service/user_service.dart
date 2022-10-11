import 'dart:io';

import 'package:dio/dio.dart';
import 'package:social_media_project/model/user_model.dart';
import 'package:social_media_project/service/services_enm.dart';
import 'package:social_media_project/service/user_service/IUser_service.dart';

class UserService extends IUserService {
  final String baseUrl = 'https://jsonplaceholder.typicode.com/';
  late final dio = Dio(BaseOptions(baseUrl: baseUrl));

  @override
  Future<List<UserModel>?> getAllUser() async {
    try {
      final response = await dio.get(services.users.name);
      if (response.statusCode == HttpStatus.ok) {
        final _users = response.data;

        if (_users is List) {
          return _users.map((e) => UserModel.fromJson(e)).toList();
        }
      }
    } catch (e) {
      print(e);
    }

    return null;
  }
}

import 'dart:developer';

import 'package:api_with_cubit/constants/api_const.dart';
import 'package:api_with_cubit/models/user_model.dart';
import 'package:dio/dio.dart';

class UserService {
  Future<List<UserModel>?> getUserData() async {
    List<UserModel> users = [];
    try {
      final response = await Dio().get(ApiConst.api);
      if (response.statusCode == 200) {
        for (var i in response.data['data']) {
          users.add(UserModel.fromJson(i));
        }
        return users;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}

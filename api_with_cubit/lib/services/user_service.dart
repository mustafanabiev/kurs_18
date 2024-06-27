import 'dart:developer';

import 'package:api_with_cubit/config/api_config.dart';
import 'package:api_with_cubit/models/user_model.dart';
import 'package:dio/dio.dart';

class UserService {
  Future<UserModel?> getUserData() async {
    try {
      final response = await Dio().get(ApiConfig.api);
      if (response.statusCode == 200) {
        final userData = UserModel.fromJson(response.data['data']);
        return userData;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}

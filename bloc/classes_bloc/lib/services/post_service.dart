import 'dart:developer';

import 'package:classes_bloc/config/api_const.dart';
import 'package:classes_bloc/models/post_model.dart';
import 'package:dio/dio.dart';

class PostService {
  Future<List<PostModel>> getPosts() async {
    List<PostModel> posts = [];
    try {
      final response = await Dio().get(ApiConst.api);
      if (response.statusCode == 200) {
        for (var element in response.data) {
          posts.add(PostModel.fromJson(element));
        }
        return posts;
      }
    } catch (e) {
      log(e.toString());
      return posts;
    }
    return posts;
  }
}

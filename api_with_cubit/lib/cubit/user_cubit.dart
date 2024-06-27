import 'dart:developer';

import 'package:api_with_cubit/models/user_model.dart';
import 'package:api_with_cubit/services/user_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserState()) {
    service = UserService();
  }

  late UserService service;

  Future<void> getUser() async {
    try {
      final response = await service.getUserData();
      if (response != null) {
        emit(UserState(userModel: response));
      }
    } catch (e) {
      log(e.toString());
    }
  }
}

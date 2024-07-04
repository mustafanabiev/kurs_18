import 'dart:developer';

import 'package:api_with_bloc/core/fetch_status.dart';
import 'package:api_with_bloc/models/post_model.dart';
import 'package:api_with_bloc/services/post_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'api_event.dart';
part 'api_state.dart';

class ApiBloc extends Bloc<ApiEvent, ApiState> {
  ApiBloc() : super(ApiState(postModel: [])) {
    service = PostService();
    on<ApiEvent>(getPosts);
  }

  late PostService service;

  Future<void> getPosts(ApiEvent event, Emitter<ApiState> emit) async {
    try {
      final response = await service.getPosts();
      if (response.isNotEmpty) {
        emit(state.copyWith(status: FetchStatus.success, postModel: response));
      } else {
        emit(state.copyWith(status: FetchStatus.error, error: 'error'));
      }
    } catch (e) {
      emit(state.copyWith(status: FetchStatus.error, error: e.toString()));
      log(e.toString());
    }
  }
}

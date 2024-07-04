part of 'api_bloc.dart';

class ApiState {
  ApiState({
    this.status = FetchStatus.loading,
    required this.postModel,
    this.error,
  });

  final FetchStatus status;
  final List<PostModel> postModel;
  final String? error;

  ApiState copyWith({
    FetchStatus? status,
    List<PostModel>? postModel,
    String? error,
  }) {
    return ApiState(
      status: status ?? this.status,
      postModel: postModel ?? this.postModel,
      error: error ?? this.error,
    );
  }
}

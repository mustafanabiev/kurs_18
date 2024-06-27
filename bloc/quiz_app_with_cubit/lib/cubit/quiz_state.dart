part of 'quiz_cubit.dart';

class QuizState {
  QuizState({
    required this.index,
    required this.jooptor,
    required this.tuuraJooptor,
    required this.kataJooptor,
  });

  final int index;
  final List<bool> jooptor;
  final List<bool> tuuraJooptor;
  final List<bool> kataJooptor;

  QuizState copyWith({
    int? index,
    List<bool>? jooptor,
    List<bool>? tuuraJooptor,
    List<bool>? kataJooptor,
  }) {
    return QuizState(
      index: index ?? this.index,
      jooptor: jooptor ?? this.jooptor,
      tuuraJooptor: tuuraJooptor ?? this.tuuraJooptor,
      kataJooptor: kataJooptor ?? this.kataJooptor,
    );
  }
}

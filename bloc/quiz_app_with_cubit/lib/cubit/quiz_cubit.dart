import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app_with_cubit/model/quiz_model.dart';

part 'quiz_state.dart';

class QuizCubit extends Cubit<QuizState> {
  QuizCubit()
      : super(
          QuizState(
            index: 0,
            jooptor: [],
            kataJooptor: [],
            tuuraJooptor: [],
          ),
        );

  void teksher(BuildContext context, bool value) {
    if (quizzes[state.index].answer == value) {
      state.jooptor.add(true);
      state.tuuraJooptor.add(true);
    } else {
      state.jooptor.add(false);
      state.kataJooptor.add(false);
    }
    if (quizzes[state.index] == quizzes.last) {
      showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Тест аяктады!!!'),
            content: Text(
              'Суроолорунун саны: ${state.jooptor.length}\n'
              'Сенин туура жоокторуңдун саны: ${state.tuuraJooptor.length}\n'
              'Сенин ката жоокторуңдун саны: ${state.kataJooptor.length}\n',
            ),
            actions: <Widget>[
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelLarge,
                ),
                child: const Text('Тестти кайра баштоо'),
                onPressed: () {
                  emit(
                    QuizState(
                      index: 0,
                      jooptor: [],
                      tuuraJooptor: [],
                      kataJooptor: [],
                    ),
                  );
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } else {
      emit(state.copyWith(index: state.index + 1));
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app_with_cubit/cubit/quiz_cubit.dart';
import 'package:quiz_app_with_cubit/model/quiz_model.dart';
import 'package:quiz_app_with_cubit/widgets/custom_button.dart';
import 'package:quiz_app_with_cubit/widgets/result_icon.dart';

class BashkyBarakcha extends StatelessWidget {
  const BashkyBarakcha({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Тапшырма 7'),
        centerTitle: true,
      ),
      backgroundColor: const Color(0xff363636),
      body: Center(
        child: BlocBuilder<QuizCubit, QuizState>(
          builder: (context, state) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 70,
                    vertical: 120,
                  ),
                  child: Text(
                    quizzes[state.index].question,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                    ),
                  ),
                ),
                CustomButton(
                  tuuraButtonbu: true,
                  baskanda: (value) {
                    context.read<QuizCubit>().teksher(context, value);
                  },
                ),
                const SizedBox(height: 30),
                CustomButton(
                  tuuraButtonbu: false,
                  baskanda: (maani) {
                    context.read<QuizCubit>().teksher(context, maani);
                  },
                ),
                const Spacer(),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  height: 80,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.jooptor.length,
                    itemBuilder: (context, index) {
                      return state.jooptor[index] == true
                          ? const ResultIcon(tuuraIconBu: true)
                          : const ResultIcon(tuuraIconBu: false);
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

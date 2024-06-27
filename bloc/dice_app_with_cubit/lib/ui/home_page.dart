import 'package:dice_app_with_cubit/logic/dice_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFE93B),
      appBar: AppBar(
        title: const Text(
          'Тапшырма 5',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: BlocBuilder<DiceCubit, DiceState>(
          builder: (context, state) {
            return GestureDetector(
              onTap: () => context.read<DiceCubit>().randomSan(),
              child: Row(
                children: [
                  const SizedBox(width: 20),
                  Expanded(
                    child: Image.asset('assets/dice${state.solJakKubik}.png'),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Image.asset(
                      'assets/dice${state.onJakKubik}.png',
                    ),
                  ),
                  const SizedBox(width: 20),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

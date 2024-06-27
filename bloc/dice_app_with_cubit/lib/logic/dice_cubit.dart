import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'dice_state.dart';

class DiceCubit extends Cubit<DiceState> {
  DiceCubit() : super(DiceState(onJakKubik: 3, solJakKubik: 1));

  void randomSan() {
    emit(
      DiceState(
        onJakKubik: Random().nextInt(6) + 1,
        solJakKubik: Random().nextInt(6) + 1,
      ),
    );
  }
}

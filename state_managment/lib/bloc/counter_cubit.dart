import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState(san: 0, name: 'Asan'));

  void increment() => emit(CounterState(san: state.san + 1));

  void decrement() => emit(CounterState(san: state.san - 1));
}

class CounterState {
  CounterState({
    required this.san,
    this.name,
  });

  final int san;
  final String? name;
}

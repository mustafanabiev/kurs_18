import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(count: 0)) {
    on<IncrementEvent>(increment);
    on<DecrementEvent>(decrement);
    // on<CounterEvent>((event, emit) {
    //   emit(CounterState(count: state.count + 1));
    // });
  }

  void increment(IncrementEvent event, Emitter<CounterState> emit) {
    emit(CounterState(count: state.count + 1));
  }

  void decrement(DecrementEvent event, Emitter<CounterState> emit) {
    emit(CounterState(count: state.count - 1));
  }
}

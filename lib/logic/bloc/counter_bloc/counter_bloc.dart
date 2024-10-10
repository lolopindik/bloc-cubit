import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitial()) {
    on<Increment>((event, emit) {
      emit(CounterState(counter: state.counter + 1));
    });

    on<Decrement>((event, emit) {
      emit(CounterState(counter: state.counter - 1));
    });
  }
}

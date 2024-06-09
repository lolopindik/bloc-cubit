import 'package:coin_wallet/bloc/counter_event.dart';
import 'package:coin_wallet/bloc/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterIncrementIvent, CounterState> {
  CounterBloc() : super(CounterState(count: 0)) {
    on<CounterIncrementIvent>((event, emit) => emit(CounterState(count: state.count + 1)));
  }
}
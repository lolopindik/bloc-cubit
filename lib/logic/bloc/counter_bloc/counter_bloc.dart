// ignore_for_file: avoid_print

import 'dart:async';
import 'package:bloc_example/constants/enums.dart';
import 'package:bloc_example/logic/bloc/internet/internet_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  final InternetBloc internetBloc;
  StreamSubscription? internetStreamSubscription;

  CounterBloc({required this.internetBloc}) : super(CounterInitial()) {
    internetStreamSubscription = internetBloc.stream.listen((internetState) {
      print('internetState in Counter: $internetState');
      if (internetState is InternetConnected &&
          internetState.connectionType == ConnectionType.wifi) {
        add(Increment());
      } else if (internetState is InternetConnected &&
          internetState.connectionType == ConnectionType.mobile) {
        add(Increment());
      } else {
        add(Decrement());
      }
    });

    on<Increment>((event, emit) {
      emit(CounterState(counter: state.counter + 1));
    });

    on<Decrement>((event, emit) {
      emit(CounterState(counter: state.counter - 1));
    });
  }

  @override
  Future<void> close() {
    internetStreamSubscription?.cancel();
    return super.close();
  }
}

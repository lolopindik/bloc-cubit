// ignore_for_file: must_be_immutable

part of 'counter_bloc.dart';

class CounterState extends Equatable {
  int counter;
  CounterState({required this.counter});

  @override
  List<Object?> get props => [counter];
}

class CounterInitial extends CounterState {
  CounterInitial() : super(counter: 0);
}

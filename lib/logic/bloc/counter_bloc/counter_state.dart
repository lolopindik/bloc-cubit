// ignore_for_file: must_be_immutable

part of 'counter_bloc.dart';

class CounterState {
  int counter;
  CounterState({required this.counter});
}

class CounterInitial extends CounterState {
  CounterInitial() : super(counter: 0);
}

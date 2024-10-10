import 'package:bloc_example/logic/bloc/counter_bloc/counter_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CounterBloc', () {
    CounterBloc? counterBloc;

    setUp(() {
      counterBloc = CounterBloc();
    });
    tearDown(() {
      counterBloc?.close();
    });

    test('Checking the state CounterBloc (counter: 0)', () {
      expect(CounterInitial(), isA<CounterState>());
      expect(CounterInitial().counter, CounterState(counter: 0).counter);
      debugPrint('State sanity check checked successfully');
    });

    blocTest(
      'The bloc should emit a CounterState(counter: 0)',
      build: () => CounterBloc(),
      act: (bloc) => bloc.add(Increment()),
      expect: () => [CounterState(counter: 1)],
    );

    blocTest(
      'The bloc should emit a CounterState(counter: 0)',
      build: () => CounterBloc(),
      act: (bloc) => bloc.add(Decrement()),
      expect: () => [CounterState(counter: -1)],
    );
  });
}

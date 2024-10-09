import 'package:bloc_example/bloc/bloc/counter_bloc.dart';
import 'package:bloc_example/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  // final CounterState counterState1 = CounterState(counter: 1);
  // final CounterState counterState2 = CounterState(counter: 1);
  // debugPrint('${counterState1 == counterState2}');
  runApp(
    BlocProvider(
      create: (context) => CounterBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.black12,
            brightness: Brightness.dark,
          ),
        ),
        home: const HomePage(),
      ),
    ),
  );
}

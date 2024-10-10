import 'package:bloc_example/logic/bloc/counter_bloc/counter_bloc.dart';
import 'package:bloc_example/logic/presentation/screens/home_screen.dart';
import 'package:bloc_example/logic/presentation/screens/second_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Main {
  final CounterBloc _counterBloc = CounterBloc();

  void main() {
    runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.black12,
            brightness: Brightness.dark,
          ),
        ),
        initialRoute: '/home',
        routes: {
          '/home': (context) => BlocProvider.value(
              value: _counterBloc, child: const HomeScreen()),
          '/second': (context) => BlocProvider.value(
                value: _counterBloc,
                child: const SecondScreen(),
              )
        },
      ),
    );
  }
}

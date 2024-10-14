// ignore_for_file: avoid_print

import 'package:bloc_example/logic/bloc/counter_bloc/counter_bloc.dart';
import 'package:bloc_example/logic/bloc/internet/internet_bloc.dart';
import 'package:bloc_example/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class SimpleBlocObserver extends BlocObserver {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    print('Event: $event');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print('Change: $change');
  }
}

void main() {
  Bloc.observer = SimpleBlocObserver();
  Connectivity connectivity = Connectivity();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<InternetBloc>(
            create: (context) => InternetBloc(connectivity: connectivity)),
        BlocProvider<CounterBloc>(
            create: (context) => CounterBloc(
                internetBloc: BlocProvider.of<InternetBloc>(context))),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.black12,
            brightness: Brightness.dark,
          ),
        ),
        home: const HomeScreen(),
      ),
    ),
  );
}

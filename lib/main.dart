import 'package:bloc_example/logic/bloc/counter_bloc/counter_bloc.dart';
import 'package:bloc_example/logic/bloc/internet/internet_bloc.dart';
import 'package:bloc_example/logic/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

void main() {
  final Connectivity connectivity = Connectivity();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<InternetBloc>(
            create: (context) => InternetBloc(connectivity: connectivity)),
        BlocProvider<CounterBloc>(
            create: (context) => CounterBloc(
                internetBloc: InternetBloc(connectivity: connectivity))),
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

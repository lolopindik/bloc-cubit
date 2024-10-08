// ignore_for_file: library_private_types_in_public_api

import 'package:bloc_example/bloc/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/home';

  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Text('Counter Bloc'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: BlocConsumer<CounterBloc, CounterState>(
          listener: (context, state) {
            if (state.counter != 0) {
              debugPrint('Текущее состояние переменной: ${state.counter}');
            }
          },
          builder: (context, state) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.grey,
                        radius: MediaQuery.of(context).size.height * 0.04,
                        child: IconButton(
                          onPressed: () => BlocProvider.of<CounterBloc>(context)
                              .add(Decrement()),
                          icon: const Icon(
                            Icons.remove,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Flexible(
                        child: Text(
                          (state.counter != 0)
                              ? state.counter.toString()
                              : 'State Clear',
                          style: const TextStyle(fontSize: 24),
                        ),
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.grey,
                        radius: MediaQuery.of(context).size.height * 0.04,
                        child: IconButton(
                          onPressed: () => BlocProvider.of<CounterBloc>(context)
                              .add(Increment()),
                          icon: const Icon(
                            Icons.add,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

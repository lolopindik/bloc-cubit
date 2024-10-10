// ignore_for_file: library_private_types_in_public_api

import 'package:bloc_example/logic/bloc/counter_bloc/counter_bloc.dart';
import 'package:bloc_example/logic/presentation/widgets/appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, 'Counter Bloc', false),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: BlocConsumer<CounterBloc, CounterState>(
          listener: (context, state) {
            if (state.counter != 0) {
              debugPrint('Текущее состояние переменной: ${state.counter}');
            }
          },
          builder: (context, state) {
            return Stack(
              children: [
                Positioned(
                  bottom: 60,
                  left: 0,
                  right: 0,
                  child: ElevatedButton(
                    onPressed: () => Navigator.pushNamed(context, '/second'),
                    child: const Text(
                      'Go to second sreen',
                      style: TextStyle(fontSize: 22),
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.grey,
                          radius: MediaQuery.of(context).size.height * 0.04,
                          child: IconButton(
                            onPressed: () =>
                                BlocProvider.of<CounterBloc>(context)
                                    .add(Decrement()),
                            icon: Icon(
                              size: MediaQuery.of(context).size.height * 0.04,
                              Icons.remove,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Flexible(
                          child: Text(
                            (state.counter != 0)
                                ? (state.counter > 0)
                                    ? 'Positive: ${state.counter.toString()}'
                                    : 'Negative: ${state.counter.toString()}'
                                : 'State: Clear',
                            style: const TextStyle(fontSize: 24),
                          ),
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.grey,
                          radius: MediaQuery.of(context).size.height * 0.04,
                          child: IconButton(
                            onPressed: () =>
                                BlocProvider.of<CounterBloc>(context)
                                    .add(Increment()),
                            icon: Icon(
                              size: MediaQuery.of(context).size.height * 0.04,
                              Icons.add,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

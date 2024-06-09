import 'package:coin_wallet/bloc/counter_bloc.dart';
import 'package:coin_wallet/bloc/counter_event.dart';
import 'package:coin_wallet/bloc/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bloc&Cubit Testing',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pinkAccent),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Bloc&Cubit Testing'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final counterBloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            counterBloc.add(CounterIncrementIvent());
          },
          child: Container(
            color: Colors.transparent,
            width: MediaQuery.of(context).size.width * 1,
            height: MediaQuery.of(context).size.height * 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'You have pushed the button this many times:',
                ),
                BlocBuilder<CounterBloc, CounterState>(
                  buildWhen: (previous, current){
                    debugPrint('Previous: ${previous.count}');
                    debugPrint('Current: ${current.count}');
                    return current.count < 10001;
                  },
                  bloc: counterBloc,
                  builder: (context, state) {
                  return Text(
                    state.count.toString(),
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

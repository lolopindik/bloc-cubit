// ignore_for_file: library_private_types_in_public_api

import 'package:bloc_example/constants/enums.dart';
import 'package:bloc_example/logic/bloc/internet/internet_bloc.dart';
import 'package:bloc_example/presentation/widgets/appbar_widget.dart';
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BlocBuilder<InternetBloc, InternetState>(
                    builder: (context, state) {
                      debugPrint('actual state: $state');
                  if (state is InternetConnected &&
                      state.connectionType == ConnectionType.wifi) {
                    return const Text('Connected to WiFi');
                  } else if (state is InternetConnected &&
                      state.connectionType == ConnectionType.mobile) {
                    return const Text('Connected to Mobile');
                  } else if (state is InternetDisconnected) {
                    return const Text('Connected Lost');
                  } else {
                    return const CircularProgressIndicator(
                      backgroundColor: Colors.black38,
                    );
                  }
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

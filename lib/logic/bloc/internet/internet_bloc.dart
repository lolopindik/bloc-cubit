// ignore_for_file: unrelated_type_equality_checks

import 'dart:async';
import 'package:bloc_example/constants/enums.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'internet_event.dart';
part 'internet_state.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  final Connectivity connectivity;
  StreamSubscription? connectivityStreamSubscription;

  InternetBloc({required this.connectivity}) : super(InternetLoading()) {
    connectivityStreamSubscription =
        connectivity.onConnectivityChanged.listen((connectivityResult) {
      if (connectivityResult == ConnectivityResult.wifi) {
        add(EmitInternetConnection(connectionType: ConnectionType.wifi));
      } else if (connectivityResult == ConnectivityResult.mobile) {
        add(EmitInternetConnection(connectionType: ConnectionType.mobile));
      } else {
        add(EmitInternetDisconnection());
      }
    });

    on<EmitInternetConnection>((event, emit) {
      emit(InternetConnected(connectionType: event.connectionType));
    });

    on<EmitInternetDisconnection>((event, emit) {
      emit(InternetDisconected());
    });
  }

  @override
  Future<void> close() {
    connectivityStreamSubscription?.cancel();
    return super.close();
  }
}

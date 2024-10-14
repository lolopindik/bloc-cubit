// ignore_for_file: unrelated_type_equality_checks, avoid_print

import 'dart:async';
import 'package:bloc_example/constants/enums.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'internet_event.dart';
part 'internet_state.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  final Connectivity connectivity;
  StreamSubscription? _connectivityStreamSubscription;

  // Хранит текущее состояние подключения
  ConnectionType? _currentConnectionType;

  InternetBloc({required this.connectivity}) : super(InternetLoading()) {
    _connectivityStreamSubscription =
        connectivity.onConnectivityChanged.listen((connectivityResult) {
      print('Connectivity Changed: $connectivityResult');

      // Определяем тип подключения
      ConnectionType newConnectionType;
      if (connectivityResult == ConnectivityResult.wifi) {
        newConnectionType = ConnectionType.wifi;
        print('Wi-Fi connected');
      } else if (connectivityResult == ConnectivityResult.mobile) {
        newConnectionType = ConnectionType.mobile;
        print('Mobile connected');
      } else {
        newConnectionType = ConnectionType.none;
        print('No internet connection');
      }

      // Если тип подключения изменился, добавляем событие
      if (newConnectionType != _currentConnectionType) {
        _currentConnectionType = newConnectionType;
        if (newConnectionType != ConnectionType.none) {
          add(_EmitInternetConnection(connectionType: newConnectionType));
        } else {
          add(_EmitInternetDisconnection());
        }
      }
    });

    on<_EmitInternetConnection>((event, emit) {
      print('Internet connected: ${event.connectionType}');
      emit(InternetConnected(connectionType: event.connectionType));
    });

    on<_EmitInternetDisconnection>((event, emit) {
      print('Internet disconnected');
      emit(InternetDisconnected());
    });
  }

  @override
  Future<void> close() {
    _connectivityStreamSubscription?.cancel();
    return super.close();
  }
}

part of 'internet_bloc.dart';

abstract class InternetEvent {}

class _EmitInternetConnection extends InternetEvent {
  final ConnectionType connectionType;

  _EmitInternetConnection({required this.connectionType});
}

class _EmitInternetDisconnection extends InternetEvent {}

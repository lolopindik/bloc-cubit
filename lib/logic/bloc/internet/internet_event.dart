part of 'internet_bloc.dart';

abstract class InternetEvent {}

class EmitInternetConnection extends InternetEvent {
  final ConnectionType connectionType;

  EmitInternetConnection({required this.connectionType});
}

class EmitInternetDisconnection extends InternetEvent {}

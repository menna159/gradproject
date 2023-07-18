part of 'communication_cubit.dart';

@immutable
abstract class CommunicationState {}

class CommunicationInitial extends CommunicationState {}
class communicationloading extends CommunicationState {}

class communicationSuccess extends CommunicationState {}

class communicationFailure extends CommunicationState {
  // String errorMessage;
  // communicationFailure();
}
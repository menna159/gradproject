part of 'appointment_cubit.dart';

@immutable
abstract class AppointmentState {}

class AppointmentInitial extends AppointmentState {}
class Appointmentloading extends AppointmentState {}
class Appointmentsuccess extends AppointmentState {}
class Appointmentfailure extends AppointmentState {}



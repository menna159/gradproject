part of 'allapointments_cubit.dart';

@immutable
abstract class AllapointmentsState {}

class AllapointmentsInitial extends AllapointmentsState {}
class AllappointmentInitial extends AllapointmentsState {}
class Allappointmentloading extends AllapointmentsState {}
class Allappointmentsuccess extends AllapointmentsState {}
class Allappointmentfailure extends AllapointmentsState {}

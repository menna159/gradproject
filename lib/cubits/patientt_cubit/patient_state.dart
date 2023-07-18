part of 'patient_cubit.dart';

@immutable
abstract class addPatientState {}

class addPatientInitial extends addPatientState {}

class addPatientloading extends addPatientState {}

class addPatientsuccess extends addPatientState {}

class addPatientfailure extends addPatientState {
  // String? error_message;
  // addPatientfailure({required this.error_message});
}

class showall_PatientInitial extends addPatientState {}

class showall_Patientloading extends addPatientState {}

class showall_Patientsuccess extends addPatientState {}

class showall_Patientfailure extends addPatientState {
 
}

class allpatient_byNameInitial extends addPatientState {}

class allpatient_byNameloading extends addPatientState {}

class allpatient_byNamesuccess extends addPatientState {}

class allpatient_byNamefailure extends addPatientState {
 
}

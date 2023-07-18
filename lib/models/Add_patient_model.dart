import 'package:flutter/material.dart';

class AddPatientModel {
  dynamic id;
  dynamic dId;
  dynamic patientName;
  dynamic patientAge;
  dynamic patientPhoneNumber;
  dynamic patientUsername;
  dynamic patientEmail;
  dynamic patientPassword;
  dynamic cancerType;
  dynamic diagnosisOfDisease;
  dynamic drugsNames;
  dynamic patientGender;
  dynamic dateofVisit;
  dynamic doctorInstructionsAndNotes;
  dynamic abnormalSymptoms;
  dynamic additionalInfo;

  AddPatientModel({
    required this.id,
    required this.dId,
    required this.patientName,
    required this.patientAge,
    required this.patientPhoneNumber,
    required this.patientUsername,
    required this.patientEmail,
    required this.patientPassword,
    required this.cancerType,
    required this.diagnosisOfDisease,
    required this.drugsNames,
    required this.patientGender,
    required this.dateofVisit,
    required this.doctorInstructionsAndNotes,
    required this.abnormalSymptoms,
    required this.additionalInfo,
  });

  factory AddPatientModel.fromjson(Map<dynamic, dynamic> jsonData) {
    return AddPatientModel(
      id: jsonData["response"]["_id"],
      dId: jsonData["response"]["d_id"],
      patientName: jsonData["response"]["patientName"],
      patientAge: jsonData["response"]["patientAge"],
      patientPhoneNumber: jsonData["response"]["patientPhoneNumber"],
      patientUsername: jsonData["response"]["patientUsername"],
      patientEmail: jsonData["response"]["patientEmail"],
      patientPassword: jsonData["response"]["patientPassword"],
      cancerType: jsonData["response"]["cancerType"],
      diagnosisOfDisease: jsonData["response"]["diagnosisOfDisease"],
      drugsNames: jsonData["response"]["drugs_names"],
      patientGender: jsonData["response"]["patientGender"],
      dateofVisit: DateTime.parse(jsonData["response"]["dateofVisit"]),
      doctorInstructionsAndNotes: jsonData["response"]
          ["doctorInstructionsAndNotes"],
      abnormalSymptoms: jsonData["response"]["abnormal_Symptoms"],
      additionalInfo: jsonData["response"]["additional_Info"],
    );
  }
}

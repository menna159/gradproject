class patientSigninModel {
  String id;
  String dId;
  String patientName;
  int patientAge;
  String patientPhoneNumber;
  String patientUsername;
  String patientEmail;
  String patientPassword;
  String cancerType;
  String diagnosisOfDisease;
  String drugsNames;
  String patientGender;
  DateTime dateofVisit;
  String doctorInstructionsAndNotes;
  String abnormalSymptoms;
  String additionalInfo;
  String token;

  patientSigninModel({
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
    required this.token,
  });

  factory patientSigninModel.fromjson(jsonData) {
    return patientSigninModel(
      id: jsonData["user"]["_id"],
      dId: jsonData["user"]["d_id"],
      patientName: jsonData["user"]["patientName"],
      patientAge: jsonData["user"]["patientAge"],
      patientPhoneNumber: jsonData["user"]["patientPhoneNumber"],
      patientUsername: jsonData["user"]["patientUsername"],
      patientEmail: jsonData["user"]["patientEmail"],
      patientPassword: jsonData["user"]["patientPassword"],
      cancerType: jsonData["user"]["cancerType"],
      diagnosisOfDisease: jsonData["user"]["diagnosisOfDisease"],
      drugsNames: jsonData["user"]["drugs_names"],
      patientGender: jsonData["user"]["patientGender"],
      dateofVisit: DateTime.parse(jsonData["user"]["dateofVisit"]),
      doctorInstructionsAndNotes: jsonData["user"]
          ["doctorInstructionsAndNotes"],
      abnormalSymptoms: jsonData["user"]["abnormal_Symptoms"],
      additionalInfo: jsonData["user"]["additional_Info"],
      token: jsonData["token"],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:vital_care/cubits/allapointments_cubit.dart';
import 'package:vital_care/screens/Scan_Page.dart';
import 'package:vital_care/screens/add_patient.dart';
import 'package:vital_care/screens/allPatient.dart';
import 'package:vital_care/screens/all_doctors.dart';
import 'package:vital_care/screens/appointments%20(2).dart';
import 'package:vital_care/screens/authentication/check_your_email.dart';
import 'package:vital_care/screens/authentication/reset_password.dart';
import 'package:vital_care/screens/authentication/reset_success.dart';
import 'package:vital_care/screens/authentication/sign_up_doc.dart';
import 'package:vital_care/screens/authentication/signin_patient.dart';
import 'package:vital_care/screens/bot.dart';
import 'package:vital_care/screens/change_password.dart';
import 'package:vital_care/screens/communication.dart';
import 'package:vital_care/screens/doctor_profile.dart';
import 'package:vital_care/screens/edit_pati.dart';
import 'package:vital_care/screens/edit_profile_doc.dart';
import 'package:vital_care/screens/home_doc.dart';
import 'package:vital_care/screens/home_patient.dart';
import 'package:vital_care/screens/information.dart';
import 'package:vital_care/screens/logo.dart';
import 'package:vital_care/screens/m.dart';
import 'package:vital_care/screens/machine_scan.dart';
import 'package:vital_care/screens/personal_info_to_pat.dart';
import 'package:vital_care/screens/treatment.dart';
import 'package:vital_care/screens/treatments_page.dart';
import 'package:vital_care/screens/view.dart';

import 'cubits/authh_cubit/auth_cubit.dart';
import 'cubits/communication_cubit/communication_cubit.dart';
import 'cubits/patientt_cubit/patient_cubit.dart';
import 'cubits/profil_doc_cubit/edit_profile_cubit_cubit.dart';
import 'models/doc_accountModel.dart';
import 'screens/Abnormal symptoms.dart';
import 'screens/authentication/forgot_password.dart';
import 'screens/authentication/patient_or_doctor.dart';
import 'screens/authentication/signin_doctor.dart';
import 'screens/patient_prof_toDoc.dart';

void main() {
  runApp(MultiBlocProvider(providers: [
    BlocProvider(
      create: (context) => AuthCubit(),
    ),
    BlocProvider(create: (context) => PatientCubit()),
    BlocProvider(
      create: (context) => CommunicationCubit(),
    ),
    BlocProvider(create: ((context) => EditProfileCubitCubit())),
    BlocProvider(create: (context) => AllapointmentsCubit())
  ], child: vitalCare()));
}

dynamic themeMo;

class vitalCare extends StatelessWidget {
  static final ValueNotifier<ThemeMode> themeNotifier =
      ValueNotifier(ThemeMode.light);
  //static final ValueNotifier<ThemeMode> themeNotifier=ValueNotifier(ThemeMode.light);
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeNotifier,
      builder: (context, currentMode, child) {
        child:
        child;
        return MaterialApp(
          theme: ThemeData(primarySwatch: Colors.grey),
          //themeMode: BlocProvider.of<AuthCubit>(context).swvalue==false?_light:_dark ,
          darkTheme: ThemeData.dark(),

          themeMode: currentMode,
          // theme: BlocProvider.of<AuthCubit>(context).swvalue==false?  ,
          debugShowCheckedModeBanner: false,
          // theme: ThemeData(primaryColor:
          // Color(0xff82C4C3)),

          routes: {
            '/main': (context) => Logo(),
            '/doc_or_patient': (context) => PatientOrDoc(),
            // '/signup_doc': (context) => SignUp_doc(),
            '/sign_updoc': (context) => SignUp_doc(),
            '/signinpatient': (context) => Signin_Patient(),
            '/login_doc': (context) => Signin_doc(),
            '/home_doc': (context) => HomeDoctor(),
            '/home_pati': (context) => Homepatient(),
            '/forget_pass': (context) => Forgot_Password(),
            '/cancer_guide': (context) => CancerGuide(),
            // '/search': (context) {
            //   return SearchPage();
            // },
            '/bot': (context) => Bot_Page(),
            '/allPatient': (context) => allPatient(),
            '/all_docs': (context) => AllDocs(),
            '/view': (context) => doc_editttt(),
            '/docprof': (context) => docProf(),
            '/patientprof': (context) => patientProf(),
            '/checkemail': (context) => CheckYourEmail(),
            '/reset_pass': (context) => Reset_Password(),
            '/reset_success': (context) => Reset_Success(),
            '/add_patient': (context) => addPatient(),
            '/edit_profil_doc': (context) => Edit_Profil_Doc(),
            '/change_pass': (context) => ChangePassword(),
            // '/Bot_Page': (context) => Bot_Page(),
            '/treatment': (context) => Treatment(),
            '/Scan_page': (context) => Scan_Page(),
            '/Scan_Type': (context) => Scan_Type(),
            '/treatment_page': (context) => treatment_page(),
            '/edit_pati': (context) => EditPatient(),
            '/m': (context) => MyWidget(),
            '/AbnormalSymptoms': (context) => AbnormalSymptoms(),
            '/communicationway': (context) => comunicationWays(),
            '/personal_info_to_pat': (context) => patientProf_to_pat(),
            '/all_appointment': (context) => appointments(),
          },
          // initialRoute: '/signinpatient',
          initialRoute: '/main',
        );
        ;
      },
    );

    //MaterialApp(

    //  theme: ThemeData(
    //   primaryColor:BlocProvider.of<AuthCubit>(context).swvalue==false?Colors.white:
    //   Colors.black
    //  ),
  }
}

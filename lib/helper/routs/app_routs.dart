import 'package:deaf_mute_clinic/view/screens/authontcation/regesrration/registration_screen.dart';
import 'package:deaf_mute_clinic/view/screens/doctor/doctor_home_page.dart';
import 'package:deaf_mute_clinic/view/screens/patient/patient_home_page.dart';
import 'package:deaf_mute_clinic/view/screens/patient/patient_record_screen.dart';
import 'package:deaf_mute_clinic/view/screens/patient/patient_report_screen.dart';
import 'package:deaf_mute_clinic/view/screens/splash/splash_page.dart';
import 'package:deaf_mute_clinic/view_model/authontcation/cubit/regestration_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../view/screens/doctor/all_patients_screen.dart';
import '../../view/screens/doctor/doctor_report_screen.dart';
import '../../view/screens/main_screen.dart';
import 'routs_name.dart';

class AppRouts {
  Route? genirateRoute(RouteSettings settings, {String? uId}) {
    switch (settings.name) {
      case RoutsNames.mainSplash:
        return MaterialPageRoute(builder: (_) => const MainSplashScrrn());
      case RoutsNames.start:
        return MaterialPageRoute(builder: (_) => const MainScreen());
      case RoutsNames.patientReport:
        return MaterialPageRoute(builder: (_) => const PatientReportScreen());
      case RoutsNames.doctorReport:
        return MaterialPageRoute(
            builder: (_) => DoctorReportScreen(
                  uId: uId.toString(),
                ));
      case RoutsNames.doctorHome:
        return MaterialPageRoute(builder: (_) => const DoctorHomePage());
      case RoutsNames.patientHome:
        return MaterialPageRoute(builder: (_) => PatientHomePage());
      case RoutsNames.allPatientsScreen:
        return MaterialPageRoute(builder: (_) => const AllPatientsScreen());
      case RoutsNames.patientRecord:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => RegistrationCubit(),
                  child: PatientRecordScreen(),
                ));

      case RoutsNames.registration:
        String argument = settings.arguments as String;
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => RegistrationCubit(),
                  child: RegistrationScreen(argument: argument),
                ));
    }
    return null;
  }
}

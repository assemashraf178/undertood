import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:deaf_mute_clinic/helper/constant/constant.dart';
import 'package:deaf_mute_clinic/helper/theme/theme.dart';
import 'package:deaf_mute_clinic/view/screens/doctor/doctor_home_page.dart';
import 'package:deaf_mute_clinic/view/screens/main_screen.dart';
import 'package:deaf_mute_clinic/view/screens/patient/patient_home_page.dart';
import 'package:deaf_mute_clinic/view/widget/custom_text.dart';
import 'package:flutter/material.dart';

class MainSplashScrrn extends StatefulWidget {
  const MainSplashScrrn({Key? key}) : super(key: key);

  @override
  State<MainSplashScrrn> createState() => _MainSplashScrrnState();
}

class _MainSplashScrrnState extends State<MainSplashScrrn> {
  @override
  Widget build(BuildContext context) {
    Widget? widget;
    if (((patientUId.isEmpty) && (doctorUId.isEmpty))) {
      widget = const MainScreen();
    } else if (doctorUId.isEmpty) {
      widget = PatientHomePage();
    } else {
      widget = const DoctorHomePage();
    }
    return AnimatedSplashScreen(
        centered: true,
        splashIconSize: 200,
        duration: 300,
        splash: CustomText(
            text: "UnderStood".toUpperCase(),
            fontSise: 30,
            fontWeight: FontWeight.bold,
            color: ColorsApp.white),
        nextScreen: widget,
        splashTransition: SplashTransition.fadeTransition,
        backgroundColor: ColorsApp.appBarColor);
  }
}

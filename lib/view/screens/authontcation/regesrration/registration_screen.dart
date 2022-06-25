import 'package:deaf_mute_clinic/helper/theme/theme.dart';
import 'package:flutter/material.dart';

import '../../../widget/custom_text.dart';
import '../login_doctor.dart';
import '../login_patient.dart';
import '../signup_doctor.dart';
import '../signup_patient.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({Key? key, this.argument}) : super(key: key);

  final String? argument;
  TabBar get _tabBar => const TabBar(
        labelColor: ColorsApp.white,
        indicatorColor: Color.fromARGB(255, 7, 83, 92),
        labelStyle: TextStyle(
          fontSize: 20, fontWeight: FontWeight.w600,
          // backgroundColor: Colors.white
        ),
        tabs: [
          Tab(
            text: "Log In",
          ),
          Tab(
            text: "Sign Up",
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 2,
          backgroundColor: ColorsApp.appBarColor,
          toolbarHeight: 140,
          title: Column(
            children: const [
              CustomText(
                text: "UNDERSTOOD",
                fontSise: 30.0,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(
                height: 10,
              ),
              CustomText(
                text: "think about your health",
                fontSise: 15.0,
                fontWeight: FontWeight.bold,
              ),
            ],
          ),
          bottom: PreferredSize(
            preferredSize: _tabBar.preferredSize,
            child: ColoredBox(
              color: ColorsApp.appBarColor,
              child: _tabBar,
            ),
          ),
        ),
        body: TabBarView(
          children: [
            argument == "patient"
                ? LogInScreenForPatient()
                : const LogInScreenForDoctor(),
            argument == "doctor"
                ? const SignUpScreenForDoctor()
                : SignUpScreenForPatient(),
          ],
        ),
      ),
    );
  }
}

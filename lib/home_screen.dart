import 'package:deaf_mute_clinic/conversion/conversion_page.dart';
import 'package:deaf_mute_clinic/helper/theme/theme.dart';
import 'package:deaf_mute_clinic/view/screens/doctor/doctor_home_page.dart';
import 'package:deaf_mute_clinic/view/screens/main_screen.dart';
import 'package:deaf_mute_clinic/view/screens/patient/patient_home_page.dart';
import 'package:deaf_mute_clinic/view/widget/custom_button.dart';
import 'package:deaf_mute_clinic/view/widget/custom_curve.dart';
import 'package:flutter/material.dart';

import 'helper/constant/constant.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);
  Widget? widget;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (((patientUId.isEmpty) && (doctorUId.isEmpty))) {
      widget.widget = const MainScreen();
    } else if (doctorUId.isEmpty) {
      widget.widget = PatientHomePage();
    } else {
      widget.widget = const DoctorHomePage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        centerTitle: true,
        backgroundColor: ColorsApp.appBarColor,
      ),
      body: Stack(
        children: [
          Background(),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomButton(
                  text: 'Home App',
                  ontap: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (_) => widget.widget as Widget),
                        (route) => false);
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                CustomButton(
                  text: 'Conversion App',
                  ontap: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (_) => ConversionPage()),
                        (route) => false);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

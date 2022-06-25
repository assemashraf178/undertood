import 'package:deaf_mute_clinic/view/widget/custom_curve.dart';
import 'package:flutter/material.dart';
import '../../helper/routs/routs_name.dart';
import '../widget/custom_button.dart';
class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Background(),
          SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 40,
                ),
                CustomButton(
                  ontap: () {
                    Navigator.pushReplacementNamed(context, RoutsNames.registration,
                        arguments: "patient");
                  },
                  text: "Patient",
                ),
                const SizedBox(
                  height: 25,
                ),
                CustomButton(
                  text: "Doctor",
                  ontap: () {
                    Navigator.pushReplacementNamed(context, RoutsNames.registration,
                        arguments: "doctor");
                  },
                ),
                const SizedBox(
                  height: 25,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

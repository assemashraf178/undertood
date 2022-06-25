import 'package:deaf_mute_clinic/helper/constant/constant.dart';
import 'package:deaf_mute_clinic/helper/notifications.dart';
import 'package:deaf_mute_clinic/helper/theme/theme.dart';
import 'package:deaf_mute_clinic/view/widget/custom_curve.dart';
import 'package:deaf_mute_clinic/view/widget/custom_text.dart';
import 'package:deaf_mute_clinic/view_model/doctor/cubit/doctor_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../helper/routs/routs_name.dart';
import '../../widget/custom_button.dart';

class DoctorHomePage extends StatefulWidget {
  const DoctorHomePage({Key? key}) : super(key: key);

  @override
  State<DoctorHomePage> createState() => _DoctorHomePageState();
}

class _DoctorHomePageState extends State<DoctorHomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    DoctorCubit.get(context).doctorGetData();
    DoctorCubit.get(context).getAllPatients();
  }

  // @override
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DoctorCubit, DoctorState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
              elevation: 0.0,
              backgroundColor: ColorsApp.appBarColor,
              actions: [
                IconButton(
                    onPressed: () {
                      Notifications.dialog(
                        context,
                        child: AlertDialog(
                            backgroundColor: ColorsApp.appBarColor,
                            title: const Center(
                              child: Text(
                                "Are your sure to log out ?",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 22),
                              ),
                            ),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    doctorSignOut(context);
                                  },
                                  child: const CustomText(
                                    text: "Ok",
                                    fontWeight: FontWeight.bold,
                                  )),
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const CustomText(
                                    text: "Cancel",
                                    fontWeight: FontWeight.bold,
                                  ))
                            ],
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(100),
                                bottomLeft: Radius.circular(100),
                                topRight: Radius.circular(130),
                              ),
                            )),
                      );
                    },
                    icon: const Icon(Icons.logout_outlined)),
              ]),
          body: state is! GetAllPatientDataLoadingState &&
                  state is! DoctorUserGetDataLoadingState
              ? Stack(
                  children: [
                    Background(),
                    SizedBox(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          Column(
                            children: [
                              const CircleAvatar(
                                radius: 55,
                                backgroundImage: AssetImage(
                                    "assets/images/unknown-person.jpg"),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              CustomText(
                                text:
                                    "Hello Dr ${DoctorCubit.get(context).doctorUserModel?.name}",
                                // text: "Hello, My Dear Mariam ",
                                color: ColorsApp.black,
                                fontSise: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          CustomButton(
                            ontap: () {
                              showModalBottomSheet(
                                  barrierColor:
                                      ColorsApp.primaryColor.withOpacity(.9),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                  context: context,
                                  builder: (context) => SizedBox(
                                        height: 240,
                                        child: Column(
                                          children: [
                                            ListTile(
                                              leading: const CustomText(
                                                text: " Monday at : ",
                                                color: ColorsApp.black,
                                                fontSise: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              title: const CustomText(
                                                  text: "8.00  Pm",
                                                  color: ColorsApp.black),
                                              trailing: CustomText(
                                                text: DoctorCubit.get(context)
                                                    .doctorUserModel
                                                    ?.name
                                                    .toString(),
                                                fontSise: 17,
                                                fontWeight: FontWeight.w700,
                                                color: ColorsApp.appBarColor,
                                              ),
                                            ),
                                            const ListTile(
                                              leading: CustomText(
                                                text: " Friday at : ",
                                                color: ColorsApp.black,
                                                fontSise: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              title: CustomText(
                                                  text: "10.00  Am",
                                                  color: ColorsApp.black),
                                              trailing: CustomText(
                                                text: " Ahmed Aly",
                                                fontSise: 17,
                                                fontWeight: FontWeight.w700,
                                                color: ColorsApp.appBarColor,
                                              ),
                                            ),
                                            const ListTile(
                                              leading: CustomText(
                                                text: " Saturday at : ",
                                                color: ColorsApp.black,
                                                fontSise: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              title: CustomText(
                                                  text: "12.00  Am",
                                                  color: ColorsApp.black),
                                              trailing: CustomText(
                                                text: " Mohamed Zydan",
                                                fontSise: 17,
                                                fontWeight: FontWeight.w700,
                                                color: ColorsApp.appBarColor,
                                              ),
                                            )
                                          ],
                                        ),
                                      ));
                            },
                            text: "Your Time Table",
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          CustomButton(
                            text: "Your Record",
                            ontap: () {
                              Navigator.pushNamed(
                                context,
                                RoutsNames.allPatientsScreen,
                              );
                            },
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              : const Center(
                  child: CircularProgressIndicator(),
                ),
        );
      },
    );
  }
}

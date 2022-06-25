import 'package:deaf_mute_clinic/helper/constant/constant.dart';
import 'package:deaf_mute_clinic/helper/notifications.dart';
import 'package:deaf_mute_clinic/helper/theme/theme.dart';
import 'package:deaf_mute_clinic/view/widget/custom_curve.dart';
import 'package:deaf_mute_clinic/view/widget/custom_text.dart';
import 'package:deaf_mute_clinic/view/widget/custom_text_form_feild.dart';
import 'package:deaf_mute_clinic/view_model/patient/cubit/patient_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../helper/routs/routs_name.dart';
import '../../widget/custom_button.dart';

// ignore: must_be_immutable
class PatientHomePage extends StatelessWidget {
  PatientHomePage({Key? key}) : super(key: key);
  var sugarPrecentageController = TextEditingController();
  var bloodPressureController = TextEditingController();
  var heartBeatsController = TextEditingController();
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();
  String? userId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PatientCubit()..getPatientData(),
      child: BlocConsumer<PatientCubit, PatientState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
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
                              style:
                                  TextStyle(color: Colors.white, fontSize: 22),
                            )),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    patientSignOut(context);
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
              ],
            ),
            body: state is! PatientGetDataLoadingState
                ? Stack(
                    children: [
                      Background(),
                      SizedBox(
                        width: double.infinity,
                        child: SingleChildScrollView(
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
                                        "Hello, My Dear ${PatientCubit.get(context).patientUserModel!.name}",
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
                                        children: const [
                                          ListTile(
                                            leading: CustomText(
                                              text: " Monday. at : ",
                                              color: ColorsApp.black,
                                              fontSise: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            title: CustomText(
                                                text: "8.00  Pm",
                                                color: ColorsApp.black),
                                          ),
                                          ListTile(
                                            leading: CustomText(
                                              text: " Friday. at : ",
                                              color: ColorsApp.black,
                                              fontSise: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            title: CustomText(
                                                text: "10.00  Am",
                                                color: ColorsApp.black),
                                          ),
                                          ListTile(
                                            leading: CustomText(
                                              text: " Saturday. at : ",
                                              color: ColorsApp.black,
                                              fontSise: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            title: CustomText(
                                                text: "12.00  Am",
                                                color: ColorsApp.black),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
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
                                    RoutsNames.patientReport,
                                  );
                                },
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              CustomButton(
                                text: "Add sugar percentage",
                                ontap: () {
                                  showDialog(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        backgroundColor: const Color.fromARGB(
                                            255, 237, 237, 237),
                                        title: const Center(
                                            child: Text(
                                          " What is the sugar level today?",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 22),
                                        )),
                                        content: CustomTextField(
                                          keyBordType: TextInputType.number,
                                          lableText: "Sugar Percentage",
                                          controller: sugarPrecentageController,
                                        ),
                                        actions: [
                                          TextButton(
                                              onPressed: () async {
                                                PatientCubit.get(context)
                                                    .patientAddSugarRate(
                                                        sugar:
                                                            sugarPrecentageController
                                                                .text,
                                                        dateTime: DateTime.now()
                                                            .toString());
                                                sugarPrecentageController.text =
                                                    '';
                                                Navigator.of(context).pop();
                                              },
                                              child: const Text("OK")),
                                          TextButton(
                                              onPressed: () {
                                                sugarPrecentageController.text =
                                                    '';
                                                Navigator.of(context).pop();
                                              },
                                              child: const Text("Cancel"))
                                        ],
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              /*CustomButton(
                          text: " Embeded System ",
                          ontap: () {
                            showDialog(
                                context: context,
                                barrierDismissible: true,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                      backgroundColor: const Color.fromARGB(
                                          255, 237, 237, 237),
                                      title: const Center(
                                          child: Text(
                                        " Add Blood Pressure & Heart beats?",
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 22),
                                      )),
                                      content: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            CustomTextField(
                                              keyBordType: TextInputType.number,
                                              lableText: "Blood Pressure",
                                              controller:
                                                  bloodPressureController,
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            CustomTextField(
                                              keyBordType: TextInputType.number,
                                              lableText: "Heart beats",
                                              controller: heartBeatsController,
                                            ),
                                          ]),
                                      actions: [
                                        TextButton(
                                            onPressed: () {},
                                            child: const Text("OK")),
                                        TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: const Text("Cancel"))
                                      ],
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ));
                                });
                          },
                        ),*/
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  ),
          );
        },
      ),
    );
  }
}

import 'package:deaf_mute_clinic/helper/notifications.dart';
import 'package:deaf_mute_clinic/helper/routs/routs_name.dart';
import 'package:deaf_mute_clinic/helper/theme/theme.dart';
import 'package:deaf_mute_clinic/view/widget/custom_text.dart';
import 'package:deaf_mute_clinic/view/widget/custom_text_form_feild.dart';
import 'package:deaf_mute_clinic/view_model/authontcation/cubit/regestration_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PatientRecordScreen extends StatefulWidget {
  @override
  State<PatientRecordScreen> createState() => _PatientRecordScreenState();
}

class _PatientRecordScreenState extends State<PatientRecordScreen> {
  bool blindValue = false;
  bool deafValue = false;
  bool bothValue = false;
  bool physicalDisabilityNoValue = false;
  bool physicalDisabilityYesValue = false;
  bool adultValue = false;
  bool childValue = false;
  bool yesValue = false;
  bool noValue = false;
  bool goToDoctor = false;

  var dateController = TextEditingController();
  var whyC = TextEditingController();
  var patientNameController = TextEditingController();
  var obstructionController = TextEditingController();
  var homePhoneController = TextEditingController();
  var mobilePhoneController = TextEditingController();
  var ageController = TextEditingController();
  var emailController = TextEditingController();
  var addressController = TextEditingController();
  var doctorTimeController = TextEditingController();

  void validationInput() async {
    if (dateController.text.isEmpty) {
      Notifications.error('You must enter date');
    } else if (patientNameController.text.isEmpty) {
      Notifications.error('You must enter patientName');
    } else if (obstructionController.text.isEmpty) {
      Notifications.error('You must enter obstruction');
    } else if (homePhoneController.text.isEmpty) {
      Notifications.error('You must enter homePhone');
    } else if (mobilePhoneController.text.isEmpty) {
      Notifications.error('You must enter mobilePhone');
    } else if (ageController.text.isEmpty) {
      Notifications.error('You must enter age');
    } else if (emailController.text.isEmpty) {
      Notifications.error('You must enter email');
    } else if (addressController.text.isEmpty) {
      Notifications.error('You must enter address');
    } else {
      RegistrationCubit.get(context).patientAddRecord(
        patientName: patientNameController.text,
        email: emailController.text,
        patientAge: ageController.text,
        mobilePhone: mobilePhoneController.text,
        homePhone: homePhoneController.text,
        lifeStage: childValue ? "Child" : "Adult",
        address: addressController.text,
        obstruction: obstructionController.text,
        date: DateTime.now().toString().substring(0, 16),
        whyPhysical: whyC.text,
        physical: physicalDisabilityYesValue == true ? 'Yes' : 'No',
        challenge: bothValue == true
            ? 'Deaf and Blind'
            : deafValue == true
                ? 'Deaf'
                : 'Blind',
        goToDoctor: goToDoctor == true ? 'Yes' : 'No',
        timeOfDoctor: doctorTimeController.text,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegistrationCubit, RegistrationState>(
      listener: ((context, state) {
        if (state is AddRecordSuccessState) {
          Navigator.pushReplacementNamed(context, RoutsNames.patientHome);
        }
      }),
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: ColorsApp.appBarColor,
            title: const Text("Patient Appointment Reqest"),
          ),
          body: Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  state is AddRecordLoadingState
                      ? const LinearProgressIndicator()
                      : Container(),
                  Row(
                    children: [
                      childValue
                          ? Container()
                          : Row(
                              children: [
                                Checkbox(
                                    value: adultValue,
                                    activeColor: ColorsApp.primaryColor,
                                    onChanged: (newValue) {
                                      setState(() {
                                        adultValue = newValue!;
                                      });
                                    }),
                                const CustomText(
                                  text: "Adult",
                                  color: ColorsApp.black,
                                ),
                              ],
                            ),
                      adultValue
                          ? Container()
                          : Row(
                              children: [
                                Checkbox(
                                    value: childValue,
                                    activeColor: ColorsApp.primaryColor,
                                    onChanged: (newValue) {
                                      setState(() {
                                        childValue = newValue!;
                                      });
                                    }),
                                const CustomText(
                                  text: "Child",
                                  color: ColorsApp.black,
                                ),
                              ],
                            ),
                    ],
                  ),
                  Row(
                    children: [
                      const CustomText(
                        text: "Physical disability ",
                        color: ColorsApp.black,
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      physicalDisabilityNoValue
                          ? Container()
                          : Row(
                              children: [
                                Checkbox(
                                    value: physicalDisabilityYesValue,
                                    activeColor: ColorsApp.primaryColor,
                                    onChanged: (newValue) {
                                      setState(() {
                                        physicalDisabilityYesValue = newValue!;
                                      });
                                    }),
                                const CustomText(
                                  text: "Yes",
                                  color: ColorsApp.black,
                                ),
                              ],
                            ),
                      physicalDisabilityYesValue
                          ? Container()
                          : Row(
                              children: [
                                Checkbox(
                                    value: physicalDisabilityNoValue,
                                    activeColor: ColorsApp.primaryColor,
                                    onChanged: (newValue) {
                                      setState(() {
                                        physicalDisabilityNoValue = newValue!;
                                      });
                                    }),
                                const CustomText(
                                  text: "No",
                                  color: ColorsApp.black,
                                ),
                              ],
                            ),
                    ],
                  ),
                  physicalDisabilityYesValue
                      ? Container(
                          child: CustomTextField(
                            lableText: 'Why',
                            controller: whyC,
                          ),
                        )
                      : Container(),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      const CustomText(
                        text: "You go to Doctor? ",
                        color: ColorsApp.black,
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Row(
                        children: [
                          Checkbox(
                              value: goToDoctor,
                              activeColor: ColorsApp.primaryColor,
                              onChanged: (newValue) {
                                setState(() {
                                  goToDoctor = newValue!;
                                });
                              }),
                          const CustomText(
                            text: "Yes",
                            color: ColorsApp.black,
                          ),
                        ],
                      ),
                    ],
                  ),
                  goToDoctor
                      ? CustomTextField(
                          controller: doctorTimeController,
                          lableText: 'Doctor Time',
                        )
                      : Container(),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      const CustomText(
                        text: "Challenge",
                        color: ColorsApp.black,
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Visibility(
                        visible: blindValue || deafValue ? false : true,
                        child: Row(
                          children: [
                            Checkbox(
                                value: bothValue,
                                activeColor: ColorsApp.primaryColor,
                                onChanged: (newValue) {
                                  setState(() {
                                    bothValue = newValue!;
                                  });
                                }),
                            const CustomText(
                              text: "Both",
                              color: ColorsApp.black,
                            ),
                          ],
                        ),
                      ),
                      Visibility(
                        visible: blindValue || bothValue ? false : true,
                        child: Row(
                          children: [
                            Checkbox(
                                value: deafValue,
                                activeColor: ColorsApp.primaryColor,
                                onChanged: (newValue) {
                                  setState(() {
                                    deafValue = newValue!;
                                  });
                                }),
                            const CustomText(
                              text: "deaf",
                              color: ColorsApp.black,
                            ),
                          ],
                        ),
                      ),
                      Visibility(
                        visible: deafValue || bothValue ? false : true,
                        child: Row(
                          children: [
                            Checkbox(
                                value: blindValue,
                                activeColor: ColorsApp.primaryColor,
                                onChanged: (newValue) {
                                  setState(() {
                                    blindValue = newValue!;
                                  });
                                }),
                            const CustomText(
                              text: "blind",
                              color: ColorsApp.black,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextField(
                    readOnly: true,
                    lableText: "Birth Date",
                    controller: dateController,
                    onTap: () {
                      showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.parse('1920-10-08'),
                        lastDate: DateTime.parse('2030-10-03'),
                      ).then((value) {
                        dateController.text = DateFormat.yMMMd().format(value!);
                        // dateController.text = value.toString();
                      });
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextField(
                    lableText: "Patient Name",
                    controller: patientNameController,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextField(
                    lableText: "Your obstruction?",
                    controller: obstructionController,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextField(
                    keyBordType: TextInputType.phone,
                    lableText: "Age",
                    controller: ageController,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextField(
                    keyBordType: TextInputType.phone,
                    lableText: "Home Phone",
                    controller: homePhoneController,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextField(
                    keyBordType: TextInputType.phone,
                    lableText: "Mobile Phone",
                    controller: mobilePhoneController,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextField(
                    lableText: "Email",
                    controller: emailController,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextField(
                    lableText: "Address",
                    controller: addressController,
                  ),
                ],
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: ColorsApp.appBarColor,
            onPressed: () async {
              validationInput();
            },
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}

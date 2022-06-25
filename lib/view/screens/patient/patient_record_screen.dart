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
  bool nourthValue = false;
  bool southValue = false;
  bool yesValue = false;
  bool noValue = false;
  bool hospitlizationValue = false;
  bool testingValue = false;
  bool eitingCurrentValue = false;
  bool eitingpastValue = false;
  bool suicalCurrentValue = false;
  bool suicalPastValue = false;
  bool thoughtsCurrentValue = false;
  bool thoughtsPastValue = false;

  var dateController = TextEditingController();
  var whyC = TextEditingController();
  var previosExplaneController = TextEditingController();
  var referredByController = TextEditingController();

  var thoughtExplainController = TextEditingController();
  var eatingHowLongAgodateController = TextEditingController();
  var suicidalHowLongController = TextEditingController();
  var personeNameController = TextEditingController();
  var patientNameController = TextEditingController();
  var sugarController = TextEditingController();

  var obstructionController = TextEditingController();

  var homePhoneController = TextEditingController();
  var mobilePhoneController = TextEditingController();
  var dobController = TextEditingController();
  var ageController = TextEditingController();
  var emailController = TextEditingController();

  var adressController = TextEditingController();
  var reasonAppointmentController = TextEditingController();
  var whoController = TextEditingController();
  var seeingHowLongController = TextEditingController();
  var cureentlyMedicationController = TextEditingController();

  void validationInput() async {
    if (dateController.text.isEmpty) {
      Notifications.error('You must enter date');
    } else if (previosExplaneController.text.isEmpty) {
      Notifications.error('You must enter previous Explain');
    } else if (referredByController.text.isEmpty) {
      Notifications.error('You must enter referredBy');
    } else if (thoughtExplainController.text.isEmpty) {
      Notifications.error('You must enter thoughtExplain');
    } else if (eatingHowLongAgodateController.text.isEmpty) {
      Notifications.error('You must enter eating How Long Agate');
    } else if (personeNameController.text.isEmpty) {
      Notifications.error('You must enter person Name');
    } else if (patientNameController.text.isEmpty) {
      Notifications.error('You must enter patientName');
    } else if (sugarController.text.isEmpty) {
      Notifications.error('You must enter sugar');
    } else if (obstructionController.text.isEmpty) {
      Notifications.error('You must enter obstruction');
    } else if (homePhoneController.text.isEmpty) {
      Notifications.error('You must enter homePhone');
    } else if (mobilePhoneController.text.isEmpty) {
      Notifications.error('You must enter mobilePhone');
    } else if (dobController.text.isEmpty) {
      Notifications.error('You must enter dob');
    } else if (ageController.text.isEmpty) {
      Notifications.error('You must enter age');
    } else if (emailController.text.isEmpty) {
      Notifications.error('You must enter email');
    } else if (adressController.text.isEmpty) {
      Notifications.error('You must enter address');
    } else if (reasonAppointmentController.text.isEmpty) {
      Notifications.error('You must enter reasonAppointment');
    } else {
      RegistrationCubit.get(context).patientAddRecord(
        patientName: patientNameController.text,
        email: emailController.text,
        aatientAge: ageController.text,
        dOb: dobController.text,
        mobilePhone: mobilePhoneController.text,
        homePhone: homePhoneController.text,
        lifestage: childValue ? "Child" : "Adult",
        preferredLocation: nourthValue ? "North" : "South",
        referredby: referredByController.text,
        namePersonCompleting: personeNameController.text,
        address: adressController.text,
        reasonforappointment: reasonAppointmentController.text,
        currentSeeingTherapist: yesValue ? "Yes" : "No",
        currentSeeingTherapistWho: whoController.text,
        currentSeeingTherapistHowLong: seeingHowLongController.text,
        currentlyMedicationsAndDosage: cureentlyMedicationController.text,
        previousPsychiatric:
            hospitlizationValue ? "Hospitalization" : "Testing",
        previousPsychiatricExplain: previosExplaneController.text,
        eatingDiorder: eitingCurrentValue ? "Current" : "Past",
        eatingDiorderHowLongAgo: eatingHowLongAgodateController.text,
        suicidalleation: suicalCurrentValue ? "Current" : "Past",
        suicidalleationHowLongAgo: suicidalHowLongController.text,
        thoughtsOfHurmingOthers: thoughtsCurrentValue ? "Current" : "Past",
        thoughtsOfHurmingOthersExplain: thoughtExplainController.text,
        sugarRate: sugarController.text,
        obstruction: obstructionController.text,
        date: DateTime.now().toString(),
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
                        text: "Preferred",
                        color: ColorsApp.black,
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      southValue
                          ? Container()
                          : Row(
                              children: [
                                Checkbox(
                                    value: nourthValue,
                                    activeColor: ColorsApp.primaryColor,
                                    onChanged: (newValue) {
                                      setState(() {
                                        nourthValue = newValue!;
                                      });
                                    }),
                                const CustomText(
                                  text: "North",
                                  color: ColorsApp.black,
                                ),
                              ],
                            ),
                      nourthValue
                          ? Container()
                          : Row(
                              children: [
                                Checkbox(
                                    value: southValue,
                                    activeColor: ColorsApp.primaryColor,
                                    onChanged: (newValue) {
                                      setState(() {
                                        southValue = newValue!;
                                      });
                                    }),
                                const CustomText(
                                  text: "South",
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
                    lableText: "Referred by ?",
                    controller: referredByController,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextField(
                    lableText: "Name person completing?",
                    controller: personeNameController,
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
                    keyBordType: TextInputType.phone,
                    lableText: "your sugar rate ?",
                    controller: sugarController,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextField(
                    lableText: "Your obstraction?",
                    controller: obstructionController,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextField(
                    lableText: "DOB",
                    controller: dobController,
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
                    lableText: "Mpbile Phone",
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
                    controller: adressController,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextField(
                    lableText: "Reason For Appoinment",
                    controller: reasonAppointmentController,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      const CustomText(
                        text: "Currently seeing a Therapist",
                        color: ColorsApp.black,
                      ),
                      noValue
                          ? Container()
                          : Row(
                              children: [
                                Checkbox(
                                    value: yesValue,
                                    activeColor: ColorsApp.primaryColor,
                                    onChanged: (newValue) {
                                      setState(() {
                                        yesValue = newValue!;
                                      });
                                    }),
                                const CustomText(
                                  text: "Yes",
                                  color: ColorsApp.black,
                                ),
                              ],
                            ),
                      yesValue
                          ? Container()
                          : Row(
                              children: [
                                Checkbox(
                                    value: noValue,
                                    activeColor: ColorsApp.primaryColor,
                                    onChanged: (newValue) {
                                      setState(() {
                                        noValue = newValue!;
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
                  yesValue
                      ? Row(
                          children: [
                            Expanded(
                              child: CustomTextField(
                                lableText: "Who ",
                                controller: whoController,
                              ),
                            ),
                            const SizedBox(
                              width: 5.0,
                            ),
                            Expanded(
                              child: CustomTextField(
                                keyBordType: TextInputType.phone,
                                lableText: "How Long",
                                controller: seeingHowLongController,
                              ),
                            ),
                          ],
                        )
                      : Container(),
                  CustomTextField(
                    lableText: "Current Medications and dosage",
                    controller: cureentlyMedicationController,
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    children: [
                      const CustomText(
                        text: " Psychiatric",
                        color: ColorsApp.black,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      testingValue
                          ? Container()
                          : Expanded(
                              child: Row(
                                children: [
                                  Checkbox(
                                      value: hospitlizationValue,
                                      activeColor: ColorsApp.primaryColor,
                                      onChanged: (newValue) {
                                        setState(() {
                                          hospitlizationValue = newValue!;
                                        });
                                      }),
                                  const CustomText(
                                    text: "Hospitalize",
                                    color: ColorsApp.black,
                                  ),
                                ],
                              ),
                            ),
                      hospitlizationValue
                          ? Container()
                          : Expanded(
                              child: Row(
                                children: [
                                  Checkbox(
                                      value: testingValue,
                                      activeColor: ColorsApp.primaryColor,
                                      onChanged: (newValue) {
                                        setState(() {
                                          testingValue = newValue!;
                                        });
                                      }),
                                  const CustomText(
                                    text: "Testing",
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
                    lableText: "Explain",
                    controller: previosExplaneController,
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    children: [
                      const CustomText(
                        text: " Eating Disorder",
                        color: ColorsApp.black,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      eitingCurrentValue
                          ? Container()
                          : Expanded(
                              child: Row(
                                children: [
                                  Checkbox(
                                      value: eitingpastValue,
                                      activeColor: ColorsApp.primaryColor,
                                      onChanged: (newValue) {
                                        setState(() {
                                          eitingpastValue = newValue!;
                                        });
                                      }),
                                  const CustomText(
                                    text: "Past",
                                    color: ColorsApp.black,
                                  ),
                                ],
                              ),
                            ),
                      eitingpastValue
                          ? Container()
                          : Expanded(
                              child: Row(
                                children: [
                                  Checkbox(
                                      value: eitingCurrentValue,
                                      activeColor: ColorsApp.primaryColor,
                                      onChanged: (newValue) {
                                        setState(() {
                                          eitingCurrentValue = newValue!;
                                        });
                                      }),
                                  const CustomText(
                                    text: "Current",
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
                    lableText: "How long ago",
                    controller: eatingHowLongAgodateController,
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    children: [
                      const CustomText(
                        text: " Suicidal",
                        color: ColorsApp.black,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      suicalCurrentValue
                          ? Container()
                          : Expanded(
                              child: Row(
                                children: [
                                  Checkbox(
                                      value: suicalPastValue,
                                      activeColor: ColorsApp.primaryColor,
                                      onChanged: (newValue) {
                                        setState(() {
                                          suicalPastValue = newValue!;
                                        });
                                      }),
                                  const CustomText(
                                    text: "Past",
                                    color: ColorsApp.black,
                                  ),
                                ],
                              ),
                            ),
                      suicalPastValue
                          ? Container()
                          : Expanded(
                              child: Row(
                                children: [
                                  Checkbox(
                                      value: suicalCurrentValue,
                                      activeColor: ColorsApp.primaryColor,
                                      onChanged: (newValue) {
                                        setState(() {
                                          suicalCurrentValue = newValue!;
                                        });
                                      }),
                                  const CustomText(
                                    text: "Current",
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
                    lableText: "How long ago",
                    controller: suicidalHowLongController,
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    children: [
                      const CustomText(
                        text: " Thoughts",
                        color: ColorsApp.black,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      thoughtsCurrentValue
                          ? Container()
                          : Expanded(
                              child: Row(
                                children: [
                                  Checkbox(
                                      value: thoughtsPastValue,
                                      activeColor: ColorsApp.primaryColor,
                                      onChanged: (newValue) {
                                        setState(() {
                                          thoughtsPastValue = newValue!;
                                        });
                                      }),
                                  const CustomText(
                                    text: "Past",
                                    color: ColorsApp.black,
                                  ),
                                ],
                              ),
                            ),
                      thoughtsPastValue
                          ? Container()
                          : Expanded(
                              child: Row(
                                children: [
                                  Checkbox(
                                      value: thoughtsCurrentValue,
                                      activeColor: ColorsApp.primaryColor,
                                      onChanged: (newValue) {
                                        setState(() {
                                          thoughtsCurrentValue = newValue!;
                                        });
                                      }),
                                  const CustomText(
                                    text: "Current",
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
                    lableText: "Explain",
                    controller: thoughtExplainController,
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

import 'package:deaf_mute_clinic/helper/theme/theme.dart';
import 'package:deaf_mute_clinic/model/patient/patient_record_model.dart';
import 'package:deaf_mute_clinic/model/patient/suger.dart';
import 'package:deaf_mute_clinic/view/widget/custom_text.dart';
import 'package:deaf_mute_clinic/view_model/patient/cubit/patient_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../model/comment.dart';

class PatientReportScreen extends StatefulWidget {
  const PatientReportScreen({Key? key}) : super(key: key);

  @override
  State<PatientReportScreen> createState() => _PatientReportScreenState();
}

class _PatientReportScreenState extends State<PatientReportScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    PatientCubit.get(context).patientGetRecord();
    PatientCubit.get(context).getAllComments();
    PatientCubit.get(context).getAllSugarRates();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PatientCubit, PatientState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return PatientCubit.get(context).patientRecordModel == null
            ? const CustomText(
                text: 'No record yet',
              )
            : Scaffold(
                appBar: AppBar(
                  backgroundColor: ColorsApp.appBarColor,
                  title: const CustomText(
                    text: "Your Report",
                    fontSise: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                body: buildReportWidget(
                    context, PatientCubit.get(context).patientRecordModel),
              );
      },
    );
  }
}

buildReportWidget(context, PatientRecordModel? patientRecordModel) {
  return SingleChildScrollView(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(
          height: 10,
        ),
        const CustomText(
          text: 'Comments',
          fontSise: 20.0,
          color: Colors.black,
          fontWeight: FontWeight.w900,
        ),
        const SizedBox(
          height: 10,
        ),
        if (PatientCubit.get(context).comments.isNotEmpty)
          ListView.builder(
            shrinkWrap: true,
            itemCount: PatientCubit.get(context).comments.length,
            itemBuilder: (context, index) {
              CommentModel? comment = PatientCubit.get(context).comments[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomText(
                  text:
                      'Doctor: ${comment.doctorName}\nhas comment in your report: ${comment.massage}',
                  color: Colors.blue.shade800,
                  fontWeight: FontWeight.bold,
                  fontSise: 20,
                ),
              );
            },
          ),
        if (PatientCubit.get(context).comments.isEmpty)
          const CustomText(
            text: 'No Comments Yet',
            color: Colors.black,
            fontSise: 20,
            fontWeight: FontWeight.bold,
          ),
        const SizedBox(
          height: 10,
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.all(8.0),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 239, 239, 239).withOpacity(.9),
              borderRadius: BorderRadius.circular(10)),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(parent: ScrollPhysics()),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildContanerItem(
                  context,
                  "Patient Name : ${patientRecordModel!.patientName ?? ''}",
                ),
                buildContanerItem(
                  context,
                  "Your obstruction  : ${patientRecordModel.obstruction ?? ''}",
                ),
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                      itemCount: PatientCubit.get(context).sugarRates.length,
                      itemBuilder: (context, index) {
                        SugarRate? rate =
                            PatientCubit.get(context).sugarRates[index];
                        return Column(
                          children: [
                            if (index == 0)
                              buildContanerItem(
                                context,
                                "Initial Rate :${patientRecordModel.sugarRate} ",
                              ),
                            CustomText(
                              text: 'This rate create at ${rate.dateTime}',
                              fontSise: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.teal,
                            ),
                            buildContanerItem(
                              context,
                              " Rate  :${rate.sugar} ",
                            ),
                          ],
                        );
                      }),
                ),
                buildContanerItem(
                  context,
                  "Email  : ${patientRecordModel.email ?? ''}",
                ),
                buildContanerItem(
                  context,
                  "Patient Age :${patientRecordModel.aatientAge ?? ''} ",
                ),
                buildContanerItem(
                  context,
                  "DOB : ${patientRecordModel.dOb ?? ''}",
                ),
                buildContanerItem(context,
                    "Mobile Phone : ${patientRecordModel.mobilePhone ?? ''}"),
                buildContanerItem(
                  context,
                  "Home Phone :${patientRecordModel.homePhone ?? ''}",
                ),
                buildContanerItem(
                  context,
                  //   report!.date,
                  "life stage : ${patientRecordModel.lifestage ?? ''}",
                ),
                buildContanerItem(
                  context,
                  "Preferred Location : ${patientRecordModel.preferredLocation ?? ''}",
                ),
                buildContanerItem(
                  context,
                  "Referred by :${patientRecordModel.referredby ?? ''}",
                ),
                buildContanerItem(
                  context,
                  "Name Person Completing : ${patientRecordModel.namePersonCompleting ?? ''}",
                ),
                buildContanerItem(
                  context,
                  "Address :${patientRecordModel.address ?? ''}",
                ),
                buildContanerItem(
                  context,
                  "Reason for appointment :${patientRecordModel.reasonforappointment ?? ''}",
                ),
                buildContanerItem(
                  context,
                  "Current seeing a Therapist  : ${patientRecordModel.currentSeeingTherapist ?? ''} ",
                ),
                buildContanerItem(
                  context,
                  "Who  :${patientRecordModel.currentSeeingTherapistWho ?? ''}",
                ),
                buildContanerItem(
                  context,
                  "How long  :${patientRecordModel.currentSeeingTherapistHowLong ?? ''}",
                ),
                buildContanerItem(
                  context,
                  "Currently medications and dosage  :${patientRecordModel.currentlyMedicationsAndDosage ?? ''}",
                ),
                buildContanerItem(
                  context,
                  "Previous Psychiatric :${patientRecordModel.previousPsychiatric ?? ''}",
                ),
                buildContanerItem(
                  context,
                  "Explain :${patientRecordModel.previousPsychiatricExplain ?? ''}",
                ),
                buildContanerItem(
                  context,
                  "Eating Diorder  :${patientRecordModel.eatingDiorder ?? ''}",
                ),
                buildContanerItem(
                  context,
                  "How long ago :${patientRecordModel.eatingDiorderHowLongAgo ?? ''}",
                ),
                buildContanerItem(
                  context,
                  "Suicidal leation  :${patientRecordModel.suicidalleation ?? ''}",
                ),
                buildContanerItem(
                  context,
                  "How long ago :${patientRecordModel.suicidalleationHowLongAgo ?? ''}",
                ),
                buildContanerItem(
                  context,
                  "Thoughts of hurming others :${patientRecordModel.thoughtsOfHurmingOthers ?? ''}",
                ),
                buildContanerItem(
                  context,
                  "Explain :${patientRecordModel.thoughtsOfHurmingOthersExplain ?? ''}",
                ),
                buildContanerItem(
                  context,
                  "Challenge :${patientRecordModel.challenge ?? ''}",
                ),
                buildContanerItem(
                  context,
                  "Physical :${patientRecordModel.physical ?? ''}",
                ),
                buildContanerItem(
                  context,
                  "whyPhysical :${patientRecordModel.whyPhysical ?? ''}",
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Widget buildContanerItem(context, text) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      CustomText(
        text: text,
        color: Colors.black,
        fontSise: 18,
        fontWeight: FontWeight.bold,
      ),
      const SizedBox(
        height: 8,
      ),
      Container(
        width: MediaQuery.of(context).size.width * .7,
        height: 1,
        color: ColorsApp.primaryColor,
      ),
      const SizedBox(
        height: 20,
      )
    ],
  );
}

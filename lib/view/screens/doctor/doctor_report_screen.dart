import 'package:deaf_mute_clinic/helper/notifications.dart';
import 'package:deaf_mute_clinic/helper/theme/theme.dart';
import 'package:deaf_mute_clinic/view/widget/custom_text.dart';
import 'package:deaf_mute_clinic/view/widget/custom_text_form_feild.dart';
import 'package:deaf_mute_clinic/view_model/doctor/cubit/doctor_cubit.dart';
import 'package:deaf_mute_clinic/view_model/patient/cubit/patient_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../model/patient/patient_record_model.dart';
import '../../../model/patient/patient_user_model.dart';

class DoctorReportScreen extends StatefulWidget {
  DoctorReportScreen({Key? key, required this.uId}) : super(key: key);
  final String uId;

  @override
  State<DoctorReportScreen> createState() => _DoctorReportScreenState();
}

class _DoctorReportScreenState extends State<DoctorReportScreen> {
  PatientUserModel? userModel;

  var commentC = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    DoctorCubit.get(context).getAllRecords(patientUid: widget.uId);
    DoctorCubit.get(context).getAllSugarRates(patientUid: widget.uId);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    userModel = null;
    PatientCubit.get(context).patientRecordModel = null;
    PatientCubit.get(context).sugarRates = [];
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DoctorCubit, DoctorState>(
      listener: (context, state) {
        // TODO: implement listener
        if (state is DoctorSendCommentSuccessState) {
          commentC.text = '';
          Notifications.success('send comment success');
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: ColorsApp.primaryColor,
          appBar: AppBar(
            backgroundColor: ColorsApp.appBarColor,
            title: const CustomText(
              text: "Your Record",
              fontSise: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          body: state is! GetAllPatientDataLoadingState &&
                  state is! GetAllSugarRatesDataLoadingState
              ? SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Column(
                      children: [
                        buildListViewItem(
                            context,
                            DoctorCubit.get(context).patientRecordModel,
                            commentC),
                      ],
                    ),
                  ))
              : const Center(
                  child: CircularProgressIndicator(),
                ),

          /*ListView.builder(
            itemCount: DoctorCubit.get(context).patientRecordModel!.length,
            itemBuilder: (context, index) => buildListViewItem(
              context,
              DoctorCubit.get(context).patientRecordModel[index],
              commentC,
            ),
          ),*/
        );
      },
    );
  }
}

Widget buildListViewItem(context, PatientRecordModel? patientRecordModel,
    TextEditingController commentC) {
  return Container(
    width: MediaQuery.of(context).size.width,
    margin: const EdgeInsets.all(8.0),
    padding: const EdgeInsets.all(8),
    decoration: BoxDecoration(
        color: Color.fromARGB(255, 239, 239, 239).withOpacity(.9),
        borderRadius: BorderRadius.circular(10)),
    child: SingleChildScrollView(
      physics: const BouncingScrollPhysics(parent: ScrollPhysics()),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildContanerItem(
            context,
            "Patient Name : ${patientRecordModel!.patientName}",
          ),
          buildContanerItem(
            context,
            "Your obstruction  : ${patientRecordModel.obstruction}",
          ),
          SizedBox(
            height: 200,
            child: ListView.builder(
              itemCount: DoctorCubit.get(context).sugarModel.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    CustomText(
                      text:
                          'This rate create at ${DoctorCubit.get(context).sugarModel[index].dateTime!.substring(0, 16)}',
                      fontSise: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                    buildContanerItem(
                      context,
                      " Rate  :${DoctorCubit.get(context).sugarModel[index].sugar} ",
                    ),
                  ],
                );
              },
            ),
          ),
          buildContanerItem(
            context,
            "Email  : ${patientRecordModel.email}",
          ),
          buildContanerItem(
            context,
            "Patient Age :${patientRecordModel.patientAge} ",
          ),
          buildContanerItem(
              context, "Mobile Phone : ${patientRecordModel.mobilePhone}"
              // report.pills ?? '',
              ),
          buildContanerItem(
            context,
            //   report!.date,
            "life stage : ${patientRecordModel.lifeStage}",
          ),
          buildContanerItem(
            context,
            "Address :${patientRecordModel.address}",
          ),
          buildContanerItem(
            context,
            "Challenge :${patientRecordModel.challenge}",
          ),
          buildContanerItem(
            context,
            "Physical :${patientRecordModel.physical}",
          ),
          buildContanerItem(
            context,
            "whyPhysical :${patientRecordModel.whyPhysical}",
          ),
          buildContanerItem(
            context,
            "Go to Doctor :${patientRecordModel.goToDoctor ?? ''}",
          ),
          buildContanerItem(
            context,
            "Doctor Time :${patientRecordModel.timeOfDoctor ?? ''}",
          ),
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
                //color: ColorsApp.appBarColor,
                border: Border.all(color: ColorsApp.appBarColor),
                borderRadius: BorderRadius.circular(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomTextField(
                  width: MediaQuery.of(context).size.width * .7,
                  lableText: "your comment ",
                  controller: commentC,
                ),
                FloatingActionButton(
                  backgroundColor: ColorsApp.primaryColor,
                  onPressed: () async {
                    DoctorCubit.get(context).sendComment(
                        comment: commentC.text,
                        patientUid: patientRecordModel.uId.toString());
                  },
                  child: const Icon(
                    Icons.send,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
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

import 'package:deaf_mute_clinic/view/screens/doctor/doctor_report_screen.dart';
import 'package:deaf_mute_clinic/view_model/doctor/cubit/doctor_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../helper/theme/theme.dart';
import '../../../view_model/patient/cubit/patient_cubit.dart';
import '../../widget/custom_text.dart';

class AllPatientsScreen extends StatelessWidget {
  const AllPatientsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PatientCubit, PatientState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: ColorsApp.appBarColor,
            title: const CustomText(
              text: "All Patients",
              fontSise: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          body: state is! GetAllPatientDataLoadingState
              ? ListView.separated(
                  padding: const EdgeInsets.all(20.0),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => DoctorReportScreen(
                              uId: DoctorCubit.get(context)
                                  .patients[index]
                                  .uId
                                  .toString(),
                            ),
                          ),
                        );
                      },
                      child: Row(
                        children: [
                          CircleAvatar(
                            child: const Icon(
                              Icons.person,
                              color: Colors.white,
                              size: 40.0,
                            ),
                            radius: 30.0,
                            backgroundColor: Colors.grey.shade400,
                          ),
                          const SizedBox(
                            width: 20.0,
                          ),
                          CustomText(
                            text: DoctorCubit.get(context).patients[index].name,
                            color: Colors.black,
                            fontSise: 22.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: DoctorCubit.get(context).patients.length)
              : const Center(
                  child: CircularProgressIndicator(),
                ),
        );
      },
    );
  }
}

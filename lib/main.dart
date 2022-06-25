import 'package:asuka/asuka.dart' as asuka;
import 'package:deaf_mute_clinic/helper/routs/app_routs.dart';
import 'package:deaf_mute_clinic/helper/routs/routs_name.dart';
import 'package:deaf_mute_clinic/my_bloc_opserver.dart';
import 'package:deaf_mute_clinic/view_model/doctor/cubit/doctor_cubit.dart';
import 'package:deaf_mute_clinic/view_model/patient/cubit/patient_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'helper/constant/constant.dart';
import 'helper/shared_prefrence/shared_prefrence.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await CacheHelper.init();
  CacheHelper.getData(key: 'patientUId') != null
      ? patientUId = CacheHelper.getData(key: 'patientUId')
      : patientUId = "";
  CacheHelper.getData(key: 'doctorUId') != null
      ? doctorUId = CacheHelper.getData(key: 'doctorUId')
      : doctorUId = "";

  BlocOverrides.runZoned(() {
    runApp(const MyApp());
  }, blocObserver: MyBlocObserver());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => PatientCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) => DoctorCubit(),
        ),
      ],
      child: MaterialApp(
          builder: asuka.builder,
          debugShowCheckedModeBanner: false,
          onGenerateRoute: AppRouts().genirateRoute,
          initialRoute: RoutsNames.mainSplash),
    );
  }
}

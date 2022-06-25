import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deaf_mute_clinic/helper/constant/constant.dart';
import 'package:deaf_mute_clinic/model/doctor/doctor_user_model.dart';
import 'package:deaf_mute_clinic/model/patient/patient_record_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../helper/shared_prefrence/shared_prefrence.dart';
import '../../../model/patient/patient_user_model.dart';

part 'regestration_state.dart';

class RegistrationCubit extends Cubit<RegistrationState> {
  RegistrationCubit() : super(RegistrationInitialState());

  static RegistrationCubit get(context) => BlocProvider.of(context);

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;
  PatientUserModel? patientModel;
  DoctorUserModel? doctorModel;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;

    emit(ChangePasswordVisibilityState());
  }

// patient signup
  void patientSignUp({
    required String email,
    required String password,
    required String name,
    required String phone,
    required String emergencyContactName,
    required String emergencyContactPhoneNumber,
    required String emergencyContactAddress,
    required String emergencyContactTypeOfKinship,
  }) {
    emit(PatientSigUpLoadingState());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) async {
      CacheHelper.putBoolean(key: 'patientUId', value: value.user!.uid);
      patientUId = value.user!.uid;
      patientUserCollection(
        uId: patientUId,
        name: name,
        phone: phone,
        email: email,
        emergencyContactName: emergencyContactName,
        emergencyContactPhoneNumber: emergencyContactPhoneNumber,
        emergencyContactAddress: emergencyContactAddress,
        emergencyContactTypeOfKinship: emergencyContactTypeOfKinship,
      );
      emit(PatientSigUpSuccessState());
    }).catchError((onError) {
      emit(PatientSigUpErrorState(error: onError.toString()));
    });
  }

  //patient create new user
  void patientUserCollection({
    required String name,
    required String email,
    required String phone,
    required String uId,
    required String emergencyContactName,
    required String emergencyContactPhoneNumber,
    required String emergencyContactAddress,
    required String emergencyContactTypeOfKinship,
  }) {
    patientModel = PatientUserModel(
      name: name,
      phone: phone,
      email: email,
      uId: uId,
      emergencyContactName: emergencyContactName,
      emergencyContactAddress: emergencyContactAddress,
      emergencyContactPhoneNumber: emergencyContactPhoneNumber,
      emergencyContactTypeOfKinship: emergencyContactTypeOfKinship,
    );

    FirebaseFirestore.instance
        .collection('Patient')
        .doc(uId)
        .set(patientModel!.toMap)
        .then((value) {
      emit(PatientCollectionSuccessState());
    }).catchError((onError) {
      emit(PatientCollectionErrorState(error: onError.toString()));
    });
  }

// patient login
  void patientLogIn({required String email, required String password}) {
    emit(PatientLoginLoadingState());
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      patientUId = value.user!.uid;

      CacheHelper.saveData(key: 'patientUId', value: value.user!.uid);

      print(value.user!.email);
      emit(PatientLoginSuccessState());
    }).catchError((onError) {
      print(onError.toString());
      emit(PatientLoginErrorState(error: onError.toString()));
    });
  }

  // doctor signup
  void doctorSignUp({
    required String email,
    required String password,
    required String name,
    required String phone,
    required String address,
    required String speciality,
    required String degree,
    required String graduated,
  }) {
    emit(DoctorSignUpLoadingState());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) async {
      doctorUId = value.user!.uid;
      CacheHelper.putBoolean(key: 'doctorUId', value: value.user!.uid);
      doctorUserCollection(
        uId: doctorUId,
        email: email,
        name: name,
        phone: phone,
        address: address,
        degree: degree,
        graduated: graduated,
        speciality: speciality,
      );

      // print(user?.uid);
      emit(DoctorSignUpSuccessState());
    }).catchError((onError) {
      emit(DoctorSignUpErrorState(error: onError.toString()));
    });
  }

  // doctor login
  void doctorLogIn({required String email, required String password}) {
    emit(DoctorLoginLoadingState());

    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      doctorUId = value.user!.uid;

      CacheHelper.putBoolean(key: 'doctorUId', value: value.user!.uid);

      emit(DoctorLoginSuccessState());
    }).catchError((onError) {
      emit(DoctorLoginErrorState(error: onError.toString()));
    });
  }

  // add data to fire stoer for doctor
  void doctorUserCollection({
    required String name,
    required String email,
    required String phone,
    required String uId,
    required String address,
    required String speciality,
    required String degree,
    required String graduated,
  }) {
    doctorModel = DoctorUserModel(
      name: name,
      phone: phone,
      email: email,
      uId: uId,
      address: address,
      degree: degree,
      spetialicty: speciality,
      graguated: graduated,
    );
    FirebaseFirestore.instance
        .collection('Doctor')
        .doc(uId)
        .set(doctorModel!.toMap)
        .then((value) {
      emit(DoctorCollectionSuccessState());
    }).catchError((onError) {
      emit(DoctorCollectionErrorState(error: onError.toString()));
    });
  }

  void patientAddRecord({
    required String patientName,
    required String email,
    required String aatientAge,
    required String dOb,
    required String mobilePhone,
    required String homePhone,
    required String lifestage,
    required String preferredLocation,
    required String referredby,
    required String namePersonCompleting,
    required String address,
    required String reasonforappointment,
    required String currentSeeingTherapist,
    required String currentSeeingTherapistWho,
    required String currentSeeingTherapistHowLong,
    required String currentlyMedicationsAndDosage,
    required String previousPsychiatric,
    required String previousPsychiatricExplain,
    required String eatingDiorder,
    required String eatingDiorderHowLongAgo,
    required String suicidalleation,
    required String suicidalleationHowLongAgo,
    required String thoughtsOfHurmingOthers,
    required String thoughtsOfHurmingOthersExplain,
    required String sugarRate,
    required String obstruction,
    required String date,
  }) {
    PatientRecordModel patientRecordModel = PatientRecordModel(
        patientName: patientName,
        date: date,
        email: email,
        aatientAge: aatientAge,
        dOb: dOb,
        mobilePhone: mobilePhone,
        homePhone: homePhone,
        lifestage: lifestage,
        uId: patientUId,
        preferredLocation: preferredLocation,
        referredby: referredby,
        namePersonCompleting: namePersonCompleting,
        address: address,
        reasonforappointment: reasonforappointment,
        currentSeeingTherapist: currentSeeingTherapist,
        currentSeeingTherapistHowLong: currentSeeingTherapistHowLong,
        currentSeeingTherapistWho: currentSeeingTherapistWho,
        currentlyMedicationsAndDosage: currentlyMedicationsAndDosage,
        previousPsychiatric: previousPsychiatric,
        previousPsychiatricExplain: previousPsychiatricExplain,
        eatingDiorder: eatingDiorder,
        eatingDiorderHowLongAgo: eatingDiorderHowLongAgo,
        suicidalleation: suicidalleation,
        suicidalleationHowLongAgo: suicidalleationHowLongAgo,
        thoughtsOfHurmingOthers: thoughtsOfHurmingOthers,
        thoughtsOfHurmingOthersExplain: thoughtsOfHurmingOthersExplain,
        sugarRate: sugarRate,
        obstruction: obstruction);
    emit(AddRecordLoadingState());
    FirebaseFirestore.instance
        .collection('Patient')
        .doc(patientUId)
        .collection('records')
        .doc('record')
        .set(
          patientRecordModel.toMap,
        )
        .then((value) {
      emit(AddRecordSuccessState());
    }).catchError((onError) {
      emit(AddRecordErrorState(onError: onError.toString()));
    });
  }
}

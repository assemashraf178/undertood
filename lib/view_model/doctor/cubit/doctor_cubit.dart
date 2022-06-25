import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deaf_mute_clinic/model/comment.dart';
import 'package:deaf_mute_clinic/model/patient/patient_record_model.dart';
import 'package:deaf_mute_clinic/model/patient/patient_user_model.dart';
import 'package:deaf_mute_clinic/model/patient/suger.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../helper/constant/constant.dart';
import '../../../model/doctor/doctor_user_model.dart';

part 'doctor_state.dart';

class DoctorCubit extends Cubit<DoctorState> {
  DoctorUserModel? doctorUserModel;
  DoctorCubit() : super(DoctorInitial());
  static DoctorCubit get(context) => BlocProvider.of(context);
  void doctorGetData() {
    emit(DoctorUserGetDataLoadingState());
    FirebaseFirestore.instance
        .collection('Doctor')
        .doc(doctorUId)
        .get()
        .then((value) {
      doctorUserModel = DoctorUserModel.fromMap(value.data()!);
      emit(DoctorUserGetDataSuccessState());
    }).catchError((onError) {
      emit(DoctorUserGetDataErrorState());
    });
  }

  PatientRecordModel? patientRecordModel;
  void getAllRecords({required String patientUid}) {
    emit(GetAllRecordsDataLoadingState());
    FirebaseFirestore.instance
        .collection('Patient')
        .doc(patientUid)
        .collection('records')
        .doc('record')
        .get()
        .then((value) {
      patientRecordModel = PatientRecordModel.fromMap(value.data());
      print(patientRecordModel);
      emit(GetAllRecordsDataSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetAllRecordsDataErrorState());
    });
  }

  List<PatientUserModel> patients = [];
  void getAllPatients() {
    emit(GetAllPatientDataLoadingState());
    FirebaseFirestore.instance.collection('Patient').get().then(
      (value) {
        for (var element in value.docs) {
          patients.add(PatientUserModel.fromMap(element.data()));
        }
        print(patients.toString());
        emit(GetAllPatientDataSuccessState());
      },
    ).catchError(
      (error) {
        print(error.toString());
        emit(GetAllPatientDataErrorState());
      },
    );
  }

  List<SugarRate> sugarModel = [];
  void getAllSugarRates({required String patientUid}) {
    sugarModel = [];
    emit(GetAllSugarRatesDataLoadingState());

    FirebaseFirestore.instance
        .collection('Patient')
        .doc(patientUid)
        .collection('sugar_rate')
        .get()
        .then((value) {
      for (var element in value.docs) {
        sugarModel.add(SugarRate.fromJson(element.data()));
      }
      print('All Sugar Rates: $sugarModel');
      emit(GetAllSugarRatesDataSuccessState());
    }).catchError((onError) {});
  }

  void sendComment({
    required String comment,
    required String patientUid,
  }) {
    CommentModel commentModel = CommentModel(
      doctorName: doctorUserModel!.name,
      massage: comment,
    );
    emit(DoctorSendCommentLoadingState());

    FirebaseFirestore.instance
        .collection('Doctor')
        .doc(doctorUId)
        .collection('comments')
        .doc(patientUid)
        .collection('comments')
        .add(commentModel.toMap)
        .then((value) {
      emit(DoctorSendCommentSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(DoctorSendCommentErrorState());
    });

    FirebaseFirestore.instance
        .collection('Patient')
        .doc(patientUid)
        .collection('comments')
        .add(commentModel.toMap)
        .then((value) {})
        .catchError((error) {
      print(error.toString());
    });
  }
}

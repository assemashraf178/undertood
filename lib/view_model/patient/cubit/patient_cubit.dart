import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deaf_mute_clinic/helper/constant/constant.dart';
import 'package:deaf_mute_clinic/model/patient/patient_record_model.dart';
import 'package:deaf_mute_clinic/model/patient/patient_user_model.dart';
import 'package:deaf_mute_clinic/model/patient/suger.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../model/comment.dart';

part 'patient_state.dart';

class PatientCubit extends Cubit<PatientState> {
  PatientCubit() : super(PatientInitial());
  static PatientCubit get(context) => BlocProvider.of(context);

  PatientRecordModel? patientRecordModel;
  PatientUserModel? patientUserModel;

  void getPatientData() {
    emit(PatientGetDataLoadingState());
    FirebaseFirestore.instance
        .collection('Patient')
        .doc(patientUId)
        .get()
        .then((value) {
      patientUserModel = PatientUserModel.fromMap(value.data());
      emit(PatientGetDataSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(PatientGetDataErrorState());
    });
  }

  void patientGetRecord() {
    emit(PatientGetRecordLoadingState());
    FirebaseFirestore.instance
        .collection('Patient')
        .doc(patientUId)
        .collection('records')
        .doc('record')
        .get()
        .then((value) {
      patientRecordModel = PatientRecordModel.fromMap(value.data());
      print('Record: $patientRecordModel');
      emit(PatientGetRecordSuccessState());
    }).catchError((onError) {
      emit(PatientGetRecordErrorState());
    });
  }

  void patientAddSugarRate(
      {required String sugar, required String dateTime}) async {
    emit(PatientSugarLoadingState());
    SugarRate sugarRate = SugarRate(sugar: sugar, dateTime: dateTime);
    FirebaseFirestore.instance
        .collection('Patient')
        .doc(patientUId)
        .collection('sugar_rate')
        .add(sugarRate.toMap)
        .then((value) {
      emit(PatientSugarSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(PatientSugarErrorState());
    });
  }

  List<CommentModel> comments = [];
  void getAllComments() {
    comments = [];
    emit(PatientGetAllCommentsLoadingState());
    FirebaseFirestore.instance
        .collection('Patient')
        .doc(patientUId)
        .collection('comments')
        .get()
        .then((value) {
      for (var element in value.docs) {
        print(element.data());
        comments.add(CommentModel.fromJson(element.data()));
      }
      print('Comments: $comments');
      emit(PatientGetAllCommentsSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(PatientGetAllCommentsErrorState());
    });
  }

  List<SugarRate> sugarRates = [];
  void getAllSugarRates() {
    sugarRates = [];
    emit(PatientGetAllSugarRatesLoadingState());
    FirebaseFirestore.instance
        .collection('Patient')
        .doc(patientUId)
        .collection('sugar_rate')
        .get()
        .then((value) {
      for (var element in value.docs) {
        sugarRates.add(SugarRate.fromJson(element.data()));
      }
      emit(PatientGetAllSugarRatesSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(PatientGetAllSugarRatesErrorState());
    });
  }
}

part of 'patient_cubit.dart';

@immutable
abstract class PatientState {}

class PatientInitial extends PatientState {}

class PatientGetDataLoadingState extends PatientState {}

class PatientGetDataSuccessState extends PatientState {}

class PatientGetDataErrorState extends PatientState {}

class PatientGetRecordLoadingState extends PatientState {}

class PatientGetRecordSuccessState extends PatientState {}

class PatientGetRecordErrorState extends PatientState {}

class PatientSugarLoadingState extends PatientState {}

class PatientSugarSuccessState extends PatientState {}

class PatientSugarErrorState extends PatientState {}

class PatientGetAllCommentsLoadingState extends PatientState {}

class PatientGetAllCommentsSuccessState extends PatientState {}

class PatientGetAllCommentsErrorState extends PatientState {}

class PatientGetAllSugarRatesLoadingState extends PatientState {}

class PatientGetAllSugarRatesSuccessState extends PatientState {}

class PatientGetAllSugarRatesErrorState extends PatientState {}

// add record
class AddRecordLoadingState extends PatientState {}

class AddRecordSuccessState extends PatientState {}

class AddRecordErrorState extends PatientState {
  final String? onError;
  AddRecordErrorState({this.onError});
}

part of 'doctor_cubit.dart';

@immutable
abstract class DoctorState {}

class DoctorInitial extends DoctorState {}

class DoctorUserGetDataSuccessState extends DoctorState {}

class DoctorUserGetDataLoadingState extends DoctorState {}

class DoctorUserGetDataErrorState extends DoctorState {}

class GetAllRecordsDataErrorState extends DoctorState {}

class GetAllRecordsDataSuccessState extends DoctorState {}

class GetAllRecordsDataLoadingState extends DoctorState {}

class GetAllSugarRatesDataErrorState extends DoctorState {}

class GetAllSugarRatesDataSuccessState extends DoctorState {}

class GetAllSugarRatesDataLoadingState extends DoctorState {}

class GetAllPatientDataErrorState extends DoctorState {}

class GetAllPatientDataSuccessState extends DoctorState {}

class GetAllPatientDataLoadingState extends DoctorState {}

class DoctorSendCommentLoadingState extends DoctorState {}

class DoctorSendCommentSuccessState extends DoctorState {}

class DoctorSendCommentErrorState extends DoctorState {}

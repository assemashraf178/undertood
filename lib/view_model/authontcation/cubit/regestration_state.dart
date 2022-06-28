part of 'regestration_cubit.dart';

@immutable
abstract class RegistrationState {}

//initial
class RegistrationInitialState extends RegistrationState {}

//patent states
class PatientLoginLoadingState extends RegistrationState {}

class PatientLoginSuccessState extends RegistrationState {}

class PatientLoginErrorState extends RegistrationState {
  final String? error;
  PatientLoginErrorState({this.error});
}

class PatientSigUpLoadingState extends RegistrationState {}

class PatientSigUpSuccessState extends RegistrationState {}

class PatientSigUpErrorState extends RegistrationState {
  final String? error;
  PatientSigUpErrorState({this.error});
}

class PatientCollectionSuccessState extends RegistrationState {}

class PatientCollectionLoadingState extends RegistrationState {}

class PatientCollectionErrorState extends RegistrationState {
  final String? error;
  PatientCollectionErrorState({this.error});
}

// doctor states
class DoctorLoginLoadingState extends RegistrationState {}

class DoctorLoginSuccessState extends RegistrationState {}

class DoctorLoginErrorState extends RegistrationState {
  final String? error;
  DoctorLoginErrorState({this.error});
}

class DoctorSignUpLoadingState extends RegistrationState {}

class DoctorSignUpSuccessState extends RegistrationState {}

class DoctorSignUpErrorState extends RegistrationState {
  final String? error;
  DoctorSignUpErrorState({this.error});
}

class DoctorCollectionSuccessState extends RegistrationState {}

class DoctorCollectionLoadingState extends RegistrationState {}

class DoctorCollectionErrorState extends RegistrationState {
  final String? error;
  DoctorCollectionErrorState({this.error});
}

class ChangePasswordVisibilityState extends RegistrationState {}

class PatientUserModel {
  String? name;
  String? phone;
  String? email;
  String? uId;
  String? emergencyContactName;
  String? emergencyContactPhoneNumber;
  String? emergencyContactAddress;
  String? emergencyContactTypeOfKinship;

  PatientUserModel({
    this.name,
    this.email,
    this.phone,
    this.uId,
    this.emergencyContactName,
    this.emergencyContactPhoneNumber,
    this.emergencyContactAddress,
    this.emergencyContactTypeOfKinship,
  });

  PatientUserModel.fromMap(Map<String, dynamic>? map) {
    name = map!['name'];
    email = map['email'];
    phone = map['phone'];
    uId = map['uId'];
    emergencyContactName = map['emergencyContactName'];
    emergencyContactPhoneNumber = map['emergencyContactPhoneNumber'];
    emergencyContactAddress = map['emergencyContactAddress'];
    emergencyContactTypeOfKinship = map['emergencyContactTypeOfKinship'];
  }

  Map<String, dynamic> get toMap => {
        'name': name,
        'email': email,
        'phone': phone,
        'uId': uId,
        'emergencyContactName': emergencyContactName,
        'emergencyContactPhoneNumber': emergencyContactPhoneNumber,
        'emergencyContactAddress': emergencyContactAddress,
        'emergencyContactTypeOfKinship': emergencyContactTypeOfKinship,
      };
}

class PatientRecordModel {
  String? patientName;
  String? email;
  String? patientAge;
  String? mobilePhone;
  String? homePhone;
  String? lifeStage;
  String? uId;
  String? address;
  String? date;
  String? physical;
  String? whyPhysical;
  String? challenge;
  String? obstruction;
  String? goToDoctor;
  String? timeOfDoctor;

  PatientRecordModel({
    this.patientName,
    this.whyPhysical,
    this.date,
    this.physical,
    this.challenge,
    this.email,
    this.patientAge,
    this.uId,
    this.address,
    this.mobilePhone,
    this.homePhone,
    this.lifeStage,
    this.obstruction,
    this.goToDoctor,
    this.timeOfDoctor,
  });

  PatientRecordModel.fromMap(Map<String, dynamic>? map) {
    patientName = map!['patientName'];
    whyPhysical = map['whyPhysical'];
    physical = map['physical'];
    challenge = map['challenge'];
    email = map['email'];
    patientAge = map['patientAge'];
    uId = map['uId'];
    address = map['address'];
    date = map['date'];
    mobilePhone = map['mobilePhone'];
    homePhone = map['homePhone'];
    lifeStage = map['lifeStage'];
    obstruction = map['obstruction'];
    goToDoctor = map['goToDoctor'];
    timeOfDoctor = map['timeOfDoctor'];
  }

  Map<String, dynamic> get toMap => {
        'patientName': patientName,
        'whyPhysical': whyPhysical,
        'physical': physical,
        'challenge': challenge,
        'email': email,
        'patientAge': patientAge,
        'uId': uId,
        'date': date,
        'address': address,
        'mobilePhone': mobilePhone,
        'homePhone': homePhone,
        'lifeStage': lifeStage,
        'obstruction': obstruction,
        'goToDoctor': goToDoctor,
        'timeOfDoctor': timeOfDoctor,
      };
}

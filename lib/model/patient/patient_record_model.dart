class PatientRecordModel {
  String? patientName;
  String? doctorComment;
  String? email;
  String? aatientAge;
  String? dOb;
  String? mobilePhone;
  String? homePhone;
  String? lifestage;
  String? uId;
  String? sugarRate;
  String? obstruction;
  String? preferredLocation;
  String? referredby;
  String? namePersonCompleting;
  String? address;
  String? reasonforappointment;
  String? currentSeeingTherapist;
  String? currentSeeingTherapistWho;
  String? currentSeeingTherapistHowLong;
  String? currentlyMedicationsAndDosage;
  String? previousPsychiatric;
  String? previousPsychiatricExplain;
  String? eatingDiorder;
  String? eatingDiorderHowLongAgo;
  String? suicidalleation;
  String? suicidalleationHowLongAgo;
  String? thoughtsOfHurmingOthers;
  String? thoughtsOfHurmingOthersExplain;
  String? date;
  String? physical;
  String? whyPhysical;
  String? challenge;

  PatientRecordModel({
    this.patientName,
    this.doctorComment,
    this.whyPhysical,
    this.date,
    this.physical,
    this.challenge,
    this.obstruction,
    this.sugarRate,
    this.email,
    this.aatientAge,
    this.uId,
    this.address,
    this.dOb,
    this.mobilePhone,
    this.homePhone,
    this.lifestage,
    this.preferredLocation,
    this.referredby,
    this.namePersonCompleting,
    this.reasonforappointment,
    this.currentSeeingTherapist,
    this.currentSeeingTherapistWho,
    this.currentSeeingTherapistHowLong,
    this.currentlyMedicationsAndDosage,
    this.previousPsychiatric,
    this.previousPsychiatricExplain,
    this.eatingDiorder,
    this.eatingDiorderHowLongAgo,
    this.suicidalleation,
    this.suicidalleationHowLongAgo,
    this.thoughtsOfHurmingOthers,
    this.thoughtsOfHurmingOthersExplain,
  });
// ignore: empty_constructor_bodies
  PatientRecordModel.fromMap(Map<String, dynamic>? map) {
    patientName = map!['patientName'];
    whyPhysical = map['whyPhysical'];
    physical = map['physical'];
    challenge = map['challenge'];
    doctorComment = map['doctorComment'];
    email = map['email'];
    obstruction = map['obstruction'];
    sugarRate = map['sugarRate'];
    aatientAge = map['aatientAge'];
    uId = map['uId'];
    dOb = map['dOb'];
    address = map['address'];
    date = map['date'];
    mobilePhone = map['mobilePhone'];
    homePhone = map['homePhone'];
    lifestage = map['lifestage'];
    preferredLocation = map['preferredLocation'];
    referredby = map['referredby'];
    namePersonCompleting = map['namePersonCompleting'];
    reasonforappointment = map['reasonforappointment'];
    currentSeeingTherapist = map['currentSeeingTherapist'];
    currentSeeingTherapistWho = map['currentSeeingTherapistWho'];
    currentSeeingTherapistHowLong = map['currentSeeingTherapistHowLong'];
    currentlyMedicationsAndDosage = map['currentlyMedicationsAndDosage'];
    previousPsychiatric = map['previousPsychiatric'];
    previousPsychiatricExplain = map['previousPsychiatricExplain'];
    eatingDiorder = map['eatingDiorder'];
    eatingDiorderHowLongAgo = map['eatingDiorderHowLongAgo'];
    suicidalleation = map['suicidalleation'];
    suicidalleationHowLongAgo = map['suicidalleationHowLongAgo'];
    thoughtsOfHurmingOthers = map['thoughtsOfHurmingOthers'];
    thoughtsOfHurmingOthersExplain = map['thoughtsOfHurmingOthersExplain'];
  }

  Map<String, dynamic> get toMap => {
        'patientName': patientName,
        'whyPhysical': whyPhysical,
        'physical': physical,
        'challenge': challenge,
        'doctorComment': doctorComment,
        'sugarRate': sugarRate,
        'email': email,
        'obstruction': obstruction,
        'aatientAge': aatientAge,
        'uId': uId,
        'dOb': dOb,
        'date': date,
        'address': address,
        'mobilePhone': mobilePhone,
        'homePhone': homePhone,
        'lifestage': lifestage,
        'preferredLocation': preferredLocation,
        'referredby': referredby,
        'namePersonCompleting': namePersonCompleting,
        'reasonforappointment': reasonforappointment,
        'currentSeeingTherapist': currentSeeingTherapist,
        'currentSeeingTherapistWho': currentSeeingTherapistWho,
        'currentSeeingTherapistHowLong': currentSeeingTherapistHowLong,
        'currentlyMedicationsAndDosage': currentlyMedicationsAndDosage,
        'previousPsychiatric': previousPsychiatric,
        'previousPsychiatricExplain': previousPsychiatricExplain,
        'eatingDiorder': eatingDiorder,
        'eatingDiorderHowLongAgo': eatingDiorderHowLongAgo,
        'suicidalleation': suicidalleation,
        'suicidalleationHowLongAgo': suicidalleationHowLongAgo,
        'thoughtsOfHurmingOthers': thoughtsOfHurmingOthers,
        'thoughtsOfHurmingOthersExplain': thoughtsOfHurmingOthersExplain,
      };
}

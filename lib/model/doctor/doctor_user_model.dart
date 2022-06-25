import 'package:firebase_auth/firebase_auth.dart';

class DoctorUserModel {
  String? name;
  String? phone;
  String? degree;
  String? address;
  String? graguated;
  String? spetialicty;
  String? email;
  String? uId;

  DoctorUserModel(
      {this.name,
      this.email,
      this.phone,
      this.uId,
      this.address,
      this.degree,
      this.graguated,
      this.spetialicty});
// ignore: empty_constructor_bodies
  DoctorUserModel.fromAuth(User userAuth) {
    email = userAuth.email ?? '';
    phone = userAuth.phoneNumber ?? '';
    name = userAuth.displayName ?? '';
    // this.userName = userAuth.email?.split('@').first.trim() ?? '';
  }

  Map<String, dynamic> get toMap => {
        'name': name,
        'email': email,
        'phone': phone,
        'uId': uId,
        'degree': degree,
        'address': address,
        'graguated': graguated,
        'spetialicty': spetialicty,
      };
  DoctorUserModel.fromMap(Map<String, dynamic> map) {
    uId = map['uId'] ?? '';
    email = map['email'] ?? '';
    name = map['name'] ?? '';
    phone = map['phone'] ?? '';
    degree = map['degree'] ?? '';
    address = map['address'] ?? '';
    graguated = map['graguated'] ?? '';
    spetialicty = map['spetialicty'] ?? '';
  }
}

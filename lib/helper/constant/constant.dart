import 'package:deaf_mute_clinic/helper/routs/routs_name.dart';
import 'package:flutter/cupertino.dart';

import '../shared_prefrence/shared_prefrence.dart';

String patientUId = "";
String doctorUId = "";

void patientSignOut(context) {
  CacheHelper.removeData(
    key: 'patientUId',
  ).then((value) {
    if (value) {
      patientUId = "";
      Navigator.pushNamedAndRemoveUntil(
          context, RoutsNames.start, (route) => false);
    }
  });
}

void doctorSignOut(context) {
  CacheHelper.removeData(
    key: 'doctorUId',
  ).then((value) {
    if (value) {
      doctorUId = "";
      Navigator.pushNamedAndRemoveUntil(
          context, RoutsNames.start, (route) => false);
    }
  });
}

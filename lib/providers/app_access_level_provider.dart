import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:konsuldok/models/absensi_setting_model.dart';
import 'package:konsuldok/models/app_user_model.dart';

class AppAccessLevelProvider extends ChangeNotifier {
  final dbReference = FirebaseFirestore.instance;
  final String _appUserUid;
  String _appUserRole;
  AppUserModel _appUser;
  AbsensiSettingModel _absensiSetting;

  AppAccessLevelProvider(BuildContext context, this._appUserUid, this._appUser);

  AbsensiSettingModel get absensiSetting {
    return _absensiSetting;
  }

  AppUserModel get appxUser {
    return _appUser;
  }

  String get appxUserUid {
    return _appUserUid;
  }

  String get appxUserRole {
    return _appUserRole;
  }

  Future<void> getRole() async {
    Map<String, dynamic> data1 = {};
    final qSnap1 = await dbReference
        .collection("appUsers")
        .where('appUserUid', isEqualTo: _appUserUid)
        .get();
    for (DocumentSnapshot ds in qSnap1.docs) {
      data1 = ds.data();
    }
    // print('login role >> $_appUserUid ${data1['appRole']}');
    _appUserRole = data1['appUserRole'];
    AppUserModel data = AppUserModel.fromMap(data1, null);
    _appUser = data;

    // absensi setting
    final qSnap2 = await dbReference
        .collection("absensiSetting")
        .doc('Office')
        .get()
        .then((DocumentSnapshot ds) => ds.data());
    _absensiSetting = AbsensiSettingModel.fromMap(qSnap2, '');
    notifyListeners();
  }
}

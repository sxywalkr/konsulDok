import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hecxd/models/app_user_model.dart';

class AppAccessLevelProvider extends ChangeNotifier {
  final dbReference = Firestore.instance;
  final String _appUserUid;
  String _appUserRole;
  AppUserModel _appUser;

  AppAccessLevelProvider(BuildContext context, this._appUserUid, this._appUser);

  // Stream<AppUserModel> get appUserStream => _userFromDb(_appUser);
  // Stream<AppUserModel> get appUserStream async* {
  //   final a = dbReference.collection('AppUsers');
  //   return a.snapshots().map((snapShot) => snapShot.documents
  //       .map((docx) => AppUserModel.fromJson(docx.data))
  //       .toList());
  // }

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
        .getDocuments();
    for (DocumentSnapshot ds in qSnap1.documents) {
      data1 = ds.data;
    }
    print('login role >> $_appUserUid ${data1['appRole']}');
    _appUserRole = data1['appRole'];
    AppUserModel data = AppUserModel.fromMap(data1, null);
    _appUser = data;
    notifyListeners();
  }

  AppUserModel _userFromDb(AppUserModel user) {
    if (user == null) {
      return null;
    }

    return AppUserModel(
      appUserUid: user.appUserUid,
      appUserEmail: user.appUserEmail,
      appUserRole: user.appUserRole,
      appUserFcmId: user.appUserFcmId,
      appUserDisplayName: user.appUserDisplayName,
      appUserNoRmHec: user.appUserNoRmHec,
      appUserNoKtp: user.appUserNoKtp,
      appUserNoBpjs: user.appUserNoBpjs,
      appUserNoHape: user.appUserNoHape,
      appUserGender: user.appUserGender,
      appUserAlamat: user.appUserAlamat,
      appUserTglLahir: user.appUserTglLahir,
      appUserStatusRm: user.appUserStatusRm,
      appUserFlagActivity: user.appUserFlagActivity,
      appUserTglAntri: user.appUserTglAntri,
      appUserNoAntri: user.appUserNoAntri,
    );
  }
}

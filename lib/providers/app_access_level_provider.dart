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
        .getDocuments();
    for (DocumentSnapshot ds in qSnap1.documents) {
      data1 = ds.data;
    }
    // print('login role >> $_appUserUid ${data1['appRole']}');
    _appUserRole = data1['appUserRole'];
    AppUserModel data = AppUserModel.fromMap(data1, null);
    _appUser = data;
    notifyListeners();
  }
}

import 'package:flutter/material.dart';
// import 'package:konsuldok/models/user_model.dart';
import 'package:konsuldok/providers/auth_provider.dart';
// import 'package:konsuldok/routes.dart';
import 'package:konsuldok/services/firestore_database.dart';
import 'package:konsuldok/ui/drawer/app_drawer.dart';
import 'package:provider/provider.dart';

import 'package:konsuldok/models/app_user_model.dart';
import 'package:konsuldok/ui/appUser/empty_content.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

enum UserRole {
  Approve,
  Reject,
}

class AbsensiUserScreen extends StatelessWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    // final firestoreDatabase =
    //     Provider.of<FirestoreDatabase>(context, listen: false);

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: StreamBuilder(
            stream: authProvider.user,
            builder: (context, snapshot) {
              // final UserModel user = snapshot.data;
              return Text('List App User');
            }),
        actions: <Widget>[],
      ),
      drawer: AppDrawer(),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.add),
      //   onPressed: () {
      //     // Navigator.of(context).pushNamed(
      //     //   Routes.create_edit_appUser,
      //     // );
      //   },
      // ),
      body: WillPopScope(
          onWillPop: () async => false, child: _buildBodySection(context)),
    );
  }

  Widget _buildBodySection(BuildContext context) {
    final firestoreDatabase =
        Provider.of<FirestoreDatabase>(context, listen: false);

    return StreamBuilder(
        stream: firestoreDatabase.appUsersStream(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<AppUserModel> appUsers = snapshot.data;
            appUsers.removeWhere(
                (element) => element.appUserEmail == 'debug@app.com');
            if (appUsers.isNotEmpty) {
              return ListView.separated(
                itemCount: appUsers.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                    background: Container(
                      color: Colors.red,
                      child: Center(
                          child: Text(
                        'Geser hapus',
                        style: TextStyle(color: Theme.of(context).canvasColor),
                      )),
                    ),
                    key: Key(appUsers[index].appUserUid),
                    // onDismissed: (direction) {
                    //   firestoreDatabase.deleteAppUser(appUsers[index]);

                    //   _scaffoldKey.currentState.showSnackBar(SnackBar(
                    //     backgroundColor: Theme.of(context).appBarTheme.color,
                    //     content: Text(
                    //       'Hapus ' + appUsers[index].appUserEmail,
                    //       style:
                    //           TextStyle(color: Theme.of(context).canvasColor),
                    //     ),
                    //     duration: Duration(seconds: 3),
                    //     action: SnackBarAction(
                    //       label: 'Batal',
                    //       textColor: Theme.of(context).canvasColor,
                    //       onPressed: () {
                    //         firestoreDatabase.setAppUser(appUsers[index]);
                    //       },
                    //     ),
                    //   ));
                    // },
                    child: ListTile(
                      title: Text(appUsers[index].appUserEmail),
                      subtitle: Text('${appUsers[index].appUserFlagActivity}'),
                      trailing: appUsers[index].appUserRole == 'Debug' ||
                              appUsers[index].appUserRole == 'Debug' ||
                              !appUsers[index]
                                  .appUserFlagActivity
                                  .contains('Waiting')
                          ? null
                          : _setUserRole(context, appUsers[index]),
                      onTap: () {
                        // Navigator.of(context).pushNamed(
                        //     Routes.create_edit_appUser,
                        //     arguments: appUsers[index]);
                      },
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider(height: 0.5);
                },
              );
            } else {
              return EmptyContentWidget(
                title: 'Data App User belum ada',
                message: 'Tap + untuk menambah data',
              );
            }
          } else if (snapshot.hasError) {
            return EmptyContentWidget(
              title: 'Error. Data App User',
              message: 'Error..',
            );
          }
          return Center(child: CircularProgressIndicator());
        });
  }

  Widget _setUserRole(BuildContext context, AppUserModel aa) {
    final dbReference = FirebaseFirestore.instance;
    return PopupMenuButton(
      onSelected: (UserRole selectedValue) async {
        if (selectedValue == UserRole.Approve) {
          dbReference.collection('appUsers').doc(aa.appUserUid).update({
            'appUserFlagActivity': 'Bekerja',
          });
          Map<String, dynamic> data1 = {};
          final qSnap1 = await dbReference
              .collection("absensi")
              .where('absensiStatus', isEqualTo: 'Open')
              .where('appUserUid', isEqualTo: aa.appUserUid)
              .get();
          for (DocumentSnapshot ds in qSnap1.docs) {
            data1 = ds.data();
          }
          dbReference.collection('absensi').doc(data1['absensiId']).update(
            {
              'absensiPlace': 'Site',
            },
          );
        } else if (selectedValue == UserRole.Reject) {
          dbReference.collection('appUsers').doc(aa.appUserUid).update({
            'appUserFlagActivity': 'Tidak Bekerja',
          });
          Map<String, dynamic> data1 = {};
          final qSnap1 = await dbReference
              .collection("absensi")
              .where('absensiStatus', isEqualTo: 'Open')
              .where('appUserUid', isEqualTo: aa.appUserUid)
              .get();
          for (DocumentSnapshot ds in qSnap1.docs) {
            data1 = ds.data();
          }
          dbReference.collection('absensi').doc(data1['absensiId']).update(
            {
              'absensiPlace': 'Site',
              'absensiStatus': 'Closed',
            },
          );
        }
      },
      itemBuilder: (_) => [
        PopupMenuItem(
          child: Text('Approve'),
          value: UserRole.Approve,
        ),
        PopupMenuItem(
          child: Text('Reject'),
          value: UserRole.Reject,
        ),
      ],
      icon: Icon(Icons.more_vert),
    );
  }
}

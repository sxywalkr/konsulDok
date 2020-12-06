import 'package:flutter/material.dart';
import 'package:hecxd/models/app_user_model.dart';
import 'package:hecxd/models/hec_antrian_model.dart';
// import 'package:hecxd/models/user_model.dart';
// import 'package:hecxd/providers/auth_provider.dart';
// import 'package:hecxd/routes.dart';
import 'package:hecxd/services/firestore_database.dart';
import 'package:hecxd/ui/drawer/app_drawer.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
// import 'package:hecxd/models/app_user_model.dart';
import 'package:hecxd/ui/appUser/empty_content.dart';

enum UserRole {
  User,
  Resepsionis,
  Dokter,
  Oka,
  Apotek,
  Billing,
}

class AntriansScreen extends StatelessWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    // final authProvider = Provider.of<AuthProvider>(context);
    // final firestoreDatabase =
    //     Provider.of<FirestoreDatabase>(context, listen: false);

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('List Antrian'),
        actions: <Widget>[],
      ),
      drawer: AppDrawer(),
      body: WillPopScope(
          onWillPop: () async => false, child: _buildBodySection(context)),
    );
  }

  Widget _buildBodySection(BuildContext context) {
    final firestoreDatabase =
        Provider.of<FirestoreDatabase>(context, listen: false);

    return StreamBuilder(
        stream: firestoreDatabase.hecAntriansStream(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<HecAntrianModel> hecAntrian = snapshot.data;
            if (hecAntrian.isNotEmpty) {
              return ListView.separated(
                itemCount: hecAntrian.length,
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
                    key: Key(hecAntrian[index].appUserUid),
                    // onDismissed: (direction) {
                    //   firestoreDatabase.deleteAppUser(hecAntrian[index]);

                    //   _scaffoldKey.currentState.showSnackBar(SnackBar(
                    //     backgroundColor: Theme.of(context).appBarTheme.color,
                    //     content: Text(
                    //       'Hapus ' + hecAntrian[index].appUserEmail,
                    //       style:
                    //           TextStyle(color: Theme.of(context).canvasColor),
                    //     ),
                    //     duration: Duration(seconds: 3),
                    //     action: SnackBarAction(
                    //       label: 'Batal',
                    //       textColor: Theme.of(context).canvasColor,
                    //       onPressed: () {
                    //         firestoreDatabase.setAppUser(hecAntrian[index]);
                    //       },
                    //     ),
                    //   ));
                    // },
                    child: ListTile(
                      title: StreamBuilder(
                          stream: firestoreDatabase.appUserStream(
                              appUserId: hecAntrian[index].appUserUid),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              final AppUserModel user = snapshot.data;
                              return Text(user.appUserDisplayName == null
                                  ? 'User ' +
                                      user.appUserEmail +
                                      ' dengan Nomor Antri ${hecAntrian[index].hecAntrianNomorAntri}'
                                  : 'User ' +
                                      user.appUserDisplayName +
                                      ' dengan Nomor Antri ${hecAntrian[index].hecAntrianNomorAntri}');
                            }
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }),
                      subtitle: Text(
                          '${DateFormat('EEEE, d MMMM yyyy', 'id_ID').format(DateTime.parse(hecAntrian[index].hecAntrianTglAntri))}'),
                      onTap: () {
                        // Navigator.of(context).pushNamed(
                        //     Routes.create_edit_appUser,
                        //     arguments: hecAntrian[index]);
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
                title: 'Data Antrian belum ada',
                message: '-',
              );
            }
          } else if (snapshot.hasError) {
            return EmptyContentWidget(
              title: 'Error. Data Antrian',
              message: 'Error..',
            );
          }
          return Center(child: CircularProgressIndicator());
        });
  }

//   Widget _setUserRole(BuildContext context, HecAntrianModel aa) {
//     final firestoreDatabase =
//         Provider.of<FirestoreDatabase>(context, listen: false);
//     return PopupMenuButton(
//       onSelected: (UserRole selectedValue) {
//         if (selectedValue == UserRole.User) {
//           firestoreDatabase.setAppUser(HecAntrianModel(
//             appUserUid: aa.appUserUid,
//             appUserRole: 'User',
//             appUserFcmId: aa.appUserFcmId,
//             appUserEmail: aa.appUserEmail,
//           ));
//         } else if (selectedValue == UserRole.Resepsionis) {
//           firestoreDatabase.setAppUser(HecAntrianModel(
//             appUserUid: aa.appUserUid,
//             appUserRole: 'Resepsionis',
//             appUserFcmId: aa.appUserFcmId,
//             appUserEmail: aa.appUserEmail,
//           ));
//         } else if (selectedValue == UserRole.Dokter) {
//           firestoreDatabase.setAppUser(HecAntrianModel(
//             appUserUid: aa.appUserUid,
//             appUserRole: 'Dokter',
//             appUserFcmId: aa.appUserFcmId,
//             appUserEmail: aa.appUserEmail,
//           ));
//         } else if (selectedValue == UserRole.Oka) {
//           firestoreDatabase.setAppUser(HecAntrianModel(
//             appUserUid: aa.appUserUid,
//             appUserRole: 'Oka',
//             appUserFcmId: aa.appUserFcmId,
//             appUserEmail: aa.appUserEmail,
//           ));
//         } else if (selectedValue == UserRole.Apotek) {
//           firestoreDatabase.setAppUser(HecAntrianModel(
//             appUserUid: aa.appUserUid,
//             appUserRole: 'Apotek',
//             appUserFcmId: aa.appUserFcmId,
//             appUserEmail: aa.appUserEmail,
//           ));
//         } else if (selectedValue == UserRole.Billing) {
//           firestoreDatabase.setAppUser(HecAntrianModel(
//             appUserUid: aa.appUserUid,
//             appUserRole: 'Billing',
//             appUserFcmId: aa.appUserFcmId,
//             appUserEmail: aa.appUserEmail,
//           ));
//         }
//       },
//       itemBuilder: (_) => [
//         PopupMenuItem(
//           child: Text('User'),
//           value: UserRole.User,
//         ),
//         PopupMenuItem(
//           child: Text('Resepsionis'),
//           value: UserRole.Resepsionis,
//         ),
//         PopupMenuItem(
//           child: Text('Dokter'),
//           value: UserRole.Dokter,
//         ),
//         PopupMenuItem(
//           child: Text('Oka'),
//           value: UserRole.Oka,
//         ),
//         PopupMenuItem(
//           child: Text('Apotek'),
//           value: UserRole.Apotek,
//         ),
//         PopupMenuItem(
//           child: Text('Billing'),
//           value: UserRole.Billing,
//         ),
//       ],
//       icon: Icon(Icons.more_vert),
//     );
//   }

}

import 'package:flutter/material.dart';
import 'package:hecxd/models/app_user_model.dart';
import 'package:hecxd/models/hec_antrian_model.dart';
// import 'package:hecxd/models/user_model.dart';
// import 'package:hecxd/providers/auth_provider.dart';
import 'package:hecxd/routes.dart';
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

class AntriansScreen extends StatefulWidget {
  @override
  _AntriansScreenState createState() => _AntriansScreenState();
}

class _AntriansScreenState extends State<AntriansScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  String _qryDate;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final String _dateNow = ModalRoute.of(context).settings.arguments;
    // print(_dateNow);
    if (_dateNow != null) {
      _qryDate = _dateNow;
    }
  }

  @override
  Widget build(BuildContext context) {
    // final authProvider = Provider.of<AuthProvider>(context);
    // final firestoreDatabase =
    //     Provider.of<FirestoreDatabase>(context, listen: false);

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
            'List Antrian ${DateFormat('EEEE, d MMMM yyyy', 'id_ID').format(DateTime.parse(_qryDate))}'),
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
        stream:
            firestoreDatabase.hecAntrianModelQryByDateStream(query1: _qryDate),
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
                        Navigator.of(context).pushNamed(Routes.user_profile,
                            arguments: hecAntrian[index].appUserUid);
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
}

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:taskmon/models/absensi_model.dart';
// import 'package:taskmon/models/user_model.dart';
import 'package:taskmon/providers/auth_provider.dart';
// import 'package:taskmon/routes.dart';
import 'package:taskmon/services/firestore_database.dart';
import 'package:taskmon/ui/drawer/app_drawer.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:taskmon/models/app_user_model.dart';
import 'package:taskmon/ui/appUser/empty_content.dart';
import 'package:taskmon/providers/app_access_level_provider.dart';
import 'package:taskmon/routes.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class AbsensiSummaryScreen extends StatefulWidget {
  @override
  _AbsensiSummaryScreenState createState() => _AbsensiSummaryScreenState();
}

class _AbsensiSummaryScreenState extends State<AbsensiSummaryScreen> {
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
              return Text('Summary Absensi');
            }),
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
    // final appUserProvider =
    //     Provider.of<AppAccessLevelProvider>(context, listen: false);

    return StreamBuilder(
        stream: firestoreDatabase.appUsersStream(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<AppUserModel> appUser = snapshot.data;
            // appUser.sort((a, b) => b.absensiId.compareTo(a.absensiId));
            if (appUser.isNotEmpty) {
              return Container(
                child: ListView.separated(
                  itemCount: appUser.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(appUser[index].appUserDisplayName == null
                          ? appUser[index].appUserEmail
                          : appUser[index].appUserDisplayName),
                      subtitle: Text('Total Jam Kerja : ' +
                          durationToString(
                              int.parse(appUser[index].appUserTotalJamKerja))),
                      onTap: () {
                        Navigator.of(context).pushNamed(
                            Routes.absensi_summary_detail,
                            arguments: appUser[index].appUserUid);
                      },
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider(height: 0.5);
                  },
                ),
              );
            } else {
              return EmptyContentWidget(
                title: 'Data Absensi belum ada',
                message: 'Tap + untuk menambah data',
              );
            }
          } else if (snapshot.hasError) {
            return EmptyContentWidget(
              title: 'Error. Data Absensi',
              message: 'Error..',
            );
          }
          return Center(child: CircularProgressIndicator());
        });
  }

  String durationToString(int minutes) {
    var d = Duration(minutes: minutes);
    List<String> parts = d.toString().split(':');
    return '${parts[0].padLeft(2, '0')}:${parts[1].padLeft(2, '0')}';
  }
}

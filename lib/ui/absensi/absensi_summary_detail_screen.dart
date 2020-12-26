import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:konsuldok/models/absensi_model.dart';
// import 'package:konsuldok/models/user_model.dart';
import 'package:konsuldok/providers/auth_provider.dart';
// import 'package:konsuldok/routes.dart';
import 'package:konsuldok/services/firestore_database.dart';
import 'package:konsuldok/ui/drawer/app_drawer.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:konsuldok/models/app_user_model.dart';
import 'package:konsuldok/ui/appUser/empty_content.dart';
import 'package:konsuldok/providers/app_access_level_provider.dart';
import 'package:konsuldok/routes.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class AbsensiSummaryDetailScreen extends StatefulWidget {
  @override
  _AbsensiSummaryDetailScreenState createState() =>
      _AbsensiSummaryDetailScreenState();
}

class _AbsensiSummaryDetailScreenState
    extends State<AbsensiSummaryDetailScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  AbsensiModel _absensi;
  String appUid;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // final AbsensiModel _absensiModel =
    //     ModalRoute.of(context).settings.arguments;
    // if (_absensiModel != null) {
    //   _absensi = _absensiModel;
    // }
    final String _appUid = ModalRoute.of(context).settings.arguments;
    if (_appUid != null) {
      appUid = _appUid;
    }
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    // final firestoreDatabase =
    //     Provider.of<FirestoreDatabase>(context, listen: false);

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: StreamBuilder(
            stream: authProvider.user,
            builder: (context, snapshot) {
              // final UserModel user = snapshot.data;
              return Text('Absensi Summary Detail');
            }),
        actions: <Widget>[],
      ),
      // drawer: AppDrawer(),
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
        stream: firestoreDatabase.absensiModelQbyUserIdStream(query1: appUid),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<AbsensiModel> absensi = snapshot.data;

            absensi.sort((a, b) => b.absensiId.compareTo(a.absensiId));
            if (absensi.isNotEmpty) {
              return Container(
                child: ListView.separated(
                  itemCount: absensi.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                        title: Text(DateFormat("EEEE, d MMMM yyyy", "id_ID").format(
                            DateTime.parse(absensi[index].absensiWaktuDatang))),
                        subtitle: Text(absensi[index].absensiPlace +
                            ' - Datang ' +
                            DateFormat("HH:mm:ss", "id_ID").format(DateTime.parse(
                                absensi[index].absensiWaktuDatang)) +
                            '   |   Pulang ' +
                            (absensi[index].absensiWaktuPulang == '2000-01-01'
                                ? '-'
                                : DateFormat("HH:mm:ss", "id_ID").format(
                                    DateTime.parse(
                                        absensi[index].absensiWaktuPulang)))),
                        leading: Text(absensi[index].absensiWaktuPulang ==
                                '2000-01-01'
                            ? durationToString(DateTime.now().difference(DateTime.parse(absensi[index].absensiWaktuDatang)).inMinutes)
                            : durationToString(DateTime.parse(absensi[index].absensiWaktuPulang).difference(DateTime.parse(absensi[index].absensiWaktuDatang)).inMinutes)));
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

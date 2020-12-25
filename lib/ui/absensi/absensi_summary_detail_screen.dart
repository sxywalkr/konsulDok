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

class AbsensiSummaryDetailScreen extends StatefulWidget {
  @override
  _AbsensiSummaryDetailScreenState createState() =>
      _AbsensiSummaryDetailScreenState();
}

class _AbsensiSummaryDetailScreenState
    extends State<AbsensiSummaryDetailScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  AbsensiModel _absensi;

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();

    final AbsensiModel _absensiModel =
        ModalRoute.of(context).settings.arguments;
    if (_absensiModel != null) {
      _absensi = _absensiModel;
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
              return Text('Absensi');
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
        stream: firestoreDatabase.absensiModelQbyUserIdStream(
            query1: _absensi.appUserUid),
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
                      title: Text(DateFormat("EEEE, d MMMM yyyy", "id_ID")
                          .format(DateTime.parse(
                              absensi[index].absensiWaktuDatang))),
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
}

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

class AbsensiScreen extends StatefulWidget {
  @override
  _AbsensiScreenState createState() => _AbsensiScreenState();
}

class _AbsensiScreenState extends State<AbsensiScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  String _absensiPlace = 'Kantor';

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
              return Text('Absensi');
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
    final appUserProvider =
        Provider.of<AppAccessLevelProvider>(context, listen: false);

    return StreamBuilder(
        stream: firestoreDatabase.absensiModelQbyUserIdStream(
            query1: appUserProvider.appxUserUid),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<AbsensiModel> absensi = snapshot.data;
            absensi.sort((a, b) => b.absensiId.compareTo(a.absensiId));
            if (absensi.isNotEmpty) {
              return Container(
                color: Colors.grey[100],
                // margin: EdgeInsets.all(15),
                // padding: EdgeInsets.all(20),
                width: double.infinity,
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height -
                          MediaQuery.of(context).padding.top -
                          MediaQuery.of(context).padding.bottom -
                          kToolbarHeight -
                          200,
                      color: Colors.white,
                      // margin: EdgeInsets.all(5),
                      // padding: EdgeInsets.all(20),
                      child: ListView.separated(
                        itemCount: absensi.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(DateFormat("EEEE, d MMMM yyyy", "id_ID")
                                .format(DateTime.parse(
                                    absensi[index].absensiWaktuDatang))),
                            subtitle: Text(absensi[index].absensiPlace +
                                ' - Datang ' +
                                DateFormat("HH:mm:ss", "id_ID").format(
                                    DateTime.parse(
                                        absensi[index].absensiWaktuDatang)) +
                                '   |   Pulang ' +
                                (absensi[index].absensiWaktuPulang ==
                                        '2000-01-01'
                                    ? '-'
                                    : DateFormat("HH:mm:ss", "id_ID").format(
                                        DateTime.parse(absensi[index]
                                            .absensiWaktuPulang)))),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return Divider(height: 0.5);
                        },
                      ),
                    ),
                    Container(
                      // color: Colors.black26,
                      width: double.infinity,
                      // height: double.infinity,
                      child: StreamBuilder(
                          stream: Firestore.instance
                              .collection('appUsers')
                              .where('appUserUid',
                                  isEqualTo: appUserProvider.appxUserUid)
                              .snapshots(),
                          builder:
                              (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                            // print(appUserModel.appUserFlagActivity);
                            if (snapshot.hasError)
                              return new Text('Error: ${snapshot.error}');

                            switch (snapshot.connectionState) {
                              case ConnectionState.waiting:
                                return new Center(
                                  child: CircularProgressIndicator(),
                                );
                              default:
                                AppUserModel appUser = AppUserModel.fromMap(
                                    snapshot.data.documents.first.data, 'null');
                                return Column(
                                  children: [
                                    // Text('status' +
                                    //     appUser.appUserFlagActivity),
                                    if (appUser.appUserFlagActivity ==
                                        'Tidak Bekerja')
                                      _cbxAbsensiPlase(context),
                                    if (appUser.appUserFlagActivity ==
                                        'Tidak Bekerja')
                                      RaisedButton(
                                        onPressed: () =>
                                            _confirmAbsensi(context, 'Datang'),
                                        child: Text("Absen Datang"),
                                      ),
                                    if (appUser.appUserFlagActivity ==
                                        'Bekerja')
                                      RaisedButton(
                                        onPressed: () =>
                                            _confirmAbsensi(context, 'Pulang'),
                                        child: Text("Absen Pulang"),
                                      ),
                                  ],
                                );
                            }
                          }),
                    ),
                  ],
                ),
              );
            } else {
              // return EmptyContentWidget(
              //   title: 'Data Absensi belum ada',
              //   message: 'Tap + untuk menambah data',
              // );
              return Column(
                children: [
                  _cbxAbsensiPlase(context),
                  Container(
                    // color: Colors.black26,
                    width: double.infinity,
                    height: 300,
                    child: StreamBuilder(
                        stream: Firestore.instance
                            .collection('appUsers')
                            .where('appUserUid',
                                isEqualTo: appUserProvider.appxUserUid)
                            .snapshots(),
                        builder:
                            (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                          // print(appUserModel.appUserFlagActivity);
                          if (snapshot.hasError)
                            return new Text('Error: ${snapshot.error}');

                          switch (snapshot.connectionState) {
                            case ConnectionState.waiting:
                              return new Center(
                                child: CircularProgressIndicator(),
                              );
                            default:
                              AppUserModel appUser = AppUserModel.fromMap(
                                  snapshot.data.documents.first.data, 'null');
                              return Column(
                                children: [
                                  // Text('status' +
                                  //     appUser.appUserFlagActivity),

                                  if (appUser.appUserFlagActivity ==
                                          'Tidak Bekerja' ||
                                      appUser.appUserFlagActivity ==
                                          'Site, Waiting approval')
                                    RaisedButton(
                                      onPressed: () =>
                                          _confirmAbsensi(context, 'Datang'),
                                      child: Text("Absen Datang"),
                                    ),
                                  if (appUser.appUserFlagActivity == 'Bekerja')
                                    RaisedButton(
                                      onPressed: () =>
                                          _confirmAbsensi(context, 'Pulang'),
                                      child: Text("Absen Pulang"),
                                    ),
                                ],
                              );
                          }
                        }),
                  ),
                ],
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

  _confirmAbsensi(BuildContext context, String flagAbsen) {
    showPlatformDialog(
        context: context,
        builder: (_) => PlatformAlertDialog(
              android: (_) => MaterialAlertDialogData(
                  backgroundColor: Theme.of(context).buttonColor),
              title: Text('TaskMon Notification'),
              content: Text(flagAbsen == 'Datang'
                  ? 'Anda akan melakukan Absensi Datang di $_absensiPlace. \nTeruskan?'
                  : 'Anda sudah menyelesaikan semua kerjaan? \nTeruskan Absensi Pulang?'),
              actions: <Widget>[
                PlatformDialogAction(
                  child: Text('Batal'),
                  onPressed: () => Navigator.pop(context),
                ),
                PlatformDialogAction(
                  child: Text('Lanjut'),
                  onPressed: () async {
                    final appUserProvider = Provider.of<AppAccessLevelProvider>(
                        context,
                        listen: false);

                    final aa = await Geolocator.getCurrentPosition();

                    final distance = Geolocator.distanceBetween(
                        double.parse(appUserProvider
                            .absensiSetting.absensiSettingOfficeLat),
                        double.parse(appUserProvider
                            .absensiSetting.absensiSettingOfficeLong),
                        aa.latitude,
                        aa.longitude);

                    if (flagAbsen == 'Pulang') {
                      _absensiPlace = 'Pulang';
                    } else {
                      _absensiPlace = _absensiPlace;
                    }
                    print(_absensiPlace);
                    if (_absensiPlace == 'Kantor') {
                      if (distance <=
                          double.parse(appUserProvider
                              .absensiSetting.absensiSettingOfficeRadius)) {
                        _prosesAbsensiOk(flagAbsen, aa);
                        Navigator.pop(context);

                        Navigator.of(context).pushNamedAndRemoveUntil(
                            Routes.home21, ModalRoute.withName(Routes.home21));
                      } else {
                        Navigator.pop(context);
                        _scaffoldKey.currentState.showSnackBar(SnackBar(
                          backgroundColor: Theme.of(context).colorScheme.error,
                          content: Text(
                            'Maaf, Proses Absensi di $_absensiPlace gagal. Pastikan anda berada dalam radius absensi ${appUserProvider.absensiSetting.absensiSettingOfficeRadius} meter. \nAnda berada ${distance.toStringAsFixed(2)} meter dari $_absensiPlace.',
                            style:
                                TextStyle(color: Theme.of(context).canvasColor),
                          ),
                          duration: Duration(seconds: 3),
                        ));
                      }
                    } else if (_absensiPlace == 'Site') {
                      _prosesAbsensiOk(flagAbsen, aa);
                      Navigator.pop(context);
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          Routes.home21, ModalRoute.withName(Routes.home21));
                    }
                    if (_absensiPlace == 'Pulang') {
                      _prosesAbsensiOk(flagAbsen, aa);
                      Navigator.pop(context);
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          Routes.home21, ModalRoute.withName(Routes.home21));
                    }
                  },
                )
              ],
            ));
  }

  void _prosesAbsensiOk(String flagAbsen, Position aa) async {
    final appUserProvider =
        Provider.of<AppAccessLevelProvider>(context, listen: false);
    final firestoreDatabase =
        Provider.of<FirestoreDatabase>(context, listen: false);
    final dbReference = Firestore.instance;

    if (flagAbsen == 'Datang') {
      final currDate = documentIdFromCurrentDate();
      firestoreDatabase.setabsensi(
        AbsensiModel(
          absensiId: currDate,
          appUserUid: appUserProvider.appxUserUid,
          absensiWaktuDatang: DateTime.now().toIso8601String(),
          absensiWaktuPulang: '2000-01-01',
          absensiLong: aa.longitude.toString(),
          absensiLat: aa.latitude.toString(),
          absensiStatus: 'Open',
          absensiPlace: _absensiPlace == 'Site'
              ? 'Site, Waiting approval'
              : _absensiPlace,
        ),
      );

      dbReference
          .collection('appUsers')
          .document(appUserProvider.appxUserUid)
          .updateData(
        {
          'appUserFlagActivity':
              _absensiPlace == 'Site' ? 'Site, Waiting approval' : 'Bekerja',
        },
      );
    } else if (flagAbsen == 'Pulang') {
      //cek apakah sudah absen waktu datang
      Map<String, dynamic> data1 = {};
      final qSnap1 = await dbReference
          .collection("absensi")
          .where('absensiStatus', isEqualTo: 'Open')
          .where('appUserUid', isEqualTo: appUserProvider.appxUserUid)
          .getDocuments();
      for (DocumentSnapshot ds in qSnap1.documents) {
        data1 = ds.data;
      }
      // print(data1['absensiId']);
      dbReference.collection('absensi').document(data1['absensiId']).updateData(
        {
          'absensiWaktuPulang': DateTime.now().toIso8601String(),
          'absensiStatus': 'Closed'
        },
      );

      dbReference
          .collection('appUsers')
          .document(appUserProvider.appxUserUid)
          .updateData(
        {
          'appUserFlagActivity': 'Tidak Bekerja',
        },
      );
    }
  }

  Widget _cbxAbsensiPlase(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Pilih Tempat Absen'),
          DropdownButton<String>(
            isExpanded: true,
            value: _absensiPlace,
            items: [
              'Kantor',
              // 'Rumah',
              'Site',
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String newValue) async {
              setState(() {
                _absensiPlace = newValue;
              });
            },
          ),
        ],
      ),
    );
  }
}

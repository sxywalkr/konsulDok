// import 'dart:js';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:konsuldok/models/absensi_model.dart';
import 'package:konsuldok/ui/drawer/app_drawer.dart';
import 'package:konsuldok/ui/widget/user_hero3_widget.dart';
import 'package:konsuldok/services/firestore_database.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:konsuldok/providers/app_access_level_provider.dart';
// import 'package:konsuldok/models/hec_antrian_model.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:konsuldok/routes.dart';
import 'package:geolocator/geolocator.dart';
import 'package:konsuldok/ui/project/project_widget_screen.dart';
import 'package:konsuldok/ui/projectFeed/project_feed_widget_screen.dart';

class Home21Screen extends StatelessWidget {
  Home21Screen({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('konsuldok'),
      ),
      drawer: AppDrawer(),
      body: Container(
        // color: Colors.black26,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              // alignment: Alignment.bottomCenter,
              children: <Widget>[
                UserHero3Widget(),
              ],
            ),

            Padding(
              padding: const EdgeInsets.only(top: 15, left: 10),
              child: Text(
                'My Project',
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            // Text((MediaQuery.of(context).size.height -
            //         MediaQuery.of(context).padding.top -
            //         MediaQuery.of(context).padding.bottom -
            //         kToolbarHeight)
            //     .toString()),

            Container(
              // color: Colors.black12,
              margin: EdgeInsets.all(12),
              height: MediaQuery.of(context).size.height -
                  MediaQuery.of(context).padding.top -
                  MediaQuery.of(context).padding.bottom -
                  kToolbarHeight -
                  (((MediaQuery.of(context).size.height / 3) * 2)) -
                  50,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  )
                ],
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ProjectWidgetScreen(),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 15, left: 10),
              child: Text(
                'My Feed',
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            Container(
              // color: Colors.black12,
              margin: EdgeInsets.all(12),
              height: MediaQuery.of(context).size.height -
                  MediaQuery.of(context).padding.top -
                  MediaQuery.of(context).padding.bottom -
                  kToolbarHeight -
                  (((MediaQuery.of(context).size.height / 3) * 1.3)),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  )
                ],
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ProjectFeedWidgetScreen(),
              ),
            ),

            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Expanded(child: cardActivityIn(context)),
            //     Expanded(child: cardActivityOut(context)),
            //   ],
            // ),

            // cardActivity(context, 'Anda belum antri di poli',
            //     'Klik untuk mendapatkan antrian', '', 'notif'),
            // cardDetail('Bonus', 'Dapat Bonus Proyek', '500.000', 'in'),
            // cardDetail('Beli Baju', 'Baju Kemeja Kantor', '250.000', 'out'),
          ],
        ),
      ),
    );
  }
}

Widget cardActivityIn(BuildContext context) {
  final appUserProvider =
      Provider.of<AppAccessLevelProvider>(context, listen: false);

  return Card(
    margin: EdgeInsets.only(top: 15, left: 15, right: 15),
    elevation: 8,
    child: Container(
      // padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
      // alignment: Alignment.center,
      height: 85,
      child: StreamBuilder(
        stream: Firestore.instance
            .collection('absensi')
            .where('appUserUid', isEqualTo: appUserProvider.appxUserUid)
            .where('absensiStatus', isEqualTo: 'Bekerja')
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasData) {
            if (snapshot.data.documents.isNotEmpty) {
              return new ListView(
                children:
                    snapshot.data.documents.map((DocumentSnapshot document) {
                  DateTime tglAntri =
                      DateTime.parse(document['absensiWaktuDatang']);
                  String tgl = DateFormat("HH:mm", "id_ID")
                      // DateFormat("EEEE, d MMMM yyyy H:m", "id_ID")
                      .format(tglAntri);
                  return WidgetResult(tgl: tgl, document: document);
                }).toList(),
              );
            }
          }
          return WidgetResult(tgl: '');

          // return Center(child: CircularProgressIndicator());
        },
      ),
    ),
  );
}

class WidgetResult extends StatelessWidget {
  const WidgetResult({
    Key key,
    @required this.tgl,
    this.document,
  }) : super(key: key);

  final String tgl;
  final DocumentSnapshot document;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => document == null ? _confirmAbsensi(context) : null,
      child: new ListTile(
        contentPadding: EdgeInsets.all(8),
        tileColor: Colors.green[100],
        leading: Icon(
          document == null
              ? Icons.subdirectory_arrow_left
              : Icons.subdirectory_arrow_right,
          size: 35,
          // color: Colors.lightGreen,
        ),
        title: Text(
          document == null ? 'Tidak Bekerja' : 'Kedatangan',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(document == null ? 'Tap untuk Absen' : '$tgl'),
        trailing: Text(
          '',
          style: TextStyle(color: Colors.lightGreen),
        ),
      ),
    );
  }
}

Widget cardActivityOut(BuildContext context) {
  final appUserProvider =
      Provider.of<AppAccessLevelProvider>(context, listen: false);

  return Card(
    margin: EdgeInsets.only(top: 15, left: 15, right: 15),
    elevation: 8,
    child: Container(
      height: 85,
      child: StreamBuilder(
        stream: Firestore.instance
            .collection('appUsers')
            .where('appUserUid', isEqualTo: appUserProvider.appxUserUid)
            // .where('absensiStatus', isEqualTo: 'Tidak Bekerja')
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasData) {
            if (snapshot.data.documents.isNotEmpty) {
              return new ListView(
                children:
                    snapshot.data.documents.map((DocumentSnapshot document) {
                  return InkWell(
                      onTap: () => document == null,
                      child: Text('Selesai Bekerja?'));
                }).toList(),
              );
            }
          }
          return WidgetResult(tgl: '');

          // return Center(child: CircularProgressIndicator());
        },
      ),
    ),
  );
}

Future<void> _presentDatePicker(context) async {
  showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(2020),
    lastDate: DateTime.now().add(Duration(days: 30)),
    builder: (BuildContext context, Widget child) {
      return Theme(
        data: ThemeData.light().copyWith(
          primaryColor: Theme.of(context).primaryColor,
          // accentColor: const Color(0xFF8CE7F1),
          // colorScheme: ColorScheme.light(primary: const Color(0xFF8CE7F1)),
          // buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
        ),
        child: child,
      );
    },
  ).then((e) async {
    if (e == null) {
      return;
    }
    try {
      try {
        final appUserProvider =
            Provider.of<AppAccessLevelProvider>(context, listen: false);
        final firestoreDatabase =
            Provider.of<FirestoreDatabase>(context, listen: false);
        final dbReference = FirebaseFirestore.instance;
        // final HecAntrianModel _hecAntrian;

        //cek apakah sudah ada antrian di hari req
        Map<String, dynamic> data1 = {};
        final qSnap1 = await dbReference
            .collection("hecAntrians")
            .where('hecAntrianTglAntri', isEqualTo: e.toIso8601String())
            .get();
        for (DocumentSnapshot ds in qSnap1.docs) {
          data1 = ds.data();
        }
        print(data1.length);
        String hNomorAntri = '0';
        if (data1['hecAntrianTglAntri'] == null) {
          //hecAntrianNomorAntri = 1
          hNomorAntri = '1';
        } else {
          //hecAntrianNomorAntri + 1
          hNomorAntri =
              (int.parse(data1['hecAntrianNomorAntri']) + 1).toString();
        }

        // update db hecAntrians
        // final currDate = documentIdFromCurrentDate();
        // firestoreDatabase.setHecAntrian(HecAntrianModel(
        //   hecAntrianId: currDate,
        //   appUserUid: appUserProvider.appxUserUid,
        //   hecAntrianNomorAntri: hNomorAntri,
        //   hecAntrianTglAntri: e.toIso8601String(),
        //   hecAntrianStatusAntri: 'yes',
        // ));

        // update status user
        dbReference
            .collection('appUsers')
            .document(appUserProvider.appxUserUid)
            .updateData(
          {
            'appUserFlagActivity': 'Antri Poli',
          },
        );
      } catch (error1) {
        print(error1);
      }
    } catch (error) {
      await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error occurred'),
          content: Text('Something went wrong. $error'),
          actions: <Widget>[
            FlatButton(
              child: Text('Okay'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      );
    }
  });
}

Widget cardActivity(
    BuildContext context, title, description, subDescription, type) {
  return Card(
    margin: EdgeInsets.only(top: 15, left: 15, right: 15),
    elevation: 8,
    child: InkWell(
      onTap: () => _confirmAbsensi(context),
      child: ListTile(
        leading: Icon(
          Icons.notifications_none_outlined,
          color: Colors.lightGreen,
        ),
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(description),
        trailing: Text(
          subDescription,
          style: TextStyle(color: Colors.lightGreen),
        ),
      ),
    ),
  );
}

_confirmAbsensi(BuildContext context) {
  showPlatformDialog(
      context: context,
      builder: (_) => PlatformAlertDialog(
            android: (_) => MaterialAlertDialogData(
                backgroundColor: Theme.of(context).primaryColor),
            title: Text('konsuldok'),
            content: Text('Anda akan melakukan Absensi. Teruskan?'),
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
                  final firestoreDatabase =
                      Provider.of<FirestoreDatabase>(context, listen: false);
                  final dbReference = FirebaseFirestore.instance;
                  final aa = await Geolocator.getCurrentPosition();

                  //cek apakah sudah absen waktu datang
                  Map<String, dynamic> data1 = {};
                  final qSnap1 = await dbReference
                      .collection("absensi")
                      .where('absensiWaktuDatang',
                          isEqualTo: DateTime.now().toIso8601String())
                      .where('appUserUid',
                          isEqualTo: appUserProvider.appxUserUid)
                      .get();
                  for (DocumentSnapshot ds in qSnap1.docs) {
                    data1 = ds.data();
                  }

                  // update db absensi
                  final currDate = documentIdFromCurrentDate();
                  firestoreDatabase.setabsensi(
                    AbsensiModel(
                      absensiId: currDate,
                      appUserUid: appUserProvider.appxUserUid,
                      absensiWaktuDatang: DateTime.now().toIso8601String(),
                      absensiWaktuPulang: DateTime.now().toIso8601String(),
                      absensiLong: aa.longitude.toString(),
                      absensiLat: aa.latitude.toString(),
                      absensiStatus: 'Bekerja',
                    ),
                  );

                  dbReference
                      .collection('appUsers')
                      .doc(appUserProvider.appxUserUid)
                      .update(
                    {
                      'appUserFlagActivity': 'Bekerja',
                    },
                  );

                  Navigator.pop(context);
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      Routes.home21, ModalRoute.withName(Routes.home21));
                },
              )
            ],
          ));
}

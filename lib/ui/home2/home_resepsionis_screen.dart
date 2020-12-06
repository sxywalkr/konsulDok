// import 'dart:js';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:hecxd/ui/drawer/app_drawer.dart';
import 'package:hecxd/ui/widget/user_hero2_widget.dart';
import 'package:hecxd/services/firestore_database.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hecxd/providers/app_access_level_provider.dart';
import 'package:hecxd/models/hec_antrian_model.dart';
import 'package:hecxd/routes.dart';

class HomeResepsionisScreen extends StatelessWidget {
  HomeResepsionisScreen({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HEC - Resepsionis'),
      ),
      drawer: AppDrawer(),
      body: Container(
        child: Column(
          children: <Widget>[
            Stack(
              // alignment: Alignment.bottomCenter,
              children: <Widget>[
                UserHero2Widget(),
              ],
            ),
            // card hecAntrians
            cardActivityAntri(context),
          ],
        ),
      ),
    );
  }
}

Widget cardActivityAntri(BuildContext context) {
  // final appUserProvider =
  //     Provider.of<AppAccessLevelProvider>(context, listen: false);
  final dateNow = DateFormat('yyyy-MM-ddT00:00:00.000')
      .format(DateTime.parse(DateTime.now().toIso8601String()));
  // print(dateNow);
  return Card(
    margin: EdgeInsets.only(top: 15, left: 15, right: 15),
    elevation: 8,
    child: Container(
      padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
      // alignment: Alignment.center,
      height: 100,
      child: StreamBuilder(
        stream: Firestore.instance
            .collection('hecAntrians')
            .where('hecAntrianTglAntri', isEqualTo: dateNow)
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          // print(snapshot.data.documents.length);
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
                  return WidgetResult(
                      dateNow: dateNow,
                      totalAntri: snapshot.data.documents.length.toString());
                }).toList(),
              );
            }
          }
          return WidgetResult(dateNow: dateNow);
        },
      ),
    ),
  );
}

class WidgetResult extends StatelessWidget {
  const WidgetResult({
    Key key,
    @required this.dateNow,
    this.totalAntri,
  }) : super(key: key);

  final String dateNow;
  final String totalAntri;

  @override
  Widget build(BuildContext context) {
    final dateNow1 = DateFormat('EEEE, d MMMM yyyy', 'id_ID')
        .format(DateTime.parse(dateNow));
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          Routes.antrians,
        );
      },
      child: new ListTile(
        title: Text(
          'Hari ini $dateNow1 ada ${totalAntri == null ? 0 : totalAntri} antrian',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
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
        final dbReference = Firestore.instance;
        // final HecAntrianModel _hecAntrian;

        //cek apakah sudah ada antrian di hari req
        Map<String, dynamic> data1 = {};
        final qSnap1 = await dbReference
            .collection("hecAntrians")
            .where('hecAntrianTglAntri', isEqualTo: e.toIso8601String())
            .getDocuments();
        for (DocumentSnapshot ds in qSnap1.documents) {
          data1 = ds.data;
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
        final currDate = documentIdFromCurrentDate();
        firestoreDatabase.setHecAntrian(HecAntrianModel(
          hecAntrianId: currDate,
          appUserUid: appUserProvider.appxUserUid,
          hecAntrianNomorAntri: hNomorAntri,
          hecAntrianTglAntri: e.toIso8601String(),
          hecAntrianStatusAntri: 'yes',
        ));

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
      onTap: () => _presentDatePicker(context),
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

import 'package:flutter/material.dart';
import 'package:taskmon/models/absensi_setting_model.dart';
// import 'package:taskmon/models/user_model.dart';
import 'package:taskmon/providers/auth_provider.dart';
import 'package:taskmon/routes.dart';
import 'package:taskmon/services/firestore_database.dart';
import 'package:taskmon/ui/drawer/app_drawer.dart';
import 'package:provider/provider.dart';

import 'package:taskmon/models/app_user_model.dart';
import 'package:taskmon/ui/widget/empty_content.dart';

class AbsensiSettingScreen extends StatelessWidget {
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
              return Text('Pengaturan Absensi');
            }),
        actions: <Widget>[],
      ),
      drawer: AppDrawer(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).pushNamed(
            Routes.create_edit_absensi_setting,
          );
        },
      ),
      body: WillPopScope(
          onWillPop: () async => false, child: _buildBodySection(context)),
    );
  }

  Widget _buildBodySection(BuildContext context) {
    final firestoreDatabase =
        Provider.of<FirestoreDatabase>(context, listen: false);

    return StreamBuilder(
        stream: firestoreDatabase.absensiSettingsStream(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<AbsensiSettingModel> absensiSetting = snapshot.data;
            if (absensiSetting.isNotEmpty) {
              return ListView.separated(
                itemCount: absensiSetting.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(absensiSetting[index].absensiSettingHomeRadius),
                    subtitle: Text(
                        '${absensiSetting[index].absensiSettingHomeRadius}'),
                    trailing: Text('--'),
                    onTap: () {
                      // Navigator.of(context).pushNamed(
                      //     Routes.create_edit_appUser,
                      //     arguments: absensiSetting[index]);
                    },
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider(height: 0.5);
                },
              );
            } else {
              return EmptyContentWidget(
                title: 'Data Project Feed belum ada',
                message: 'Menunggu assignment',
              );
            }
          } else if (snapshot.hasError) {
            return EmptyContentWidget(
              title: 'Error. Data Project Feed',
              message: 'Error..',
            );
          }
          return Center(child: CircularProgressIndicator());
        });
  }
}

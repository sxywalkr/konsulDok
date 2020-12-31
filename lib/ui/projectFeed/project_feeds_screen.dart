import 'package:flutter/material.dart';
// import 'package:konsuldok/models/user_model.dart';
import 'package:konsuldok/providers/auth_provider.dart';
// import 'package:konsuldok/routes.dart';
import 'package:konsuldok/services/firestore_database.dart';
import 'package:konsuldok/ui/appDrawer/app_drawer.dart';
import 'package:provider/provider.dart';

import 'package:konsuldok/models/app_user_model.dart';
import 'package:konsuldok/ui/widget/empty_content.dart';

class ProjectFeedsScreen extends StatelessWidget {
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
              return Text('Project Feed');
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
            if (appUsers.isNotEmpty) {
              return ListView.separated(
                itemCount: appUsers.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(appUsers[index].appUserEmail),
                    subtitle: Text('${appUsers[index].appUserRole}'),
                    trailing: Text('--'),
                    onTap: () {
                      // Navigator.of(context).pushNamed(
                      //     Routes.create_edit_appUser,
                      //     arguments: appUsers[index]);
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

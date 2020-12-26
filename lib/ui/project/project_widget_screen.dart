import 'package:flutter/material.dart';
// import 'package:konsuldok/app_localizations.dart';
import 'package:konsuldok/models/project_model.dart';
// import 'package:konsuldok/models/user_model.dart';
// import 'package:konsuldok/providers/auth_provider.dart';
import 'package:konsuldok/routes.dart';
import 'package:konsuldok/services/firestore_database.dart';
// import 'package:konsuldok/ui/drawer/app_drawer.dart';
import 'package:konsuldok/ui/project/empty_content.dart';
import 'package:provider/provider.dart';
import 'package:konsuldok/providers/app_access_level_provider.dart';

class ProjectWidgetScreen extends StatelessWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    // final authProvider = Provider.of<AuthProvider>(context);
    // final firestoreDatabase =
    //     Provider.of<FirestoreDatabase>(context, listen: false);

    return Scaffold(
      key: _scaffoldKey,
      // appBar: AppBar(
      //   title: Text('Manage Project'),
      // ),
      // drawer: AppDrawer(),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.add),
      //   onPressed: () {
      //     Navigator.of(context).pushNamed(
      //       Routes.create_edit_project,
      //     );
      //   },
      // ),
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
        stream: appUserProvider.appxUserRole == 'User'
            ? firestoreDatabase.projectModelQbyUserIdStream(
                query1: appUserProvider.appxUserUid)
            : firestoreDatabase.projectsStream(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<ProjectModel> project = snapshot.data;
            if (project.isNotEmpty) {
              return ListView.separated(
                itemCount: project.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                    background: Container(
                      color: Colors.red,
                      child: Center(
                          child: Text(
                        'Geser Hapus',
                        style: TextStyle(color: Theme.of(context).canvasColor),
                      )),
                    ),
                    key: Key(project[index].projectId),
                    // onDismissed: (direction) {
                    //   firestoreDatabase.deleteProject(project[index]);

                    //   _scaffoldKey.currentState.showSnackBar(SnackBar(
                    //     backgroundColor: Theme.of(context).appBarTheme.color,
                    //     content: Text(
                    //       'Hapus ' + project[index].projectName,
                    //       style:
                    //           TextStyle(color: Theme.of(context).canvasColor),
                    //     ),
                    //     duration: Duration(seconds: 3),
                    //     action: SnackBarAction(
                    //       label: 'Batal',
                    //       textColor: Theme.of(context).canvasColor,
                    //       onPressed: () {
                    //         firestoreDatabase.setProject(project[index]);
                    //       },
                    //     ),
                    //   ));
                    // },
                    child: ListTile(
                      title: Text(project[index].projectName),
                      subtitle: Text('Progress : ' +
                          double.parse(project[index].projectPersenActivity)
                              .toStringAsFixed(2) +
                          '%'),
                      onTap: () {
                        if (appUserProvider.appxUserRole != 'User') {
                          Navigator.of(context).pushNamed(
                              Routes.edit_project_progress,
                              arguments: project[index]);
                        }
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
                title: 'Belum ada Project',
                message: 'Menunggu assigment',
              );
            }
          } else if (snapshot.hasError) {
            return EmptyContentWidget(
              title: 'Terjadi kesalahan',
              message: 'Pastikan Internet Normal',
            );
          }
          return Center(child: CircularProgressIndicator());
        });
  }
}

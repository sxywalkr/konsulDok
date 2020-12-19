import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:taskmon/models/project_feed_model.dart';
// import 'package:taskmon/models/user_model.dart';
import 'package:taskmon/providers/auth_provider.dart';
import 'package:taskmon/routes.dart';
import 'package:taskmon/services/firestore_database.dart';
import 'package:taskmon/ui/drawer/app_drawer.dart';
import 'package:provider/provider.dart';

import 'package:taskmon/models/app_user_model.dart';
import 'package:taskmon/ui/widget/empty_content.dart';
import 'package:taskmon/providers/app_access_level_provider.dart';

class ProjectFeedWidgetScreen extends StatelessWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    // final firestoreDatabase =
    //     Provider.of<FirestoreDatabase>(context, listen: false);

    return Scaffold(
      key: _scaffoldKey,
      // appBar: AppBar(
      //   title: StreamBuilder(
      //       stream: authProvider.user,
      //       builder: (context, snapshot) {
      //         // final UserModel user = snapshot.data;
      //         return Text('Project Feed');
      //       }),
      //   actions: <Widget>[],
      // ),
      // drawer: AppDrawer(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).pushNamed(
            Routes.create_edit_project_feed,
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
    final appUserProvider =
        Provider.of<AppAccessLevelProvider>(context, listen: false);
    return StreamBuilder(
        stream: firestoreDatabase.projectFeedModelQbyUserIdStream(
            query1: appUserProvider.appxUserUid),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<ProjectFeedModel> projectFeed = snapshot.data;
            if (projectFeed.isNotEmpty) {
              return ListView.separated(
                itemCount: projectFeed.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Project: ' +
                        projectFeed[index].projectName +
                        '\n(' +
                        projectFeed[index].projectFeedMainTask +
                        ' ' +
                        projectFeed[index].projectFeedPersentase +
                        ' %)'),
                    subtitle:
                        Text(projectFeed[index].projectFeedActivityDescription),
                    trailing: Column(
                      children: [
                        Text(projectFeed[index].projectFeedStatus),
                        Text(
                          DateFormat("EEEE, d MMMM yyyy HH:mm", "id_ID").format(
                              DateTime.parse(
                                  projectFeed[index].projectFeedDateSubmit)),
                          style: Theme.of(context).textTheme.caption,
                        )
                      ],
                    ),
                    onTap: () {
                      // Navigator.of(context).pushNamed(
                      //     Routes.create_edit_appUser,
                      //     arguments: projectFeed[index]);
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
                message: 'Tap + untuk submit',
              );
            }
          } else if (snapshot.hasError) {
            return EmptyContentWidget(
              title: 'Error. Data Project Feed',
              message: 'Pastikan koneksi internet stabil',
            );
          }
          return Center(child: CircularProgressIndicator());
        });
  }
}

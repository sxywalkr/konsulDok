import 'package:flutter/material.dart';
import 'package:konsuldok/models/app_user_model.dart';
// import 'package:konsuldok/models/app_user_model.dart';
// import 'package:konsuldok/models/user_model.dart';
import 'package:konsuldok/providers/app_access_level_provider.dart';
import 'package:konsuldok/routes.dart';
import 'package:provider/provider.dart';
// import 'package:konsuldok/providers/auth_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserHero3Widget extends StatelessWidget {
  final String appUserUid;
  final String message;

  UserHero3Widget({Key key, this.appUserUid, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final authProvider = Provider.of<AuthProvider>(context).userUid;
    final appUserProvider =
        Provider.of<AppAccessLevelProvider>(context, listen: false);
    return Container(
      height: 100,
      width: double.infinity,
      // alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Theme.of(context).buttonColor,
      ),
      child: StreamBuilder(
          stream: Firestore.instance
              .collection('appUsers')
              .where('appUserUid', isEqualTo: appUserProvider.appxUserUid)
              .snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) return new Text('Error: ${snapshot.error}');
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return new Center(
                  child: CircularProgressIndicator(),
                );
              default:
                return new ListView(
                  children:
                      snapshot.data.documents.map((DocumentSnapshot document) {
                    return new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            children: [
                              Text(
                                '${document['appUserDisplayName'] == null ? document['appUserEmail'] : document['appUserDisplayName']}',
                                style: Theme.of(context).textTheme.headline4,
                              ),
                              Text(
                                'Role : ${document['appUserRole']}',
                                style: Theme.of(context).textTheme.subtitle1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            children: [
                              Text(
                                'Status',
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                              Container(
                                // color: Colors.black12,
                                width: 180,
                                child: Text(
                                  '${document['appUserFlagActivity']}',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  softWrap: false,
                                  style: Theme.of(context).textTheme.headline5,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                );
            }
          }),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:hecxd/models/app_user_model.dart';
// import 'package:hecxd/models/app_user_model.dart';
// import 'package:hecxd/models/user_model.dart';
import 'package:hecxd/providers/app_access_level_provider.dart';
import 'package:hecxd/routes.dart';
import 'package:provider/provider.dart';
// import 'package:hecxd/providers/auth_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserHero2Widget extends StatelessWidget {
  final String appUserUid;
  final String message;

  UserHero2Widget({Key key, this.appUserUid, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final authProvider = Provider.of<AuthProvider>(context).userUid;
    final appUserProvider = Provider.of<AppAccessLevelProvider>(context);
    return Container(
      height: 150,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
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
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 20,
                          ),
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                  Routes.create_edit_user,
                                  arguments:
                                      AppUserModel.fromJson(document.data));
                            },
                            child: CircleAvatar(
                              child: Text(
                                  '${document['appUserEmail'].substring(0, 1)}'),
                              radius: 40,
                              backgroundColor:
                                  Theme.of(context).colorScheme.primaryVariant,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Text(
                              '${document['appUserDisplayName'] == null ? document['appUserEmail'] : document['appUserDisplayName']}'),
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

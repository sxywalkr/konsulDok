import 'package:flutter/material.dart';
import 'package:konsuldok/models/app_user_model.dart';
// import 'package:konsuldok/models/app_user_model.dart';
// import 'package:konsuldok/models/user_model.dart';
import 'package:konsuldok/providers/app_access_level_provider.dart';
import 'package:konsuldok/routes.dart';
import 'package:provider/provider.dart';
// import 'package:konsuldok/providers/auth_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserHero2Widget extends StatelessWidget {
  final String appUserUid;
  final String message;

  UserHero2Widget({Key key, this.appUserUid, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final authProvider = Provider.of<AuthProvider>(context).userUid;
    final appUserProvider =
        Provider.of<AppAccessLevelProvider>(context, listen: false);
    return Container(
      height: 150,
      width: double.infinity,
      // alignment: Alignment.center,
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
                            top: 30,
                          ),
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                Routes.user_profile,
                                arguments: document['appUserUid'],
                              );
                            },
                            child: CircleAvatar(
                              child: Text(
                                '${document['appUserEmail'].substring(0, 1).toString().toUpperCase()}',
                                style: DefaultTextStyle.of(context)
                                    .style
                                    .apply(fontSizeFactor: 3.0),
                              ),
                              radius: 40,
                              backgroundColor:
                                  Theme.of(context).colorScheme.primaryVariant,
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 20, top: 30),
                              child: Text(
                                  '${document['appUserDisplayName'] == null ? document['appUserEmail'] : document['appUserDisplayName']}'),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 20, bottom: 30),
                              child: Text('${document['appUserFlagActivity']}'),
                            ),
                          ],
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

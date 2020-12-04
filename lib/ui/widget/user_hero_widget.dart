import 'package:flutter/material.dart';
import 'package:hecxd/models/app_user_model.dart';
import 'package:hecxd/models/user_model.dart';
import 'package:hecxd/providers/app_access_level_provider.dart';
import 'package:hecxd/routes.dart';
import 'package:provider/provider.dart';
import 'package:hecxd/providers/auth_provider.dart';

class UserHeroWidget extends StatelessWidget {
  final String appUserUid;
  final String message;

  UserHeroWidget({Key key, this.appUserUid, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    // final appUserProvider = Provider.of<AppAccessLevelProvider>(context);
    return Container(
      height: 150,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
      ),
      child: StreamBuilder(
          stream: authProvider.user,
          builder: (context, snapshot) {
            print(snapshot.data);
            if (snapshot.hasData) {
              final UserModel user = snapshot.data;

              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed(
                          Routes.user,
                        );
                      },
                      child: CircleAvatar(
                        child: Text('${user.email.substring(0, 1)}'),
                        radius: 40,
                        backgroundColor:
                            Theme.of(context).colorScheme.primaryVariant,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Text('${user.email}'),
                  ),
                ],
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:taskmon/routes.dart';
import 'package:provider/provider.dart';
import 'package:taskmon/providers/app_access_level_provider.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appUser = Provider.of<AppAccessLevelProvider>(context, listen: false);
    final appUserRole = appUser.appxUserRole;
    final appUserUid = appUser.appxUserUid;
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            AppBar(
              title: Text('TaskMon - $appUserRole'),
              automaticallyImplyLeading: false,
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Dashboard'),
              onTap: () {
                Navigator.of(context).pushReplacementNamed(Routes.home21);
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Absensi Saya'),
              onTap: () {
                Navigator.of(context).pushReplacementNamed(Routes.absensi);
              },
            ),
            if (appUserRole == 'Admin' || appUserRole == 'Debug') Divider(),
            if (appUserRole == 'Admin' || appUserRole == 'Debug')
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Manage Absensi'),
                onTap: () {
                  Navigator.of(context)
                      .pushReplacementNamed(Routes.absensi_user);
                },
              ),
            if (appUserRole == 'Admin' || appUserRole == 'Debug') Divider(),
            if (appUserRole == 'Admin' || appUserRole == 'Debug')
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Manage Project'),
                onTap: () {
                  Navigator.of(context).pushReplacementNamed(Routes.project);
                },
              ),
            if (appUserRole == 'Admin' || appUserRole == 'Debug') Divider(),
            if (appUserRole == 'Admin' || appUserRole == 'Debug')
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Manage User'),
                onTap: () {
                  Navigator.of(context).pushReplacementNamed(Routes.appUser);
                },
              ),
            // if (appUserRole == 'Admin' || appUserRole == 'Debug') Divider(),
            // if (appUserRole == 'Admin' || appUserRole == 'Debug')
            //   ListTile(
            //     leading: Icon(Icons.home),
            //     title: Text('Dropdown Flutter'),
            //     onTap: () {
            //       Navigator.of(context)
            //           .pushReplacementNamed(Routes.dropdown_flutter);
            //     },
            //   ),
            Divider(),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('User Profile'),
              onTap: () {
                Navigator.of(context).pushReplacementNamed(Routes.user_profile,
                    arguments: appUserUid);
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Setting'),
              onTap: () {
                Navigator.of(context).pushReplacementNamed(Routes.setting);
              },
            ),
          ],
        ),
      ),
    );
  }
}

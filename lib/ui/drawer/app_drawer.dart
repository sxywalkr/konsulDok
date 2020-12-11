import 'package:flutter/material.dart';
import 'package:taskmon/routes.dart';
import 'package:provider/provider.dart';
import 'package:taskmon/providers/app_access_level_provider.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appUserRole =
        Provider.of<AppAccessLevelProvider>(context, listen: false)
            .appxUserRole;
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
                if (appUserRole == 'User') {
                  Navigator.of(context).pushReplacementNamed(Routes.home21);
                } else if (appUserRole == 'Resepsionis') {
                  Navigator.of(context)
                      .pushReplacementNamed(Routes.home_resepsionis);
                }
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

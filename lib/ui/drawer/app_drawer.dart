import 'package:flutter/material.dart';
import 'package:hecxd/routes.dart';
import 'package:provider/provider.dart';
import 'package:hecxd/providers/app_access_level_provider.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appAccessLevelProvider =
        Provider.of<AppAccessLevelProvider>(context, listen: false);
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            AppBar(
              title: Text('HEC - ${appAccessLevelProvider.appxUserRole}'),
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
            if (appAccessLevelProvider.appxUserRole == 'Admin' ||
                appAccessLevelProvider.appxUserRole == 'Debug')
              Divider(),
            if (appAccessLevelProvider.appxUserRole == 'Admin' ||
                appAccessLevelProvider.appxUserRole == 'Debug')
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

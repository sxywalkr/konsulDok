import 'package:flutter/material.dart';
import 'package:konsuldok/routes.dart';
import 'package:provider/provider.dart';
import 'package:konsuldok/providers/app_access_level_provider.dart';
import 'package:konsuldok/ui/newChat/home.dart';

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
              title: Text('konsuldok - $appUserRole'),
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
              leading: Icon(Icons.access_alarm),
              title: Text('Absensi Saya'),
              onTap: () {
                Navigator.of(context).pushReplacementNamed(Routes.absensi);
              },
            ),
            if (appUserRole == 'Admin' || appUserRole == 'Debug') Divider(),
            if (appUserRole == 'Admin' || appUserRole == 'Debug')
              ListTile(
                leading: Icon(Icons.access_alarm),
                title: Text('Manage Absensi'),
                onTap: () {
                  Navigator.of(context)
                      .pushReplacementNamed(Routes.absensi_user);
                },
              ),
            if (appUserRole == 'Admin' || appUserRole == 'Debug') Divider(),
            if (appUserRole == 'Admin' || appUserRole == 'Debug')
              ListTile(
                leading: Icon(Icons.access_alarm),
                title: Text('Summary Absensi'),
                onTap: () {
                  Navigator.of(context)
                      .pushReplacementNamed(Routes.absensi_summary);
                },
              ),
            if (appUserRole == 'Admin' || appUserRole == 'Debug') Divider(),
            if (appUserRole == 'Admin' || appUserRole == 'Debug')
              ListTile(
                leading: Icon(Icons.perm_contact_cal),
                title: Text('Manage Project'),
                onTap: () {
                  Navigator.of(context).pushReplacementNamed(Routes.project);
                },
              ),
            if (appUserRole == 'Admin' || appUserRole == 'Debug') Divider(),
            if (appUserRole == 'Admin' || appUserRole == 'Debug')
              ListTile(
                leading: Icon(Icons.supervised_user_circle),
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
              leading: Icon(Icons.supervised_user_circle),
              title: Text('User Profile'),
              onTap: () {
                Navigator.of(context).pushReplacementNamed(Routes.user_profile,
                    arguments: appUserUid);
              },
            ),
            // if (appUserRole == 'Admin' || appUserRole == 'Debug') Divider(),
            // if (appUserRole == 'Admin' || appUserRole == 'Debug')
            //   ListTile(
            //     leading: Icon(Icons.access_alarm),
            //     title: Text('Dash Chat'),
            //     onTap: () {
            //       Navigator.of(context).pushNamed(Routes.dash_chat);
            //     },
            //   ),
            // if (appUserRole == 'Admin' || appUserRole == 'Debug') Divider(),
            // if (appUserRole == 'Admin' || appUserRole == 'Debug')
            //   ListTile(
            //     leading: Icon(Icons.access_alarm),
            //     title: Text('Chat2'),
            //     onTap: () {
            //       Navigator.of(context).pushNamed(Routes.chat2);
            //     },
            //   ),
            if (appUserRole == 'Admin' || appUserRole == 'Debug') Divider(),
            if (appUserRole == 'Admin' || appUserRole == 'Debug')
              ListTile(
                leading: Icon(Icons.access_alarm),
                title: Text('Login Doctor'),
                onTap: () {
                  Navigator.of(context).pushNamed(Routes.login_doctor_pro);
                },
              ),
            if (appUserRole == 'Admin' || appUserRole == 'Debug') Divider(),
            if (appUserRole == 'Admin' || appUserRole == 'Debug')
              ListTile(
                leading: Icon(Icons.access_alarm),
                title: Text('Home Doctor'),
                onTap: () {
                  Navigator.of(context).pushNamed(Routes.home_doctor_pro);
                },
              ),
            if (appUserRole == 'Admin' || appUserRole == 'Debug') Divider(),
            if (appUserRole == 'Admin' || appUserRole == 'Debug')
              ListTile(
                leading: Icon(Icons.access_alarm),
                title: Text('New Chat'),
                onTap: () {
                  // Navigator.of(context)
                  //     .pushNamed(HomeScreen(currentUserId: appUserUid));
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              HomeScreen(currentUserId: appUserUid)));
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

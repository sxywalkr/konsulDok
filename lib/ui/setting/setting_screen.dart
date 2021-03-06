import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:konsuldok/app_localizations.dart';
import 'package:konsuldok/providers/auth_provider.dart';
import 'package:konsuldok/providers/theme_provider.dart';
import 'package:konsuldok/routes.dart';
import 'package:konsuldok/ui/setting/setting_language_actions.dart';
import 'package:provider/provider.dart';
import 'package:konsuldok/ui/appDrawer/app_drawer.dart';
import 'package:konsuldok/providers/app_access_level_provider.dart';

class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).translate("settingAppTitle")),
      ),
      body: _buildLayoutSection(context),
    );
  }

  Widget _buildLayoutSection(BuildContext context) {
    final appUserProvider =
        Provider.of<AppAccessLevelProvider>(context, listen: false);
    return ListView(
      children: <Widget>[
        // ListTile(
        //   title: Text(
        //       AppLocalizations.of(context).translate("settingThemeListTitle")),
        //   subtitle: Text(AppLocalizations.of(context)
        //       .translate("settingThemeListSubTitle")),
        //   trailing: Switch(
        //     activeColor: Theme.of(context).appBarTheme.color,
        //     activeTrackColor: Theme.of(context).textTheme.title.color,
        //     value: Provider.of<ThemeProvider>(context).isDarkModeOn,
        //     onChanged: (booleanValue) {
        //       Provider.of<ThemeProvider>(context, listen: false)
        //           .updateTheme(booleanValue);
        //     },
        //   ),
        // ),
        // ListTile(
        //   title: Text(AppLocalizations.of(context)
        //       .translate("settingLanguageListTitle")),
        //   subtitle: Text(AppLocalizations.of(context)
        //       .translate("settingLanguageListSubTitle")),
        //   trailing: SettingLanguageActions(),
        // ),
        if (appUserProvider.appxUserRole == 'Debug' ||
            appUserProvider.appxUserRole == 'Admin')
          ListTile(
            title: Text('Pengaturan Absensi'),
            subtitle: Text('Koordinat kantor, Radius dan Jumlah Jam Kerja'),
            trailing: RaisedButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed(Routes.create_edit_absensi_setting);
                },
                child: Text('Atur')),
          ),
        ListTile(
          title: Text('Logout'),
          subtitle: Text('Keluar dari aplikasi'),
          trailing: RaisedButton(
              onPressed: () {
                _confirmSignOut(context);
              },
              child: Text(AppLocalizations.of(context)
                  .translate("settingLogoutButton"))),
        ),
      ],
    );
  }

  _confirmSignOut(BuildContext context) {
    showPlatformDialog(
        context: context,
        builder: (_) => PlatformAlertDialog(
              android: (_) => MaterialAlertDialogData(
                  backgroundColor: Theme.of(context).appBarTheme.color),
              title: Text('Peringatan'),
              content: Text('Anda akan keluar dari aplikasi. Teruskan?'),
              actions: <Widget>[
                PlatformDialogAction(
                  child: PlatformText(AppLocalizations.of(context)
                      .translate("alertDialogCancelBtn")),
                  onPressed: () => Navigator.pop(context),
                ),
                PlatformDialogAction(
                  child: PlatformText(AppLocalizations.of(context)
                      .translate("alertDialogYesBtn")),
                  onPressed: () {
                    final authProvider =
                        Provider.of<AuthProvider>(context, listen: false);

                    authProvider.signOut();

                    Navigator.pop(context);
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        Routes.login, ModalRoute.withName(Routes.login));
                  },
                )
              ],
            ));
  }
}

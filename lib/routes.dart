import 'package:flutter/material.dart';
import 'package:hecxd/ui/auth/register_screen.dart';
import 'package:hecxd/ui/auth/sign_in_screen.dart';
import 'package:hecxd/ui/setting/setting_screen.dart';
import 'package:hecxd/ui/splash/splash_screen.dart';
import 'package:hecxd/ui/todo/create_edit_todo_screen.dart';
import 'package:hecxd/ui/todo/todos_screen.dart';

import 'package:hecxd/ui/home2/home2_screen.dart';
import 'package:hecxd/ui/stokBarangMasuk/stokBarangMasuks_screen.dart';
import 'package:hecxd/ui/stokBarangMasuk/create_edit_stokBarangMasuk_screen.dart';
import 'package:hecxd/ui/stokBarangAktif/stokBarangAktifs_screen.dart';
import 'package:hecxd/ui/stokBarangAktif/create_edit_stokBarangAktif_screen.dart';
import 'package:hecxd/ui/stokBarangKeluar/stokBarangKeluars_screen.dart';
import 'package:hecxd/ui/stokBarangKeluar/create_edit_stokBarangKeluar_screen.dart';
import 'package:hecxd/ui/appUser/appUsers_screen.dart';
import 'package:hecxd/ui/appUser/create_edit_appUser_screen.dart';
import 'package:hecxd/ui/home2/home21_screen.dart';
import 'package:hecxd/ui/home2/xdhome22_screen.dart';
import 'package:hecxd/ui/user/user_screen.dart';
import 'package:hecxd/ui/user/create_edit_user_screen.dart';
import 'package:hecxd/ui/home2/home_resepsionis_screen.dart';
import 'package:hecxd/ui/resepsionis/antrians_screen.dart';
import 'package:hecxd/ui/user/user_profile_screen.dart';

class Routes {
  Routes._(); //this is to prevent anyone from instantiate this object

  static const String splash = '/splash';
  static const String login = '/login';
  static const String register = '/register';
  static const String home = '/home';
  static const String setting = '/setting';
  static const String create_edit_todo = '/create_edit_todo';

  static const String home2 = '/home2';

  static const String stokBarangMasuk = '/stokBarangMasuk';
  static const String create_edit_stokBarangMasuk =
      '/create_edit_stokBarangMasuk';
  static const String stokBarangAktif = '/stokBarangAktif';
  static const String create_edit_stokBarangAktif =
      '/create_edit_stokBarangAktif';
  static const String stokBarangKeluar = '/stokBarangKeluar';
  static const String create_edit_stokBarangKeluar =
      '/create_edit_stokBarangKeluar';
  static const String appUser = '/appUser';
  static const String create_edit_appUser = '/create_edit_appUser';
  static const String home21 = '/home21';
  static const String xdhome22 = '/xdhome22';
  static const String user = '/user';
  static const String create_edit_user = '/create_edit_user';
  static const String home_resepsionis = '/home_resepsionis';
  static const String antrians = '/antrians';
  static const String user_profile = '/user_profile';

  static final routes = <String, WidgetBuilder>{
    splash: (BuildContext context) => SplashScreen(),
    login: (BuildContext context) => SignInScreen(),
    register: (BuildContext context) => RegisterScreen(),
    home: (BuildContext context) => TodosScreen(),
    setting: (BuildContext context) => SettingScreen(),
    create_edit_todo: (BuildContext context) => CreateEditTodoScreen(),
    home2: (BuildContext context) => Home2Screen(),
    stokBarangMasuk: (BuildContext context) => StokBarangMasuksScreen(),
    create_edit_stokBarangMasuk: (BuildContext context) =>
        CreateEditStokBarangMasukScreen(),
    stokBarangAktif: (BuildContext context) => StokBarangAktifsScreen(),
    create_edit_stokBarangAktif: (BuildContext context) =>
        CreateEditStokBarangAktifScreen(),
    stokBarangKeluar: (BuildContext context) => StokBarangKeluarsScreen(),
    create_edit_stokBarangKeluar: (BuildContext context) =>
        CreateEditStokBarangKeluarScreen(),
    appUser: (BuildContext context) => AppUsersScreen(),
    create_edit_appUser: (BuildContext context) => CreateEditAppUserScreen(),
    home21: (BuildContext context) => Home21Screen(),
    xdhome22: (BuildContext context) => XdHome22Screen(),
    user: (BuildContext context) => UserScreen(),
    create_edit_user: (BuildContext context) => CreateEditUserScreen(),
    home_resepsionis: (BuildContext context) => HomeResepsionisScreen(),
    antrians: (BuildContext context) => AntriansScreen(),
    user_profile: (BuildContext context) => UserProfileScreen(),
  };
}

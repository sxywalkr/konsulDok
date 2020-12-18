import 'package:flutter/material.dart';
import 'package:taskmon/ui/auth/register_screen.dart';
import 'package:taskmon/ui/auth/sign_in_screen.dart';
import 'package:taskmon/ui/setting/setting_screen.dart';
import 'package:taskmon/ui/splash/splash_screen.dart';
import 'package:taskmon/ui/todo/create_edit_todo_screen.dart';
import 'package:taskmon/ui/todo/todos_screen.dart';

import 'package:taskmon/ui/home2/home2_screen.dart';
import 'package:taskmon/ui/appUser/appUsers_screen.dart';
import 'package:taskmon/ui/home2/home21_screen.dart';
import 'package:taskmon/ui/user/user_screen.dart';
import 'package:taskmon/ui/user/create_edit_user_screen.dart';
import 'package:taskmon/ui/home2/home_resepsionis_screen.dart';
import 'package:taskmon/ui/resepsionis/antrians_screen.dart';
import 'package:taskmon/ui/user/user_profile_screen.dart';
import 'package:taskmon/ui/project/projects_screen.dart';
import 'package:taskmon/ui/project/create_edit_project_screen.dart';
import 'package:taskmon/ui/absensi/absensi_screen.dart';
import 'package:taskmon/ui/project/edit_project_progress_screen.dart';

//uiXample
import 'package:taskmon/ui/uiXample/dropdown.dart';

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
  static const String project = '/project';
  static const String create_edit_project = '/create_edit_project';
  static const String dropdown_flutter = '/dropdown_flutter';
  static const String absensi = '/absensi';
  static const String edit_project_progress = '/edit_project_progress';

  static final routes = <String, WidgetBuilder>{
    splash: (BuildContext context) => SplashScreen(),
    login: (BuildContext context) => SignInScreen(),
    register: (BuildContext context) => RegisterScreen(),
    home: (BuildContext context) => TodosScreen(),
    setting: (BuildContext context) => SettingScreen(),
    create_edit_todo: (BuildContext context) => CreateEditTodoScreen(),
    home2: (BuildContext context) => Home2Screen(),
    appUser: (BuildContext context) => AppUsersScreen(),
    home21: (BuildContext context) => Home21Screen(),
    user: (BuildContext context) => UserScreen(),
    create_edit_user: (BuildContext context) => CreateEditUserScreen(),
    home_resepsionis: (BuildContext context) => HomeResepsionisScreen(),
    antrians: (BuildContext context) => AntriansScreen(),
    user_profile: (BuildContext context) => UserProfileScreen(),
    project: (BuildContext context) => ProjectsScreen(),
    create_edit_project: (BuildContext context) => CreateEditProjectScreen(),
    dropdown_flutter: (BuildContext context) => DropDownFlutter(),
    absensi: (BuildContext context) => AbsensiScreen(),
    edit_project_progress: (BuildContext context) =>
        EditProjectProgressScreen(),
  };
}

import 'package:flutter/material.dart';
import 'package:konsuldok/ui/auth/register_screen.dart';
import 'package:konsuldok/ui/auth/sign_in_screen.dart';
import 'package:konsuldok/ui/setting/setting_screen.dart';
import 'package:konsuldok/ui/splash/splash_screen.dart';
import 'package:konsuldok/ui/todo/create_edit_todo_screen.dart';
import 'package:konsuldok/ui/todo/todos_screen.dart';

import 'package:konsuldok/ui/home2/home2_screen.dart';
import 'package:konsuldok/ui/appUser/appUsers_screen.dart';
import 'package:konsuldok/ui/home2/home21_screen.dart';
import 'package:konsuldok/ui/user/user_screen.dart';
import 'package:konsuldok/ui/user/create_edit_user_screen.dart';
import 'package:konsuldok/ui/user/user_profile_screen.dart';
import 'package:konsuldok/ui/project/projects_screen.dart';
import 'package:konsuldok/ui/project/create_edit_project_screen.dart';
import 'package:konsuldok/ui/absensi/absensi_screen.dart';
import 'package:konsuldok/ui/absensi/absensi_summary_screen.dart';
import 'package:konsuldok/ui/absensi/absensi_summary_detail_screen.dart';
import 'package:konsuldok/ui/project/edit_project_progress_screen.dart';
import 'package:konsuldok/ui/projectFeed/project_feeds_screen.dart';
import 'package:konsuldok/ui/projectFeed/create_edit_project_feed_screen.dart';
import 'package:konsuldok/ui/absensiSetting/absensi_setting_screen.dart';
import 'package:konsuldok/ui/absensiSetting/create_edit_absensi_setting_screen.dart';
import 'package:konsuldok/ui/absensi/absensi_user_screen.dart';
import 'package:konsuldok/ui/flutterChats/dash_chat.dart';
import 'package:konsuldok/ui/flutterChats/main_chat.dart';
import 'package:konsuldok/ui/flutterChats/chat2.dart';

// pages
import 'package:konsuldok/ui/pages/login_signup/login.dart';
import 'package:konsuldok/ui/pages/splashScreen.dart';
import 'package:konsuldok/ui/pages/home/home.dart';

//uiXample
import 'package:konsuldok/ui/uiXample/dropdown.dart';

class Routes {
  Routes._(); //this is to prevent anyone from instantiate this object

  static const String splash = '/splash';
  static const String login = '/login';
  static const String register = '/register';
  static const String home = '/home';
  static const String setting = '/setting';
  static const String create_edit_todo = '/create_edit_todo';

  static const String home2 = '/home2';

  static const String appUser = '/appUser';
  static const String create_edit_appUser = '/create_edit_appUser';
  static const String home21 = '/home21';
  static const String xdhome22 = '/xdhome22';
  static const String user = '/user';
  static const String create_edit_user = '/create_edit_user';
  static const String user_profile = '/user_profile';
  static const String project = '/project';
  static const String create_edit_project = '/create_edit_project';
  static const String dropdown_flutter = '/dropdown_flutter';
  static const String absensi = '/absensi';
  static const String absensi_user = '/absensi_user';
  static const String absensi_summary = '/absensi_summary';
  static const String absensi_summary_detail = '/absensi_summary_detail';
  static const String edit_project_progress = '/edit_project_progress';
  static const String project_feed = '/project_feed';
  static const String create_edit_project_feed = '/create_edit_project_feed';
  static const String absensi_setting = '/absensi_setting';
  static const String create_edit_absensi_setting =
      '/create_edit_absensi_setting';
  static const String dash_chat = '/dash_chat';
  static const String main_chat = '/main_chat';
  static const String chat2 = '/chat2';
  // pages
  static const String login_doctor_pro = '/login_doctor_pro';
  static const String splash_doctor_pro = '/splash_doctor_pro';
  static const String home_doctor_pro = '/home_doctor_pro';

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
    user_profile: (BuildContext context) => UserProfileScreen(),
    project: (BuildContext context) => ProjectsScreen(),
    create_edit_project: (BuildContext context) => CreateEditProjectScreen(),
    dropdown_flutter: (BuildContext context) => DropDownFlutter(),
    absensi: (BuildContext context) => AbsensiScreen(),
    absensi_summary: (BuildContext context) => AbsensiSummaryScreen(),
    absensi_summary_detail: (BuildContext context) =>
        AbsensiSummaryDetailScreen(),
    absensi_user: (BuildContext context) => AbsensiUserScreen(),
    edit_project_progress: (BuildContext context) =>
        EditProjectProgressScreen(),
    project_feed: (BuildContext context) => ProjectFeedsScreen(),
    create_edit_project_feed: (BuildContext context) =>
        CreateEditProjectFeedScreen(),
    absensi_setting: (BuildContext context) => AbsensiSettingScreen(),
    create_edit_absensi_setting: (BuildContext context) =>
        CreateEditAbsensiSettingScreen(),
    dash_chat: (BuildContext context) => DashChatScreen(),
    main_chat: (BuildContext context) => MainChatScreen(),
    chat2: (BuildContext context) => Chat2Screen(),
    // doctor pro
    login_doctor_pro: (BuildContext context) => Login(),
    splash_doctor_pro: (BuildContext context) => SplashDoctorProScreen(),
    home_doctor_pro: (BuildContext context) => Home(),
  };
}

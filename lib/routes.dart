import 'package:flutter/material.dart';
import 'package:mergers/ui/auth/register_screen.dart';
import 'package:mergers/ui/auth/sign_in_screen.dart';
import 'package:mergers/ui/setting/setting_screen.dart';
import 'package:mergers/ui/splash/splash_screen.dart';
import 'package:mergers/ui/todo/create_edit_todo_screen.dart';
import 'package:mergers/ui/todo/todos_screen.dart';
import 'package:mergers/ui/home2/home2_screen.dart';
import 'package:mergers/ui/home2/create_edit_penyedia_screen.dart';

class Routes {
  Routes._(); //this is to prevent anyone from instantiate this object

  static const String splash = '/splash';
  static const String login = '/login';
  static const String register = '/register';
  static const String home = '/home';
  static const String setting = '/setting';
  static const String create_edit_todo = '/create_edit_todo';
  static const String home2 = '/home2';
  static const String create_edit_penyedia = '/create_edit_penyedia';

  static final routes = <String, WidgetBuilder>{
    splash: (BuildContext context) => SplashScreen(),
    login: (BuildContext context) => SignInScreen(),
    register: (BuildContext context) => RegisterScreen(),
    home: (BuildContext context) => TodosScreen(),
    setting: (BuildContext context) => SettingScreen(),
    create_edit_todo: (BuildContext context) => CreateEditTodoScreen(),
    home2: (BuildContext context) => Home2Screen(),
    create_edit_penyedia: (BuildContext context) => CreateEditPenyediaScreen(),
  };
}

import 'dart:async';
import 'package:flutter/material.dart';
// import 'package:konsuldok/app_localizations.dart';
import 'package:konsuldok/routes.dart';
import 'package:provider/provider.dart';
import 'package:konsuldok/providers/app_access_level_provider.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Center(
          child: Text(
            'konsuldok',
            style: Theme.of(context).textTheme.headline3,
          ),
        ),
        Center(
          child: Text(
            '..loading..',
            style: Theme.of(context).textTheme.caption,
          ),
        ),
        // FlutterLogo(
        //   size: 128,
        // ),
      ],
    )));
  }

  startTimer() {
    var duration = Duration(milliseconds: 3000);
    return Timer(duration, redirect);
  }

  redirect() async {
    final appUserRole =
        Provider.of<AppAccessLevelProvider>(context, listen: false)
            .appxUserRole;
    print('Splash $appUserRole');
    // if (appUserRole == 'User') {
    Navigator.of(context).pushReplacementNamed(Routes.home21);
    // }
    // else if (appUserRole == 'Resepsionis') {
    //   Navigator.of(context).pushReplacementNamed(Routes.home_resepsionis);
    // }
  }
}

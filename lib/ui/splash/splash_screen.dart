import 'dart:async';
import 'package:flutter/material.dart';
// import 'package:konsuldok/app_localizations.dart';
import 'package:konsuldok/routes.dart';
import 'package:provider/provider.dart';
import 'package:konsuldok/providers/app_access_level_provider.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
    _offsetAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(1.5, 0.0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticIn,
    ));
    startTimer();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SlideTransition(
          position: _offsetAnimation,
          child: Container(
            height: 100.0,
            width: 100.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50.0),
              image: DecorationImage(
                image: AssetImage('assets/images/icon.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
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
    var duration = Duration(seconds: 3);
    return Timer(duration, redirect);
  }

  // loginChat() async {
  //   SharedPreferences prefs;
  //   final appUserInfo =
  //       Provider.of<AppAccessLevelProvider>(context, listen: false);
  //   final QuerySnapshot result = await FirebaseFirestore.instance
  //       .collection('appUsers')
  //       .where('id', isEqualTo: appUserInfo.appxUserUid)
  //       .get();
  //   final List<DocumentSnapshot> documents = result.docs;
  //   if (documents.length != 0) {
  //     // Update data to server if new user
  //     // FirebaseFirestore.instance.collection('users').doc(firebaseUser.uid).set({
  //     //   'nickname': firebaseUser.displayName,
  //     //   'photoUrl': firebaseUser.photoURL,
  //     //   'id': firebaseUser.uid,
  //     //   'createdAt': DateTime.now().millisecondsSinceEpoch.toString(),
  //     //   'chattingWith': null
  //     // });

  //     // Write data to local
  //     // currentUser = firebaseUser;
  //     await prefs.setString('id', appUserInfo.appxUserUid);
  //     await prefs.setString(
  //         'nickname', appUserInfo.appxUser.appUserDisplayName);
  //     await prefs.setString('photoUrl', null);
  //   }
  // }

  redirect() {
    // loginChat();
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

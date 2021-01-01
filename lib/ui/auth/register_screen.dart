import 'package:flutter/material.dart';
import 'package:konsuldok/app_localizations.dart';
import 'package:konsuldok/models/user_model.dart';
import 'package:konsuldok/providers/auth_provider.dart';
import 'package:konsuldok/routes.dart';
import 'package:provider/provider.dart';
// import 'package:konsuldok/services/firestore_database.dart';
// import 'package:konsuldok/models/app_user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:konsuldok/constants/app_sxy_constant.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController _emailController;
  TextEditingController _passwordController;
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final firebaseMessaging = FirebaseMessaging();
  String _fcmToken = '';

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController(text: "");
    _passwordController = TextEditingController(text: "");
    _getFcmToken();
  }

  void _getFcmToken() {
    firebaseMessaging.getToken().then((token) {
      // debugPrint('getToken: $token');
      setState(() {
        _fcmToken = token;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Stack(
        children: <Widget>[
          // _buildBackground(),
          _background(),
          Align(
            alignment: Alignment.center,
            child: _buildForm(context),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Widget _buildForm(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Center(
                      child: Text('Register', style: loginBigTextStyle
                          // Theme.of(context).textTheme.headline4,

                          ),
                    )),
                Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: Center(
                      child: Text(
                        'Buat Akun',
                        style: whiteSmallLoginTextStyle,
                      ),
                    )),
                TextFormField(
                  controller: _emailController,
                  style: Theme.of(context).textTheme.headline6,
                  validator: (value) => value.isEmpty
                      ? AppLocalizations.of(context)
                          .translate("loginTxtErrorEmail")
                      : null,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.green[100].withOpacity(0.3),
                    prefixIcon: Icon(
                      Icons.email,
                      color: Theme.of(context).iconTheme.color,
                    ),
                    labelText: 'Email',
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Colors.transparent, width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(30.0))),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.white, width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(30.0))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: TextFormField(
                    obscureText: true,
                    maxLength: 12,
                    controller: _passwordController,
                    style: Theme.of(context).textTheme.headline6,
                    validator: (value) => value.length < 6
                        ? AppLocalizations.of(context)
                            .translate("loginTxtErrorPassword")
                        : null,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.green[100].withOpacity(0.3),
                      prefixIcon: Icon(
                        Icons.email,
                        color: Theme.of(context).iconTheme.color,
                      ),
                      labelText: 'Password',
                      border: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Colors.transparent, width: 2.0),
                          borderRadius:
                              BorderRadius.all(Radius.circular(30.0))),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.white, width: 2.0),
                          borderRadius:
                              BorderRadius.all(Radius.circular(30.0))),
                    ),
                  ),
                ),
                authProvider.status == Status.Registering
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : SizedBox(
                        height: 50,
                        child: RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            child: Text(
                              AppLocalizations.of(context)
                                  .translate("loginBtnSignUp"),
                              style: Theme.of(context).textTheme.button,
                            ),
                            onPressed: () async {
                              if (_formKey.currentState.validate()) {
                                FocusScope.of(context)
                                    .unfocus(); //to hide the keyboard - if any

                                UserModel userModel = await authProvider
                                    .registerWithEmailAndPassword(
                                        _emailController.text,
                                        _passwordController.text);

                                final dbReference = FirebaseFirestore.instance;
                                dbReference
                                    .collection('appUsers')
                                    .doc(userModel.uid)
                                    .set(
                                  {
                                    'appUserUid': userModel.uid,
                                    'appUserEmail': _emailController.text,
                                    'appUserDisplayName': _emailController.text,
                                    'appUserRole': 'User',
                                    'appUserFcmId': _fcmToken,
                                    'appUserFlagActivity':
                                        'User Baru, menunggu approval',
                                    'appUserAlamat': '-',
                                    'appUserGender': '-',
                                    'appUserNoHape': '-',
                                    'appUserTotalJamKerja': '0',
                                    'appUserPhotoUrl':
                                        'https://firebasestorage.googleapis.com/v0/b/konsuldok-49138.appspot.com/o/appAssets%2Fuser.jpg?alt=media&token=18e5538d-b319-4f49-bf10-44439b02d79b',
                                  },
                                );

                                if (userModel == null) {
                                  _scaffoldKey.currentState
                                      .showSnackBar(SnackBar(
                                    content: Text(AppLocalizations.of(context)
                                        .translate("loginTxtErrorSignIn")),
                                  ));
                                }
                              }
                            }),
                      ),
                authProvider.status == Status.Registering
                    ? Center(
                        child: null,
                      )
                    : Padding(
                        padding: const EdgeInsets.only(top: 48),
                        child: Center(
                            child: Text(
                          'Sudah punya akun?',
                          style: whiteSmallLoginTextStyle,
                        )),
                      ),
                authProvider.status == Status.Registering
                    ? Center(
                        child: null,
                      )
                    : FlatButton(
                        child: Text('Login di sini'),
                        textColor: Theme.of(context).iconTheme.color,
                        onPressed: () {
                          Navigator.of(context)
                              .pushReplacementNamed(Routes.login);
                        },
                      ),
              ],
            ),
          ),
        ));
  }

  // Widget _buildBackground() {
  //   return ClipPath(
  //     clipper: SignInCustomClipper(),
  //     child: Container(
  //       width: MediaQuery.of(context).size.width,
  //       height: MediaQuery.of(context).size.height * 0.5,
  //       color: Theme.of(context).iconTheme.color,
  //     ),
  //   );
  // }

  Widget _background() {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/doctor_bg.jpg'),
            fit: BoxFit.cover),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 0.0,
            left: 0.0,
            child: Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.1, 0.3, 0.5, 0.7, 0.9],
                  colors: [
                    Colors.black.withOpacity(0.4),
                    Colors.black.withOpacity(0.55),
                    Colors.black.withOpacity(0.7),
                    Colors.black.withOpacity(0.8),
                    Colors.black.withOpacity(1.0),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SignInCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);

    var firstEndPoint = Offset(size.width / 2, size.height - 95);
    var firstControlPoint = Offset(size.width / 6, size.height * 0.45);

    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondEndPoint = Offset(size.width, size.height / 2 - 50);
    var secondControlPoint = Offset(size.width, size.height + 15);

    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, size.height / 2);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

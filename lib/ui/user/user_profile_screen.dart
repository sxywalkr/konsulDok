import 'package:flutter/material.dart';
import 'package:hecxd/services/firestore_database.dart';
import 'package:hecxd/models/app_user_model.dart';
import 'package:provider/provider.dart';
import 'package:hecxd/routes.dart';

class UserProfileScreen extends StatefulWidget {
  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  String _selectedUserUid;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // print(ModalRoute.of(context).settings.arguments.runtimeType);
    // print(ModalRoute.of(context).settings.arguments);
    final String _argUserUid = ModalRoute.of(context).settings.arguments;
    // print(_argUserUid.appUserEmail);
    if (_argUserUid != null) {
      _selectedUserUid = _argUserUid;
    }
  }

  @override
  Widget build(BuildContext context) {
    final firestoreDatabase =
        Provider.of<FirestoreDatabase>(context, listen: false);

    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          // IconButton(
          //   icon: Icon(
          //     Icons.edit,
          //     color: Colors.transparent,
          //   ),
          //   onPressed: null,
          // ),
        ],
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 100.0,
                  height: 100.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    image: DecorationImage(
                      image: AssetImage('assets/images/user.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 20.0),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      StreamBuilder(
                          stream: firestoreDatabase.appUserStream(
                              appUserId: _selectedUserUid),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              final AppUserModel user = snapshot.data;
                              return Column(
                                children: [
                                  Text(
                                    user.appUserDisplayName == null
                                        ? user.appUserEmail
                                        : user.appUserDisplayName,
                                    style: TextStyle(
                                      fontSize: 26.0,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF00145E),
                                    ),
                                  ),
                                  SizedBox(height: 7.0),
                                  Text(
                                    user.appUserStatusRm,
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF838DAF),
                                    ),
                                  ),
                                ],
                              );
                            }
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }),
                    ],
                  ),
                ),
              ],
            ),
          ),
          StreamBuilder(
              stream:
                  firestoreDatabase.appUserStream(appUserId: _selectedUserUid),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final AppUserModel user = snapshot.data;
                  return Column(children: <Widget>[
                    personalDetailItem(Icons.phone, user.appUserNoHape),
                    SizedBox(height: 20.0),
                    personalDetailItem(Icons.email, user.appUserEmail),
                    SizedBox(height: 20.0),
                  ]);
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              }),
          divider(),
          listItem(Icons.folder_shared, 'Rekam Medik'),
        ],
      ),
    );
  }

  divider() {
    return Container(
      width: double.infinity,
      height: 1.0,
      color: Colors.grey[300],
    );
  }

  personalDetailItem(icon, text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Color(0xFF838DAF),
            size: 22.0,
          ),
          SizedBox(width: 20.0),
          Text(
            text,
            style: TextStyle(
              color: Color(0xFF838DAF),
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    );
  }

  listItem(icon, text) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 24.0,
              color: Color(0xFF386FFA),
            ),
            SizedBox(width: 20.0),
            Text(
              text,
              style: TextStyle(
                color: Color(0xFF00145E),
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

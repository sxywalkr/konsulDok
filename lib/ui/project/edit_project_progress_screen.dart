import 'package:flutter/material.dart';
import 'package:konsuldok/models/app_user_model.dart';
import 'package:konsuldok/models/project_model.dart';
import 'package:konsuldok/services/firestore_database.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EditProjectProgressScreen extends StatefulWidget {
  @override
  EditProjectProgressScreenState createState() =>
      EditProjectProgressScreenState();
}

class EditProjectProgressScreenState extends State<EditProjectProgressScreen> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  ProjectModel _project;
  TextEditingController _projectIdController;
  TextEditingController _appUserUidController;
  TextEditingController _appUserDisplayNameController;
  TextEditingController _projectTglDeadlineController;
  TextEditingController _projectTglStartController;
  TextEditingController _projectPersenActivityController;
  TextEditingController _projectFungsiController;
  TextEditingController _projectNameController;
  TextEditingController _projectStatusController;

  bool _isInit = true;

  @override
  void initState() {
    super.initState();
    if (_isInit) {
      _appUserDisplayNameController = TextEditingController(text: '---');
      _isInit = false;
    }
    // print('init');
  }

  Future<String> _getName() async {
    // print('getName');
    final dbReference = Firestore.instance;

    Map<String, dynamic> data1 = {};
    if (_project != null) {
      final qSnap1 = await dbReference
          .collection("appUsers")
          .where('appUserUid', isEqualTo: _project.appUserUid)
          .getDocuments();
      for (DocumentSnapshot ds in qSnap1.documents) {
        data1 = ds.data;
      }
      setState(() {
        _appUserDisplayNameController =
            TextEditingController(text: data1['appUserDisplayName'].toString());
      });
      return data1['appUserDisplayName'].toString();
    }
    return '---';
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();

    final ProjectModel _projectModel =
        ModalRoute.of(context).settings.arguments;
    if (_projectModel != null) {
      _project = _projectModel;
    }
    // print('didChangeDependencies async');
    _appUserDisplayNameController = TextEditingController(
        text: _project != null ? await _getName() : '---');

    _projectIdController =
        TextEditingController(text: _project != null ? _project.projectId : '');
    _appUserUidController = TextEditingController(
        text: _project != null ? _project.appUserUid : '');
    _projectTglDeadlineController = TextEditingController(
        text: _project != null ? _project.projectTglDeadline : '');
    _projectTglStartController = TextEditingController(
        text: _project != null ? _project.projectTglStart : '');
    _projectPersenActivityController = TextEditingController(
        text: _project != null ? _project.projectPersenActivity : '');
    _projectFungsiController = TextEditingController(
        text: _project != null ? _project.projectFungsi : '');
    _projectNameController = TextEditingController(
        text: _project != null ? _project.projectName : '');
    _projectStatusController = TextEditingController(
        text: _project != null ? _project.projectStatus : '');
  }

  @override
  Widget build(BuildContext context) {
    // print('build');
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.cancel),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text('Create Edit Project'),
        actions: <Widget>[
          FlatButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  FocusScope.of(context).unfocus();

                  final firestoreDatabase =
                      Provider.of<FirestoreDatabase>(context, listen: false);

                  firestoreDatabase.setProject(ProjectModel(
                    projectId: _project != null
                        ? _project.projectId
                        : documentIdFromCurrentDate(),
                    appUserUid: _appUserUidController.text,
                    projectName: _projectNameController.text,
                    projectTglDeadline: _projectTglDeadlineController.text,
                    projectTglStart: _project != null
                        ? _projectTglStartController.text
                        : DateTime.now().toIso8601String(),
                    projectPersenActivity: _project != null
                        ? _projectPersenActivityController.text
                        : '0',
                    projectFungsi: _projectFungsiController.text,
                    projectStatus: _project != null
                        ? _projectStatusController.text
                        : 'Aktif',
                  ));

                  Navigator.of(context).pop();
                }
              },
              child: Text("Save"))
        ],
      ),
      body: Container(
        child: _buildForm(context),
      ),
    );
  }

  @override
  void dispose() {
    _projectIdController.dispose();
    _appUserUidController.dispose();
    _projectTglDeadlineController.dispose();
    _projectTglStartController.dispose();
    _projectPersenActivityController.dispose();
    _projectFungsiController.dispose();
    _projectNameController.dispose();
    _projectStatusController.dispose();
    _appUserDisplayNameController.dispose();
    super.dispose();
  }

  Widget _buildForm(BuildContext context) {
    // print('build');
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: TextFormField(
                  controller: _projectNameController,
                  enabled: false,
                  // style: Theme.of(context).textTheme.body1,
                  // validator: (value) =>
                  //     value.isEmpty ? 'Nama Barang tidak boleh kosong' : null,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).iconTheme.color,
                            width: 2)),
                    labelText: 'Nama Project',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: TextFormField(
                  controller: _projectTglDeadlineController,
                  enabled: false,
                  // style: Theme.of(context).textTheme.body1,
                  // validator: (value) =>
                  //     value.isEmpty ? 'Nama Barang tidak boleh kosong' : null,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).iconTheme.color,
                            width: 2)),
                    labelText: 'Tanggal Deadline Project',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: TextFormField(
                  controller: _projectFungsiController,
                  enabled: false,
                  // style: Theme.of(context).textTheme.body1,
                  // validator: (value) =>
                  //     value.isEmpty ? 'Nama Barang tidak boleh kosong' : null,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).iconTheme.color,
                            width: 2)),
                    labelText: 'Deskripsi Project',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: TextFormField(
                  controller: _projectPersenActivityController,
                  // enabled: false,
                  // style: Theme.of(context).textTheme.body1,
                  // validator: (value) =>
                  //     value.isEmpty ? 'Nama Barang tidak boleh kosong' : null,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).iconTheme.color,
                            width: 2)),
                    labelText: 'Persentase Progress',
                  ),
                ),
              ),
              _cbxUser(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _cbxUser(BuildContext context) {
    final firestoreDatabase =
        Provider.of<FirestoreDatabase>(context, listen: false);

    // print('wdiget');
    // print('cbx ${_appUserDisplayNameController.text}');

    return StreamBuilder(
      stream: firestoreDatabase.appUsersStream(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          // print('snapshot.hasData');
          List<AppUserModel> appUser = snapshot.data;
          if (appUser.isNotEmpty) {
            // print('appUser.isNotEmpty');
            final aa = <String>['---'];
            appUser.forEach((element) {
              aa.add(element.appUserDisplayName == null
                  ? element.appUserEmail
                  : element.appUserDisplayName);
            });
            // print(aa);
            return DropdownButton<String>(
              value: _appUserDisplayNameController.text,
              onChanged: (String newValue) async {
                if (newValue != null) {
                  Map<String, dynamic> data1 = {};
                  final qSnap1 = await Firestore.instance
                      .collection('appUsers')
                      .where('appUserDisplayName', isEqualTo: newValue)
                      .getDocuments();
                  for (DocumentSnapshot ds in qSnap1.documents) {
                    data1 = ds.data;
                  }

                  setState(() {
                    _appUserDisplayNameController =
                        TextEditingController(text: newValue);
                    _appUserUidController =
                        TextEditingController(text: data1['appUserUid']);
                  });
                }
              },
              items: aa
                  // appUser.map((e) => e.appUserDisplayName)
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            );
          }
          // print('appUser.isEmpty');
        }
        return Center(child: CircularProgressIndicator());
        // return Center(child: Container());
      },
    );
  }

  // Widget _wgUserName(BuildContext context) {
  //   final firestoreDatabase =
  //       Provider.of<FirestoreDatabase>(context, listen: false);
  //   return StreamBuilder(
  //     stream: firestoreDatabase.appUserStream(appUserId: _project.appUserUid),
  //     builder: (context, snapshot) {
  //       if (snapshot.hasData) {
  //         AppUserModel appUser = snapshot.data;
  //         // _appUserDisplayNameController.text = appUser.appUserDisplayName;
  //         return Padding(
  //           padding: const EdgeInsets.symmetric(vertical: 16),
  //           child: TextFormField(
  //             // initialValue: appUser.appUserDisplayName,
  //             controller:
  //                 _showCbxUser == false ? _appUserDisplayNameController : null,
  //             readOnly: true,
  //             decoration: InputDecoration(
  //               enabledBorder: OutlineInputBorder(
  //                   borderSide: BorderSide(
  //                       color: Theme.of(context).iconTheme.color, width: 2)),
  //               labelText: 'User Yang Handle',
  //             ),
  //             onTap: () {
  //               setState(() {
  //                 _showCbxUser = true;
  //               });
  //             },
  //           ),
  //         );
  //       }

  //       return Center(child: Container());
  //     },
  //   );
  // }
}

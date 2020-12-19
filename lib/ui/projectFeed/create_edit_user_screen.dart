import 'package:flutter/material.dart';
import 'package:taskmon/models/project_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:taskmon/services/firestore_database.dart';
import 'package:provider/provider.dart';
import 'package:taskmon/models/project_feed_model.dart';
import 'package:taskmon/providers/app_access_level_provider.dart';

class CreateEditProjectFeedScreen extends StatefulWidget {
  @override
  _CreateEditProjectFeedScreenState createState() =>
      _CreateEditProjectFeedScreenState();
}

class _CreateEditProjectFeedScreenState
    extends State<CreateEditProjectFeedScreen> {
  //init
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  ProjectFeedModel _projectFeed;
  TextEditingController _projectFeedIdController;
  TextEditingController _appUserUidController;
  TextEditingController _appUserDisplayNameController;
  TextEditingController _projectIdController;
  TextEditingController _projectNameController;
  TextEditingController _projectFeedMainTaskController;
  TextEditingController _projectFeedPersentaseController;
  TextEditingController _projectFeedActivityDescriptionController;
  TextEditingController _projectFeedDateSubmitController;
  TextEditingController _projectFeedDateApprovalController;
  TextEditingController _projectFeedStatusController;

  bool _isInit = true;

  @override
  void initState() {
    super.initState();
    if (_isInit) {
      _projectNameController = TextEditingController(text: '---');
      _projectFeedMainTaskController = TextEditingController(text: 'Umum');
      _isInit = false;
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // print(ModalRoute.of(context).settings.arguments.runtimeType);
    // print(ModalRoute.of(context).settings.arguments);
    final ProjectFeedModel _projectFeedModel =
        ModalRoute.of(context).settings.arguments;
    // print(_ProjectFeedModel.appUserEmail);
    if (_projectFeedModel != null) {
      _projectFeed = _projectFeedModel;
    }

    _projectFeedIdController = TextEditingController(
        text: _projectFeed != null ? _projectFeed.projectFeedId : '');
    _appUserUidController = TextEditingController(
        text: _projectFeed != null ? _projectFeed.appUserUid : '');
    _appUserDisplayNameController = TextEditingController(
        text: _projectFeed != null ? _projectFeed.appUserDisplayName : '');
    _projectIdController = TextEditingController(
        text: _projectFeed != null ? _projectFeed.projectId : '');
    _projectNameController = TextEditingController(
        text: _projectFeed != null ? _projectFeed.projectName : '---');
    _projectFeedMainTaskController = TextEditingController(
        text: _projectFeed != null ? _projectFeed.projectFeedMainTask : 'Umum');
    _projectFeedPersentaseController = TextEditingController(
        text: _projectFeed != null ? _projectFeed.projectFeedPersentase : '');
    _projectFeedActivityDescriptionController = TextEditingController(
        text: _projectFeed != null
            ? _projectFeed.projectFeedActivityDescription
            : '');
    _projectFeedDateSubmitController = TextEditingController(
        text: _projectFeed != null ? _projectFeed.projectFeedDateSubmit : '');
    _projectFeedDateApprovalController = TextEditingController(
        text: _projectFeed != null ? _projectFeed.projectFeedDateApproval : '');
    _projectFeedStatusController = TextEditingController(
        text: _projectFeed != null ? _projectFeed.projectFeedStatus : '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.cancel),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text('Submit Progres'),
        actions: <Widget>[
          FlatButton(
            child: Text("Simpan"),
            onPressed: () async {
              if (_formKey.currentState.validate()) {
                FocusScope.of(context).unfocus();

                final firestoreDatabase =
                    Provider.of<FirestoreDatabase>(context, listen: false);
                final appUserData =
                    Provider.of<AppAccessLevelProvider>(context, listen: false);
                // final _uid = _projectFeed != null ? _projectFeed.id : generateUid();

                firestoreDatabase.setProjectFeed(ProjectFeedModel(
                  projectFeedId: _projectFeed != null
                      ? _projectFeed.projectFeedId
                      : documentIdFromCurrentDate(),
                  appUserUid: appUserData.appxUserUid,
                  appUserDisplayName: appUserData.appxUser.appUserDisplayName,
                  projectId: _projectIdController.text,
                  projectName: _projectNameController.text,
                  projectFeedMainTask: _projectFeedMainTaskController.text,
                  projectFeedPersentase: _projectFeedPersentaseController.text,
                  projectFeedActivityDescription:
                      _projectFeedActivityDescriptionController.text,
                  projectFeedDateSubmit: DateTime.now().toIso8601String(),
                  projectFeedDateApproval: '2000-01-01',
                  projectFeedStatus: 'Submit Progress',
                ));

                Navigator.of(context).pop();
              }
            },
          )
        ],
      ),
      body: Container(
        child: _buildForm(context),
      ),
    );
  }

  @override
  void dispose() {
    _projectFeedIdController.dispose();
    _appUserUidController.dispose();
    _appUserDisplayNameController.dispose();
    _projectIdController.dispose();
    _projectNameController.dispose();
    _projectFeedMainTaskController.dispose();
    _projectFeedPersentaseController.dispose();
    _projectFeedActivityDescriptionController.dispose();
    _projectFeedDateSubmitController.dispose();
    _projectFeedDateApprovalController.dispose();
    _projectFeedStatusController.dispose();

    super.dispose();
  }

  Widget _buildForm(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              _cbxProject(context),
              _cbxMainTask(context),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: TextFormField(
                  controller: _projectFeedPersentaseController,
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
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: TextFormField(
                  controller: _projectFeedActivityDescriptionController,
                  maxLines: 5,
                  // enabled: false,
                  // style: Theme.of(context).textTheme.body1,
                  // validator: (value) =>
                  //     value.isEmpty ? 'Nama Barang tidak boleh kosong' : null,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).iconTheme.color,
                            width: 2)),
                    labelText: 'Deskripsi Aktivitas',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _cbxMainTask(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Pilih Task'),
          DropdownButton<String>(
            isExpanded: true,
            value: _projectFeedMainTaskController.text,
            items: [
              'Umum',
              'Arsitektur',
              'Struktur',
              'MEP (Mechanical, Electrical, Plumbing)',
              'Interior dan Visualisasi',
              'RAB',
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String newValue) async {
              setState(() {
                _projectFeedMainTaskController =
                    TextEditingController(text: newValue);
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _cbxProject(BuildContext context) {
    final firestoreDatabase =
        Provider.of<FirestoreDatabase>(context, listen: false);

    return StreamBuilder(
      stream: firestoreDatabase.projectsStream(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<ProjectModel> appUser = snapshot.data;
          if (appUser.isNotEmpty) {
            final aa = <String>['---'];
            appUser.forEach((element) {
              aa.add(element.projectName);
            });
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Pilih Project'),
                  DropdownButton<String>(
                    isExpanded: true,
                    value: _projectNameController.text,
                    onChanged: (String newValue) async {
                      if (newValue != null) {
                        Map<String, dynamic> data1 = {};
                        final qSnap1 = await Firestore.instance
                            .collection('project')
                            .where('projectName', isEqualTo: newValue)
                            .getDocuments();
                        for (DocumentSnapshot ds in qSnap1.documents) {
                          data1 = ds.data;
                        }

                        setState(() {
                          _projectNameController =
                              TextEditingController(text: newValue);
                          _projectIdController =
                              TextEditingController(text: data1['projectId']);
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
                  ),
                ],
              ),
            );
          }
          // print('appUser.isEmpty');
        }
        return Center(child: CircularProgressIndicator());
        // return Center(child: Container());
      },
    );
  }
}

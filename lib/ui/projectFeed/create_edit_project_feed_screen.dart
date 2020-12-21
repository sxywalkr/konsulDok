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
  TextEditingController _projectFeedStatusCbxController;
  TextEditingController _projectFeedPersentaseApprovalController;
  TextEditingController _projectFeedActivityDescriptionApprovalController;
  String _approvalValue = '0';

  bool _isInit = true;

  @override
  void initState() {
    super.initState();
    if (_isInit) {
      _projectNameController = TextEditingController(text: '---');
      _projectFeedMainTaskController = TextEditingController(text: 'Umum');
      _projectFeedStatusCbxController = TextEditingController(text: 'Approve');
      _isInit = false;
    }
    print('initState');
  }

  Future<String> _getProjectName() async {
    print('_getProjectName');
    final dbReference = Firestore.instance;

    Map<String, dynamic> data1 = {};
    if (_projectFeed != null) {
      final qSnap1 = await dbReference
          .collection("projectFeed")
          .where('projectId', isEqualTo: _projectFeed.projectId)
          .getDocuments();
      for (DocumentSnapshot ds in qSnap1.documents) {
        data1 = ds.data;
      }
      if (mounted) {
        setState(() {
          _projectNameController =
              TextEditingController(text: data1['projectName'].toString());
        });
      }
      return data1['projectName'].toString();
    }
    return '---';
  }

  @override
  void didChangeDependencies() async {
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
        text: _projectFeed != null ? await _getProjectName() : '---');
    // _projectNameController = TextEditingController(
    //     text: _projectFeed != null ? _projectFeed.projectName : '---');
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
    _projectFeedStatusCbxController = TextEditingController(text: 'Approve');
    _projectFeedPersentaseApprovalController = TextEditingController(
        text: _projectFeed != null
            ? _projectFeed.projectFeedPersentaseApproval
            : '0');
    _projectFeedActivityDescriptionApprovalController = TextEditingController(
        text: _projectFeed != null
            ? _projectFeed.projectFeedActivityDescriptionApproval
            : '');
    // if (mounted) {
    print(
        'didChangeDependencies ${_projectFeedPersentaseApprovalController.text}');
    // }
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

                print(
                    'after unfocus ${_projectFeedPersentaseApprovalController.text}');

                final firestoreDatabase =
                    Provider.of<FirestoreDatabase>(context, listen: false);
                final appUserData =
                    Provider.of<AppAccessLevelProvider>(context, listen: false);
                final dbReference = Firestore.instance;

                if (appUserData.appxUserRole == 'User') {
                  print('on user');
                  firestoreDatabase.setProjectFeed(ProjectFeedModel(
                    projectFeedId: _projectFeed != null
                        ? _projectFeed.projectFeedId
                        : documentIdFromCurrentDate(),
                    appUserUid: appUserData.appxUserUid,
                    appUserDisplayName: appUserData.appxUser.appUserDisplayName,
                    projectId: _projectIdController.text,
                    projectName: _projectNameController.text,
                    projectFeedMainTask: _projectFeedMainTaskController.text,
                    projectFeedPersentase:
                        _projectFeedPersentaseController.text,
                    projectFeedActivityDescription:
                        _projectFeedActivityDescriptionController.text,
                    projectFeedDateSubmit: DateTime.now().toIso8601String(),
                    projectFeedDateApproval: '2000-01-01',
                    projectFeedStatus: 'Submit Progress',
                    projectFeedPersentaseApproval:
                        _projectFeedPersentaseController.text,
                    projectFeedActivityDescriptionApproval:
                        _projectFeedActivityDescriptionApprovalController.text,
                  ));
                }
                if (appUserData.appxUserRole == 'Admin') {
                  // print(
                  //     'before future ${_projectFeedPersentaseApprovalController.text}');
                  // Future.delayed(Duration(seconds: 5), () {});
                  print(
                      'after future ${_projectFeedPersentaseApprovalController.text}');
                  Map<String, dynamic> data1 = {};
                  final qSnap1 = await Firestore.instance
                      .collection('project')
                      .where('projectId', isEqualTo: _projectIdController.text)
                      .getDocuments();
                  for (DocumentSnapshot ds in qSnap1.documents) {
                    data1 = ds.data;
                  }
                  // process only if have data
                  if (data1.isNotEmpty) {
                    print(
                        'data1 hasData ${_projectFeedPersentaseApprovalController.text}');
                    firestoreDatabase.setProjectFeed(ProjectFeedModel(
                      projectFeedId: _projectFeed != null
                          ? _projectFeed.projectFeedId
                          : documentIdFromCurrentDate(),
                      appUserUid: appUserData.appxUserUid,
                      appUserDisplayName:
                          appUserData.appxUser.appUserDisplayName,
                      projectId: _projectIdController.text,
                      projectName: _projectNameController.text,
                      projectFeedMainTask: _projectFeedMainTaskController.text,
                      projectFeedPersentase:
                          _projectFeedPersentaseController.text,
                      projectFeedActivityDescription:
                          _projectFeedActivityDescriptionController.text,
                      projectFeedDateSubmit:
                          _projectFeedDateSubmitController.text,
                      projectFeedDateApproval: DateTime.now().toIso8601String(),
                      projectFeedStatus: _projectFeedStatusCbxController.text,
                      projectFeedPersentaseApproval:
                          // _projectFeedPersentaseApprovalController.text,
                          _approvalValue,
                      projectFeedActivityDescriptionApproval:
                          _projectFeedActivityDescriptionApprovalController
                              .text,
                    ));

                    String umum = _projectFeedMainTaskController.text == 'Umum'
                        ? (double.parse(data1['projectTaskUmum']) +
                                double.parse(_approvalValue))
                            .toString()
                        : data1['projectTaskUmum'];
                    String arsitektur =
                        _projectFeedMainTaskController.text == 'Arsitektur'
                            ? (double.parse(data1['projectTaskArsitektur']) +
                                    double.parse(_approvalValue))
                                .toString()
                            : data1['projectTaskArsitektur'];

                    String struktur =
                        _projectFeedMainTaskController.text == 'Struktur'
                            ? (double.parse(data1['projectTaskStruktur']) +
                                    double.parse(_approvalValue))
                                .toString()
                            : data1['projectTaskStruktur'];
                    String mep = _projectFeedMainTaskController.text ==
                            'MEP (Mechanical, Electrical, Plumbing)'
                        ? (double.parse(data1['projectTaskMep']) +
                                double.parse(_approvalValue))
                            .toString()
                        : data1['projectTaskMep'];
                    String interior = _projectFeedMainTaskController.text ==
                            'Interior dan Visualisasi'
                        ? (double.parse(data1['projectTaskInterior']) +
                                double.parse(_approvalValue))
                            .toString()
                        : data1['projectTaskInterior'];
                    String rab = _projectFeedMainTaskController.text == 'RAB'
                        ? (double.parse(data1['projectTaskRab']) +
                                double.parse(_approvalValue))
                            .toString()
                        : data1['projectTaskRab'];

                    dbReference
                        .collection('project')
                        .document(_projectIdController.text)
                        .updateData(
                      {
                        'projectTaskUmum': umum,
                        'projectTaskArsitektur': arsitektur,
                        'projectTaskStruktur': struktur,
                        'projectTaskMep': mep,
                        'projectTaskInterior': interior,
                        'projectTaskRab': rab,
                        'projectPersenActivity': (
                                // double.parse(data1['projectPersenActivity']) +
                                double.parse(umum) +
                                    double.parse(arsitektur) +
                                    double.parse(struktur) +
                                    double.parse(mep) +
                                    double.parse(interior) +
                                    double.parse(rab))
                            .toString(),
                      },
                    );
                  } else if (data1.isEmpty) {
                    print('data1 empty');
                  }
                  print(
                      'data1 here too? ${data1['projectTaskMep']} ${_projectFeedPersentaseApprovalController.text}');
                }
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
    _projectFeedPersentaseApprovalController.dispose();
    _projectFeedActivityDescriptionApprovalController.dispose();

    super.dispose();
  }

  Widget _buildForm(BuildContext context) {
    final appUserProvider =
        Provider.of<AppAccessLevelProvider>(context, listen: false);
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
                  enabled: _projectFeed != null ? false : true,
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
                  enabled: _projectFeed != null ? false : true,

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
              if (appUserProvider.appxUserRole == 'Admin')
                _cbxFeedStatus(context),
              if (appUserProvider.appxUserRole == 'Admin')
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: TextFormField(
                    controller: _projectFeedPersentaseApprovalController,
                    // enabled: _projectFeed != null ? false : true,
                    // style: Theme.of(context).textTheme.body1,
                    // validator: (value) =>
                    //     value.isEmpty ? 'Nama Barang tidak boleh kosong' : null,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).iconTheme.color,
                              width: 2)),
                      labelText: 'Persentase Progress Approval',
                    ),
                    onChanged: (value) {
                      Future.delayed(Duration(seconds: 1), () {
                        setState(() {
                          _approvalValue = value;
                        });
                      });
                    },
                  ),
                ),
              if (appUserProvider.appxUserRole == 'Admin')
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: TextFormField(
                    controller:
                        _projectFeedActivityDescriptionApprovalController,
                    maxLines: 5,
                    // enabled: _projectFeed != null ? false : true,

                    // style: Theme.of(context).textTheme.body1,
                    // validator: (value) =>
                    //     value.isEmpty ? 'Nama Barang tidak boleh kosong' : null,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).iconTheme.color,
                              width: 2)),
                      labelText: 'Remark Approval',
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
          AbsorbPointer(
            absorbing: _projectFeed != null ? true : false,
            child: DropdownButton<String>(
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
          ),
        ],
      ),
    );
  }

  Widget _cbxProject(BuildContext context) {
    final firestoreDatabase =
        Provider.of<FirestoreDatabase>(context, listen: false);
    final appUserProvider =
        Provider.of<AppAccessLevelProvider>(context, listen: false);
    return StreamBuilder(
      stream: appUserProvider.appxUserRole == 'User'
          ? firestoreDatabase.projectModelQbyUserIdStream(
              query1: appUserProvider.appxUserUid)
          : firestoreDatabase.projectsStream(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<ProjectModel> project = snapshot.data;
          if (project.isNotEmpty) {
            final aa = <String>['---'];
            project.forEach((element) {
              aa.add(element.projectName);
            });
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Pilih Project'),
                  AbsorbPointer(
                    absorbing: _projectFeed != null ? true : false,
                    child: DropdownButton<String>(
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
                          // project.map((e) => e.appUserDisplayName)
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
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

  Widget _cbxFeedStatus(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Pilih Status'),
          AbsorbPointer(
            absorbing: _projectFeed != null ? true : false,
            child: DropdownButton<String>(
              isExpanded: true,
              value: _projectFeedStatusCbxController.text,
              items: [
                'Approve',
                'Reject',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String newValue) async {
                setState(() {
                  _projectFeedStatusCbxController =
                      TextEditingController(text: newValue);
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:konsuldok/models/app_user_model.dart';
import 'package:konsuldok/models/project_model.dart';
import 'package:konsuldok/services/firestore_database.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CreateEditProjectScreen extends StatefulWidget {
  @override
  _CreateEditProjectScreenState createState() =>
      _CreateEditProjectScreenState();
}

class _CreateEditProjectScreenState extends State<CreateEditProjectScreen> {
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
  TextEditingController _projectLuasLahanController;
  TextEditingController _projectJumlahLantaiController;
  TextEditingController _projectLuasLantai1Controller;
  TextEditingController _projectLuasLantai2Controller;
  TextEditingController _projectLuasLantai3Controller;
  TextEditingController _projectLuasLantai4Controller;
  TextEditingController _projectLuasLantai5Controller;
  TextEditingController _projectLuasLantai6Controller;
  TextEditingController _projectLuasLantai7Controller;
  TextEditingController _projectLuasLantai8Controller;
  TextEditingController _projectLuasLantai9Controller;
  TextEditingController _projectLuasLantai10Controller;
  TextEditingController _projectLuasLantai11Controller;
  TextEditingController _projectLuasLantai12Controller;
  TextEditingController _projectLuasLantai13Controller;
  TextEditingController _projectLuasLantai14Controller;
  TextEditingController _projectLuasLantai15Controller;
  TextEditingController _projectLuasBangunanController;
  TextEditingController _projectTaskUmumController;
  TextEditingController _projectTaskArsitekturController;
  TextEditingController _projectTaskStrukturController;
  TextEditingController _projectTaskMepController;
  TextEditingController _projectTaskInteriorController;
  TextEditingController _projectTaskRabController;

  bool _isInit = true;
  bool _viewLt1 = false;
  bool _viewLt2 = false;
  bool _viewLt3 = false;
  bool _viewLt4 = false;
  bool _viewLt5 = false;
  bool _viewLt6 = false;
  bool _viewLt7 = false;
  bool _viewLt8 = false;
  bool _viewLt9 = false;
  bool _viewLt10 = false;
  bool _viewLt11 = false;
  bool _viewLt12 = false;
  bool _viewLt13 = false;
  bool _viewLt14 = false;
  bool _viewLt15 = false;

  @override
  void initState() {
    super.initState();
    if (_isInit) {
      _appUserDisplayNameController = TextEditingController(text: '---');
      _projectJumlahLantaiController = TextEditingController(text: '0');
      _isInit = false;
    }
    // print('init');
  }

  Future<String> _getName() async {
    // print('getName');
    final dbReference = FirebaseFirestore.instance;

    Map<String, dynamic> data1 = {};
    if (_project != null) {
      final qSnap1 = await dbReference
          .collection("appUsers")
          .where('appUserUid', isEqualTo: _project.appUserUid)
          .get();
      for (DocumentSnapshot ds in qSnap1.docs) {
        data1 = ds.data();
      }
      if (mounted) {
        setState(() {
          _appUserDisplayNameController = TextEditingController(
              text: data1['appUserDisplayName'].toString());
        });
      }
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
        text: _project != null ? _project.projectPersenActivity : '0');
    _projectFungsiController = TextEditingController(
        text: _project != null ? _project.projectFungsi : '');
    _projectNameController = TextEditingController(
        text: _project != null ? _project.projectName : '');
    _projectStatusController = TextEditingController(
        text: _project != null ? _project.projectStatus : '');
    _projectLuasLahanController = TextEditingController(
        text: _project != null ? _project.projectLuasLahan : '');
    _projectJumlahLantaiController = TextEditingController(
        text: _project != null ? _project.projectJumlahLantai : '0');
    _projectLuasLantai1Controller = TextEditingController(
        text: _project != null ? _project.projectLuasLantai1 : '0');
    _projectLuasLantai2Controller = TextEditingController(
        text: _project != null ? _project.projectLuasLantai2 : '0');
    _projectLuasLantai3Controller = TextEditingController(
        text: _project != null ? _project.projectLuasLantai3 : '0');
    _projectLuasLantai4Controller = TextEditingController(
        text: _project != null ? _project.projectLuasLantai4 : '0');
    _projectLuasLantai5Controller = TextEditingController(
        text: _project != null ? _project.projectLuasLantai5 : '0');
    _projectLuasLantai6Controller = TextEditingController(
        text: _project != null ? _project.projectLuasLantai6 : '0');
    _projectLuasLantai7Controller = TextEditingController(
        text: _project != null ? _project.projectLuasLantai7 : '0');
    _projectLuasLantai8Controller = TextEditingController(
        text: _project != null ? _project.projectLuasLantai8 : '0');
    _projectLuasLantai9Controller = TextEditingController(
        text: _project != null ? _project.projectLuasLantai9 : '0');
    _projectLuasLantai10Controller = TextEditingController(
        text: _project != null ? _project.projectLuasLantai10 : '0');
    _projectLuasLantai11Controller = TextEditingController(
        text: _project != null ? _project.projectLuasLantai11 : '0');
    _projectLuasLantai12Controller = TextEditingController(
        text: _project != null ? _project.projectLuasLantai12 : '0');
    _projectLuasLantai13Controller = TextEditingController(
        text: _project != null ? _project.projectLuasLantai13 : '0');
    _projectLuasLantai14Controller = TextEditingController(
        text: _project != null ? _project.projectLuasLantai14 : '0');
    _projectLuasLantai15Controller = TextEditingController(
        text: _project != null ? _project.projectLuasLantai15 : '0');
    _projectLuasBangunanController = TextEditingController(
        text: _project != null ? _project.projectLuasBangunan : '0');
    _projectTaskUmumController = TextEditingController(
        text: _project != null ? _project.projectTaskUmum : '0');
    _projectTaskArsitekturController = TextEditingController(
        text: _project != null ? _project.projectTaskArsitektur : '0');
    _projectTaskStrukturController = TextEditingController(
        text: _project != null ? _project.projectTaskStruktur : '0');
    _projectTaskMepController = TextEditingController(
        text: _project != null ? _project.projectTaskMep : '0');
    _projectTaskInteriorController = TextEditingController(
        text: _project != null ? _project.projectTaskInterior : '0');
    _projectTaskRabController = TextEditingController(
        text: _project != null ? _project.projectTaskRab : '0');

    if (_projectJumlahLantaiController.text == '1') {
      _viewLt1 = true;
      _viewLt2 = false;
      _viewLt3 = false;
      _viewLt4 = false;
      _viewLt5 = false;
      _viewLt6 = false;
      _viewLt7 = false;
      _viewLt8 = false;
      _viewLt9 = false;
      _viewLt10 = false;
      _viewLt11 = false;
      _viewLt12 = false;
      _viewLt13 = false;
      _viewLt14 = false;
      _viewLt15 = false;
    } else if (_projectJumlahLantaiController.text == '2') {
      _viewLt1 = true;
      _viewLt2 = true;
      _viewLt3 = false;
      _viewLt4 = false;
      _viewLt5 = false;
      _viewLt6 = false;
      _viewLt7 = false;
      _viewLt8 = false;
      _viewLt9 = false;
      _viewLt10 = false;
      _viewLt11 = false;
      _viewLt12 = false;
      _viewLt13 = false;
      _viewLt14 = false;
      _viewLt15 = false;
    } else if (_projectJumlahLantaiController.text == '3') {
      _viewLt1 = true;
      _viewLt2 = true;
      _viewLt3 = true;
      _viewLt4 = false;
      _viewLt5 = false;
      _viewLt6 = false;
      _viewLt7 = false;
      _viewLt8 = false;
      _viewLt9 = false;
      _viewLt10 = false;
      _viewLt11 = false;
      _viewLt12 = false;
      _viewLt13 = false;
      _viewLt14 = false;
      _viewLt15 = false;
    } else if (_projectJumlahLantaiController.text == '4') {
      _viewLt1 = true;
      _viewLt2 = true;
      _viewLt3 = true;
      _viewLt4 = true;
      _viewLt5 = false;
      _viewLt6 = false;
      _viewLt7 = false;
      _viewLt8 = false;
      _viewLt9 = false;
      _viewLt10 = false;
      _viewLt11 = false;
      _viewLt12 = false;
      _viewLt13 = false;
      _viewLt14 = false;
      _viewLt15 = false;
    } else if (_projectJumlahLantaiController.text == '5') {
      _viewLt1 = true;
      _viewLt2 = true;
      _viewLt3 = true;
      _viewLt4 = true;
      _viewLt5 = true;
      _viewLt6 = false;
      _viewLt7 = false;
      _viewLt8 = false;
      _viewLt9 = false;
      _viewLt10 = false;
      _viewLt11 = false;
      _viewLt12 = false;
      _viewLt13 = false;
      _viewLt14 = false;
      _viewLt15 = false;
    } else if (_projectJumlahLantaiController.text == '6') {
      _viewLt1 = true;
      _viewLt2 = true;
      _viewLt3 = true;
      _viewLt4 = true;
      _viewLt5 = true;
      _viewLt6 = true;
      _viewLt7 = false;
      _viewLt8 = false;
      _viewLt9 = false;
      _viewLt10 = false;
      _viewLt11 = false;
      _viewLt12 = false;
      _viewLt13 = false;
      _viewLt14 = false;
      _viewLt15 = false;
    } else if (_projectJumlahLantaiController.text == '7') {
      _viewLt1 = true;
      _viewLt2 = true;
      _viewLt3 = true;
      _viewLt4 = true;
      _viewLt5 = true;
      _viewLt6 = true;
      _viewLt7 = true;
      _viewLt8 = false;
      _viewLt9 = false;
      _viewLt10 = false;
      _viewLt11 = false;
      _viewLt12 = false;
      _viewLt13 = false;
      _viewLt14 = false;
      _viewLt15 = false;
    } else if (_projectJumlahLantaiController.text == '8') {
      _viewLt1 = true;
      _viewLt2 = true;
      _viewLt3 = true;
      _viewLt4 = true;
      _viewLt5 = true;
      _viewLt6 = true;
      _viewLt7 = true;
      _viewLt8 = true;
      _viewLt9 = false;
      _viewLt10 = false;
      _viewLt11 = false;
      _viewLt12 = false;
      _viewLt13 = false;
      _viewLt14 = false;
      _viewLt15 = false;
    } else if (_projectJumlahLantaiController.text == '9') {
      _viewLt1 = true;
      _viewLt2 = true;
      _viewLt3 = true;
      _viewLt4 = true;
      _viewLt5 = true;
      _viewLt6 = true;
      _viewLt7 = true;
      _viewLt8 = true;
      _viewLt9 = true;
      _viewLt10 = false;
      _viewLt11 = false;
      _viewLt12 = false;
      _viewLt13 = false;
      _viewLt14 = false;
      _viewLt15 = false;
    } else if (_projectJumlahLantaiController.text == '10') {
      _viewLt1 = true;
      _viewLt2 = true;
      _viewLt3 = true;
      _viewLt4 = true;
      _viewLt5 = true;
      _viewLt6 = true;
      _viewLt7 = true;
      _viewLt8 = true;
      _viewLt9 = true;
      _viewLt10 = true;
      _viewLt11 = false;
      _viewLt12 = false;
      _viewLt13 = false;
      _viewLt14 = false;
      _viewLt15 = false;
    } else if (_projectJumlahLantaiController.text == '11') {
      _viewLt1 = true;
      _viewLt2 = true;
      _viewLt3 = true;
      _viewLt4 = true;
      _viewLt5 = true;
      _viewLt6 = true;
      _viewLt7 = true;
      _viewLt8 = true;
      _viewLt9 = true;
      _viewLt10 = true;
      _viewLt11 = true;
      _viewLt12 = false;
      _viewLt13 = false;
      _viewLt14 = false;
      _viewLt15 = false;
    } else if (_projectJumlahLantaiController.text == '12') {
      _viewLt1 = true;
      _viewLt2 = true;
      _viewLt3 = true;
      _viewLt4 = true;
      _viewLt5 = true;
      _viewLt6 = true;
      _viewLt7 = true;
      _viewLt8 = true;
      _viewLt9 = true;
      _viewLt10 = true;
      _viewLt11 = true;
      _viewLt12 = true;
      _viewLt13 = false;
      _viewLt14 = false;
      _viewLt15 = false;
    } else if (_projectJumlahLantaiController.text == '13') {
      _viewLt1 = true;
      _viewLt2 = true;
      _viewLt3 = true;
      _viewLt4 = true;
      _viewLt5 = true;
      _viewLt6 = true;
      _viewLt7 = true;
      _viewLt8 = true;
      _viewLt9 = true;
      _viewLt10 = true;
      _viewLt11 = true;
      _viewLt12 = true;
      _viewLt13 = true;
      _viewLt14 = false;
      _viewLt15 = false;
    } else if (_projectJumlahLantaiController.text == '14') {
      _viewLt1 = true;
      _viewLt2 = true;
      _viewLt3 = true;
      _viewLt4 = true;
      _viewLt5 = true;
      _viewLt6 = true;
      _viewLt7 = true;
      _viewLt8 = true;
      _viewLt9 = true;
      _viewLt10 = true;
      _viewLt11 = true;
      _viewLt12 = true;
      _viewLt13 = true;
      _viewLt14 = true;
      _viewLt15 = false;
    } else if (_projectJumlahLantaiController.text == '15') {
      _viewLt1 = true;
      _viewLt2 = true;
      _viewLt3 = true;
      _viewLt4 = true;
      _viewLt5 = true;
      _viewLt6 = true;
      _viewLt7 = true;
      _viewLt8 = true;
      _viewLt9 = true;
      _viewLt10 = true;
      _viewLt11 = true;
      _viewLt12 = true;
      _viewLt13 = true;
      _viewLt14 = true;
      _viewLt15 = true;
    } else {
      _viewLt1 = false;
      _viewLt2 = false;
      _viewLt3 = false;
      _viewLt4 = false;
      _viewLt5 = false;
      _viewLt6 = false;
      _viewLt7 = false;
      _viewLt8 = false;
      _viewLt9 = false;
      _viewLt10 = false;
      _viewLt11 = false;
      _viewLt12 = false;
      _viewLt13 = false;
      _viewLt14 = false;
      _viewLt15 = false;
    }
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
                    projectLuasLahan: _projectLuasLahanController.text,
                    projectJumlahLantai: _projectJumlahLantaiController.text,
                    projectLuasLantai1: _projectLuasLantai1Controller.text,
                    projectLuasLantai2: _projectLuasLantai2Controller.text,
                    projectLuasLantai3: _projectLuasLantai3Controller.text,
                    projectLuasLantai4: _projectLuasLantai4Controller.text,
                    projectLuasLantai5: _projectLuasLantai5Controller.text,
                    projectLuasLantai6: _projectLuasLantai6Controller.text,
                    projectLuasLantai7: _projectLuasLantai7Controller.text,
                    projectLuasLantai8: _projectLuasLantai8Controller.text,
                    projectLuasLantai9: _projectLuasLantai9Controller.text,
                    projectLuasLantai10: _projectLuasLantai10Controller.text,
                    projectLuasLantai11: _projectLuasLantai11Controller.text,
                    projectLuasLantai12: _projectLuasLantai12Controller.text,
                    projectLuasLantai13: _projectLuasLantai13Controller.text,
                    projectLuasLantai14: _projectLuasLantai14Controller.text,
                    projectLuasLantai15: _projectLuasLantai15Controller.text,
                    projectLuasBangunan: _projectLuasBangunanController.text,
                    projectTaskUmum: _projectTaskUmumController.text,
                    projectTaskArsitektur:
                        _projectTaskArsitekturController.text,
                    projectTaskStruktur: _projectTaskStrukturController.text,
                    projectTaskMep: _projectTaskMepController.text,
                    projectTaskInterior: _projectTaskInteriorController.text,
                    projectTaskRab: _projectTaskRabController.text,
                  ));

                  Navigator.of(context).pop();
                }
              },
              child: Text("Simpan"))
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
    _projectLuasLahanController.dispose();
    _projectJumlahLantaiController.dispose();
    _projectLuasLantai1Controller.dispose();
    _projectLuasLantai2Controller.dispose();
    _projectLuasLantai3Controller.dispose();
    _projectLuasLantai4Controller.dispose();
    _projectLuasLantai5Controller.dispose();
    _projectLuasLantai6Controller.dispose();
    _projectLuasLantai7Controller.dispose();
    _projectLuasLantai8Controller.dispose();
    _projectLuasLantai9Controller.dispose();
    _projectLuasLantai10Controller.dispose();
    _projectLuasLantai11Controller.dispose();
    _projectLuasLantai12Controller.dispose();
    _projectLuasLantai13Controller.dispose();
    _projectLuasLantai14Controller.dispose();
    _projectLuasLantai15Controller.dispose();
    _projectLuasBangunanController.dispose();
    _projectTaskUmumController.dispose();
    _projectTaskArsitekturController.dispose();
    _projectTaskStrukturController.dispose();
    _projectTaskMepController.dispose();
    _projectTaskInteriorController.dispose();
    _projectTaskRabController.dispose();
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
                  // enabled: false,
                  // style: Theme.of(context).textTheme.body1,
                  // validator: (value) =>
                  //     value.isEmpty ? 'Nama Barang tidak boleh kosong' : null,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).iconTheme.color,
                            width: 2)),
                    labelText: 'Nama',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: TextFormField(
                  controller: _projectTglDeadlineController,
                  // enabled: false,
                  // style: Theme.of(context).textTheme.body1,
                  // validator: (value) =>
                  //     value.isEmpty ? 'Nama Barang tidak boleh kosong' : null,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).iconTheme.color,
                            width: 2)),
                    labelText: 'Tanggal Deadline',
                  ),
                ),
              ),

              // Padding(
              //   padding: const EdgeInsets.symmetric(vertical: 16),
              //   child: TextFormField(
              //     controller: _appUserUidController,
              //     // enabled: false,
              //     // style: Theme.of(context).textTheme.body1,
              //     // validator: (value) =>
              //     //     value.isEmpty ? 'Nama Barang tidak boleh kosong' : null,
              //     decoration: InputDecoration(
              //       enabledBorder: OutlineInputBorder(
              //           borderSide: BorderSide(
              //               color: Theme.of(context).iconTheme.color,
              //               width: 2)),
              //       labelText: 'User Id yang handle',
              //     ),
              //   ),
              // ),
              SizedBox(
                height: 16,
              ),
              Text('Pilih Penanggung Jawab'),
              _cbxUser(context),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: TextFormField(
                  controller: _projectFungsiController,
                  // enabled: false,
                  // style: Theme.of(context).textTheme.body1,
                  // validator: (value) =>
                  //     value.isEmpty ? 'Nama Barang tidak boleh kosong' : null,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).iconTheme.color,
                            width: 2)),
                    labelText: 'Fungsi',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 8),
                child: TextFormField(
                  controller: _projectPersenActivityController,
                  enabled: false,
                  // style: Theme.of(context).textTheme.body1,
                  // validator: (value) =>
                  //     value.isEmpty ? 'Nama Barang tidak boleh kosong' : null,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).iconTheme.color,
                            width: 2)),
                    labelText: 'Persen Activity',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24, top: 8, bottom: 8),
                child: TextFormField(
                  controller: _projectTaskUmumController,
                  enabled: false,
                  // style: Theme.of(context).textTheme.body1,
                  // validator: (value) =>
                  //     value.isEmpty ? 'Nama Barang tidak boleh kosong' : null,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).iconTheme.color,
                            width: 2)),
                    labelText: 'Task Umum',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24, top: 8, bottom: 8),
                child: TextFormField(
                  controller: _projectTaskArsitekturController,
                  enabled: false,
                  // style: Theme.of(context).textTheme.body1,
                  // validator: (value) =>
                  //     value.isEmpty ? 'Nama Barang tidak boleh kosong' : null,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).iconTheme.color,
                            width: 2)),
                    labelText: 'Task Arsitektur',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24, top: 8, bottom: 8),
                child: TextFormField(
                  controller: _projectTaskStrukturController,
                  enabled: false,
                  // style: Theme.of(context).textTheme.body1,
                  // validator: (value) =>
                  //     value.isEmpty ? 'Nama Barang tidak boleh kosong' : null,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).iconTheme.color,
                            width: 2)),
                    labelText: 'Task Struktur',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24, top: 8, bottom: 8),
                child: TextFormField(
                  controller: _projectTaskMepController,
                  enabled: false,
                  // style: Theme.of(context).textTheme.body1,
                  // validator: (value) =>
                  //     value.isEmpty ? 'Nama Barang tidak boleh kosong' : null,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).iconTheme.color,
                            width: 2)),
                    labelText: 'Task MEP',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24, top: 8, bottom: 8),
                child: TextFormField(
                  controller: _projectTaskInteriorController,
                  enabled: false,
                  // style: Theme.of(context).textTheme.body1,
                  // validator: (value) =>
                  //     value.isEmpty ? 'Nama Barang tidak boleh kosong' : null,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).iconTheme.color,
                            width: 2)),
                    labelText: 'Task Interior',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24, top: 8, bottom: 16),
                child: TextFormField(
                  controller: _projectTaskRabController,
                  enabled: false,
                  // style: Theme.of(context).textTheme.body1,
                  // validator: (value) =>
                  //     value.isEmpty ? 'Nama Barang tidak boleh kosong' : null,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).iconTheme.color,
                            width: 2)),
                    labelText: 'Task RAB',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: TextFormField(
                  controller: _projectLuasLahanController,
                  // enabled: false,
                  // style: Theme.of(context).textTheme.body1,
                  // validator: (value) =>
                  //     value.isEmpty ? 'Nama Barang tidak boleh kosong' : null,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).iconTheme.color,
                            width: 2)),
                    labelText: 'Luas Lahan',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: TextFormField(
                  controller: _projectLuasBangunanController,
                  enabled: false,
                  // style: Theme.of(context).textTheme.body1,
                  // validator: (value) =>
                  //     value.isEmpty ? 'Nama Barang tidak boleh kosong' : null,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).iconTheme.color,
                            width: 2)),
                    labelText: 'Luas Bangunan',
                  ),
                ),
              ),
              // jumlah lantai + luas lantai + luas bangunan perlu widget tersendiri
              _cbxJumlahLantai(context),
              if (_viewLt1)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: TextFormField(
                    controller: _projectLuasLantai1Controller,
                    // enabled: false,
                    // style: Theme.of(context).textTheme.body1,
                    // validator: (value) =>
                    //     value.isEmpty ? 'Nama Barang tidak boleh kosong' : null,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).iconTheme.color,
                              width: 2)),
                      labelText: 'Luas Lantai 1',
                    ),
                    onChanged: (value) {
                      _luasBangunan();
                    },
                  ),
                ),
              if (_viewLt2)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: TextFormField(
                    controller: _projectLuasLantai2Controller,
                    // enabled: false,
                    // style: Theme.of(context).textTheme.body1,
                    // validator: (value) =>
                    //     value.isEmpty ? 'Nama Barang tidak boleh kosong' : null,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).iconTheme.color,
                              width: 2)),
                      labelText: 'Luas Lantai 2',
                    ),
                    onChanged: (value) {
                      _luasBangunan();
                    },
                  ),
                ),
              if (_viewLt3)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: TextFormField(
                    controller: _projectLuasLantai3Controller,
                    // enabled: false,
                    // style: Theme.of(context).textTheme.body1,
                    // validator: (value) =>
                    //     value.isEmpty ? 'Nama Barang tidak boleh kosong' : null,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).iconTheme.color,
                              width: 2)),
                      labelText: 'Luas Lantai 3',
                    ),
                    onChanged: (value) {
                      _luasBangunan();
                    },
                  ),
                ),
              if (_viewLt4)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: TextFormField(
                    controller: _projectLuasLantai4Controller,
                    // enabled: false,
                    // style: Theme.of(context).textTheme.body1,
                    // validator: (value) =>
                    //     value.isEmpty ? 'Nama Barang tidak boleh kosong' : null,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).iconTheme.color,
                              width: 2)),
                      labelText: 'Luas Lantai 4',
                    ),
                    onChanged: (value) {
                      _luasBangunan();
                    },
                  ),
                ),
              if (_viewLt5)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: TextFormField(
                    controller: _projectLuasLantai5Controller,
                    // enabled: false,
                    // style: Theme.of(context).textTheme.body1,
                    // validator: (value) =>
                    //     value.isEmpty ? 'Nama Barang tidak boleh kosong' : null,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).iconTheme.color,
                              width: 2)),
                      labelText: 'Luas Lantai 5',
                    ),
                    onChanged: (value) {
                      _luasBangunan();
                    },
                  ),
                ),
              if (_viewLt6)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: TextFormField(
                    controller: _projectLuasLantai6Controller,
                    // enabled: false,
                    // style: Theme.of(context).textTheme.body1,
                    // validator: (value) =>
                    //     value.isEmpty ? 'Nama Barang tidak boleh kosong' : null,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).iconTheme.color,
                              width: 2)),
                      labelText: 'Luas Lantai 6',
                    ),
                    onChanged: (value) {
                      _luasBangunan();
                    },
                  ),
                ),
              if (_viewLt7)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: TextFormField(
                    controller: _projectLuasLantai7Controller,
                    // enabled: false,
                    // style: Theme.of(context).textTheme.body1,
                    // validator: (value) =>
                    //     value.isEmpty ? 'Nama Barang tidak boleh kosong' : null,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).iconTheme.color,
                              width: 2)),
                      labelText: 'Luas Lantai 7',
                    ),
                    onChanged: (value) {
                      _luasBangunan();
                    },
                  ),
                ),
              if (_viewLt8)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: TextFormField(
                    controller: _projectLuasLantai8Controller,
                    // enabled: false,
                    // style: Theme.of(context).textTheme.body1,
                    // validator: (value) =>
                    //     value.isEmpty ? 'Nama Barang tidak boleh kosong' : null,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).iconTheme.color,
                              width: 2)),
                      labelText: 'Luas Lantai 8',
                    ),
                    onChanged: (value) {
                      _luasBangunan();
                    },
                  ),
                ),
              if (_viewLt9)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: TextFormField(
                    controller: _projectLuasLantai9Controller,
                    // enabled: false,
                    // style: Theme.of(context).textTheme.body1,
                    // validator: (value) =>
                    //     value.isEmpty ? 'Nama Barang tidak boleh kosong' : null,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).iconTheme.color,
                              width: 2)),
                      labelText: 'Luas Lantai 9',
                    ),
                    onChanged: (value) {
                      _luasBangunan();
                    },
                  ),
                ),
              if (_viewLt10)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: TextFormField(
                    controller: _projectLuasLantai10Controller,
                    // enabled: false,
                    // style: Theme.of(context).textTheme.body1,
                    // validator: (value) =>
                    //     value.isEmpty ? 'Nama Barang tidak boleh kosong' : null,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).iconTheme.color,
                              width: 2)),
                      labelText: 'Luas Lantai 10',
                    ),
                    onChanged: (value) {
                      _luasBangunan();
                    },
                  ),
                ),
              if (_viewLt11)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: TextFormField(
                    controller: _projectLuasLantai11Controller,
                    // enabled: false,
                    // style: Theme.of(context).textTheme.body1,
                    // validator: (value) =>
                    //     value.isEmpty ? 'Nama Barang tidak boleh kosong' : null,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).iconTheme.color,
                              width: 2)),
                      labelText: 'Luas Lantai 11',
                    ),
                    onChanged: (value) {
                      _luasBangunan();
                    },
                  ),
                ),
              if (_viewLt12)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: TextFormField(
                    controller: _projectLuasLantai12Controller,
                    // enabled: false,
                    // style: Theme.of(context).textTheme.body1,
                    // validator: (value) =>
                    //     value.isEmpty ? 'Nama Barang tidak boleh kosong' : null,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).iconTheme.color,
                              width: 2)),
                      labelText: 'Luas Lantai 12',
                    ),
                    onChanged: (value) {
                      _luasBangunan();
                    },
                  ),
                ),
              if (_viewLt13)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: TextFormField(
                    controller: _projectLuasLantai13Controller,
                    // enabled: false,
                    // style: Theme.of(context).textTheme.body1,
                    // validator: (value) =>
                    //     value.isEmpty ? 'Nama Barang tidak boleh kosong' : null,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).iconTheme.color,
                              width: 2)),
                      labelText: 'Luas Lantai 13',
                    ),
                    onChanged: (value) {
                      _luasBangunan();
                    },
                  ),
                ),
              if (_viewLt14)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: TextFormField(
                    controller: _projectLuasLantai14Controller,
                    // enabled: false,
                    // style: Theme.of(context).textTheme.body1,
                    // validator: (value) =>
                    //     value.isEmpty ? 'Nama Barang tidak boleh kosong' : null,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).iconTheme.color,
                              width: 2)),
                      labelText: 'Luas Lantai 14',
                    ),
                    onChanged: (value) {
                      _luasBangunan();
                    },
                  ),
                ),
              if (_viewLt15)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: TextFormField(
                    controller: _projectLuasLantai15Controller,
                    // enabled: false,
                    // style: Theme.of(context).textTheme.body1,
                    // validator: (value) =>
                    //     value.isEmpty ? 'Nama Barang tidak boleh kosong' : null,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).iconTheme.color,
                              width: 2)),
                      labelText: 'Luas Lantai 15',
                    ),
                    onChanged: (value) {
                      _luasBangunan();
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _cbxUser(BuildContext context) {
    final firestoreDatabase =
        Provider.of<FirestoreDatabase>(context, listen: false);

    return StreamBuilder(
      stream: firestoreDatabase.appUsersStream(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<AppUserModel> appUser = snapshot.data;
          if (appUser.isNotEmpty) {
            final aa = <String>['---'];
            appUser.forEach((element) {
              aa.add(element.appUserDisplayName);
            });
            return DropdownButton<String>(
              value: _appUserDisplayNameController.text,
              onChanged: (String newValue) async {
                if (newValue != null) {
                  Map<String, dynamic> data1 = {};
                  final qSnap1 = await FirebaseFirestore.instance
                      .collection('appUsers')
                      .where('appUserDisplayName', isEqualTo: newValue)
                      .get();
                  for (DocumentSnapshot ds in qSnap1.docs) {
                    data1 = ds.data();
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

  Widget _cbxJumlahLantai(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Jumlah Lantai'),
          DropdownButton<String>(
            isExpanded: true,
            value: _projectJumlahLantaiController.text,
            items: [
              '0',
              '1',
              '2',
              '3',
              '4',
              '5',
              '6',
              '7',
              '8',
              '9',
              '10',
              '11',
              '12',
              '13',
              '14',
              '15',
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String newValue) async {
              setState(() {
                _projectJumlahLantaiController.text = newValue;
                _projectLuasLantai1Controller.text = '0';
                _projectLuasLantai2Controller.text = '0';
                _projectLuasLantai3Controller.text = '0';
                _projectLuasLantai4Controller.text = '0';
                _projectLuasLantai5Controller.text = '0';
                _projectLuasLantai6Controller.text = '0';
                _projectLuasLantai7Controller.text = '0';
                _projectLuasLantai8Controller.text = '0';
                _projectLuasLantai9Controller.text = '0';
                _projectLuasLantai10Controller.text = '0';
                _projectLuasLantai11Controller.text = '0';
                _projectLuasLantai12Controller.text = '0';
                _projectLuasLantai13Controller.text = '0';
                _projectLuasLantai14Controller.text = '0';
                _projectLuasLantai15Controller.text = '0';
                _projectLuasBangunanController.text = '0';
                if (newValue == '1') {
                  _viewLt1 = true;
                  _viewLt2 = false;
                  _viewLt3 = false;
                  _viewLt4 = false;
                  _viewLt5 = false;
                  _viewLt6 = false;
                  _viewLt7 = false;
                  _viewLt8 = false;
                  _viewLt9 = false;
                  _viewLt10 = false;
                  _viewLt11 = false;
                  _viewLt12 = false;
                  _viewLt13 = false;
                  _viewLt14 = false;
                  _viewLt15 = false;
                } else if (newValue == '2') {
                  _viewLt1 = true;
                  _viewLt2 = true;
                  _viewLt3 = false;
                  _viewLt4 = false;
                  _viewLt5 = false;
                  _viewLt6 = false;
                  _viewLt7 = false;
                  _viewLt8 = false;
                  _viewLt9 = false;
                  _viewLt10 = false;
                  _viewLt11 = false;
                  _viewLt12 = false;
                  _viewLt13 = false;
                  _viewLt14 = false;
                  _viewLt15 = false;
                } else if (newValue == '3') {
                  _viewLt1 = true;
                  _viewLt2 = true;
                  _viewLt3 = true;
                  _viewLt4 = false;
                  _viewLt5 = false;
                  _viewLt6 = false;
                  _viewLt7 = false;
                  _viewLt8 = false;
                  _viewLt9 = false;
                  _viewLt10 = false;
                  _viewLt11 = false;
                  _viewLt12 = false;
                  _viewLt13 = false;
                  _viewLt14 = false;
                  _viewLt15 = false;
                } else if (newValue == '4') {
                  _viewLt1 = true;
                  _viewLt2 = true;
                  _viewLt3 = true;
                  _viewLt4 = true;
                  _viewLt5 = false;
                  _viewLt6 = false;
                  _viewLt7 = false;
                  _viewLt8 = false;
                  _viewLt9 = false;
                  _viewLt10 = false;
                  _viewLt11 = false;
                  _viewLt12 = false;
                  _viewLt13 = false;
                  _viewLt14 = false;
                  _viewLt15 = false;
                } else if (newValue == '5') {
                  _viewLt1 = true;
                  _viewLt2 = true;
                  _viewLt3 = true;
                  _viewLt4 = true;
                  _viewLt5 = true;
                  _viewLt6 = false;
                  _viewLt7 = false;
                  _viewLt8 = false;
                  _viewLt9 = false;
                  _viewLt10 = false;
                  _viewLt11 = false;
                  _viewLt12 = false;
                  _viewLt13 = false;
                  _viewLt14 = false;
                  _viewLt15 = false;
                } else if (newValue == '6') {
                  _viewLt1 = true;
                  _viewLt2 = true;
                  _viewLt3 = true;
                  _viewLt4 = true;
                  _viewLt5 = true;
                  _viewLt6 = true;
                  _viewLt7 = false;
                  _viewLt8 = false;
                  _viewLt9 = false;
                  _viewLt10 = false;
                  _viewLt11 = false;
                  _viewLt12 = false;
                  _viewLt13 = false;
                  _viewLt14 = false;
                  _viewLt15 = false;
                } else if (newValue == '7') {
                  _viewLt1 = true;
                  _viewLt2 = true;
                  _viewLt3 = true;
                  _viewLt4 = true;
                  _viewLt5 = true;
                  _viewLt6 = true;
                  _viewLt7 = true;
                  _viewLt8 = false;
                  _viewLt9 = false;
                  _viewLt10 = false;
                  _viewLt11 = false;
                  _viewLt12 = false;
                  _viewLt13 = false;
                  _viewLt14 = false;
                  _viewLt15 = false;
                } else if (newValue == '8') {
                  _viewLt1 = true;
                  _viewLt2 = true;
                  _viewLt3 = true;
                  _viewLt4 = true;
                  _viewLt5 = true;
                  _viewLt6 = true;
                  _viewLt7 = true;
                  _viewLt8 = true;
                  _viewLt9 = false;
                  _viewLt10 = false;
                  _viewLt11 = false;
                  _viewLt12 = false;
                  _viewLt13 = false;
                  _viewLt14 = false;
                  _viewLt15 = false;
                } else if (newValue == '9') {
                  _viewLt1 = true;
                  _viewLt2 = true;
                  _viewLt3 = true;
                  _viewLt4 = true;
                  _viewLt5 = true;
                  _viewLt6 = true;
                  _viewLt7 = true;
                  _viewLt8 = true;
                  _viewLt9 = true;
                  _viewLt10 = false;
                  _viewLt11 = false;
                  _viewLt12 = false;
                  _viewLt13 = false;
                  _viewLt14 = false;
                  _viewLt15 = false;
                } else if (newValue == '10') {
                  _viewLt1 = true;
                  _viewLt2 = true;
                  _viewLt3 = true;
                  _viewLt4 = true;
                  _viewLt5 = true;
                  _viewLt6 = true;
                  _viewLt7 = true;
                  _viewLt8 = true;
                  _viewLt9 = true;
                  _viewLt10 = true;
                  _viewLt11 = false;
                  _viewLt12 = false;
                  _viewLt13 = false;
                  _viewLt14 = false;
                  _viewLt15 = false;
                } else if (newValue == '11') {
                  _viewLt1 = true;
                  _viewLt2 = true;
                  _viewLt3 = true;
                  _viewLt4 = true;
                  _viewLt5 = true;
                  _viewLt6 = true;
                  _viewLt7 = true;
                  _viewLt8 = true;
                  _viewLt9 = true;
                  _viewLt10 = true;
                  _viewLt11 = true;
                  _viewLt12 = false;
                  _viewLt13 = false;
                  _viewLt14 = false;
                  _viewLt15 = false;
                } else if (newValue == '12') {
                  _viewLt1 = true;
                  _viewLt2 = true;
                  _viewLt3 = true;
                  _viewLt4 = true;
                  _viewLt5 = true;
                  _viewLt6 = true;
                  _viewLt7 = true;
                  _viewLt8 = true;
                  _viewLt9 = true;
                  _viewLt10 = true;
                  _viewLt11 = true;
                  _viewLt12 = true;
                  _viewLt13 = false;
                  _viewLt14 = false;
                  _viewLt15 = false;
                } else if (newValue == '13') {
                  _viewLt1 = true;
                  _viewLt2 = true;
                  _viewLt3 = true;
                  _viewLt4 = true;
                  _viewLt5 = true;
                  _viewLt6 = true;
                  _viewLt7 = true;
                  _viewLt8 = true;
                  _viewLt9 = true;
                  _viewLt10 = true;
                  _viewLt11 = true;
                  _viewLt12 = true;
                  _viewLt13 = true;
                  _viewLt14 = false;
                  _viewLt15 = false;
                } else if (newValue == '14') {
                  _viewLt1 = true;
                  _viewLt2 = true;
                  _viewLt3 = true;
                  _viewLt4 = true;
                  _viewLt5 = true;
                  _viewLt6 = true;
                  _viewLt7 = true;
                  _viewLt8 = true;
                  _viewLt9 = true;
                  _viewLt10 = true;
                  _viewLt11 = true;
                  _viewLt12 = true;
                  _viewLt13 = true;
                  _viewLt14 = true;
                  _viewLt15 = false;
                } else if (newValue == '15') {
                  _viewLt1 = true;
                  _viewLt2 = true;
                  _viewLt3 = true;
                  _viewLt4 = true;
                  _viewLt5 = true;
                  _viewLt6 = true;
                  _viewLt7 = true;
                  _viewLt8 = true;
                  _viewLt9 = true;
                  _viewLt10 = true;
                  _viewLt11 = true;
                  _viewLt12 = true;
                  _viewLt13 = true;
                  _viewLt14 = true;
                  _viewLt15 = true;
                } else {
                  _viewLt1 = false;
                  _viewLt2 = false;
                  _viewLt3 = false;
                  _viewLt4 = false;
                  _viewLt5 = false;
                  _viewLt6 = false;
                  _viewLt7 = false;
                  _viewLt8 = false;
                  _viewLt9 = false;
                  _viewLt10 = false;
                  _viewLt11 = false;
                  _viewLt12 = false;
                  _viewLt13 = false;
                  _viewLt14 = false;
                  _viewLt15 = false;
                }
              });
            },
          ),
        ],
      ),
    );
  }

  _luasBangunan() {
    Future.delayed(Duration(seconds: 2), () {
      _projectLuasBangunanController.text =
          (int.parse(_projectLuasLantai1Controller.text) +
                  int.parse(_projectLuasLantai2Controller.text) +
                  int.parse(_projectLuasLantai3Controller.text) +
                  int.parse(_projectLuasLantai4Controller.text) +
                  int.parse(_projectLuasLantai5Controller.text) +
                  int.parse(_projectLuasLantai6Controller.text) +
                  int.parse(_projectLuasLantai7Controller.text) +
                  int.parse(_projectLuasLantai8Controller.text) +
                  int.parse(_projectLuasLantai9Controller.text) +
                  int.parse(_projectLuasLantai10Controller.text) +
                  int.parse(_projectLuasLantai11Controller.text) +
                  int.parse(_projectLuasLantai12Controller.text) +
                  int.parse(_projectLuasLantai13Controller.text) +
                  int.parse(_projectLuasLantai14Controller.text) +
                  int.parse(_projectLuasLantai15Controller.text))
              .toString();
    });
  }
  // print('appUser.isEmpty');

  // return Center(child: Container());

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

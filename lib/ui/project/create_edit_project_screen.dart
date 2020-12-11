import 'package:flutter/material.dart';
import 'package:taskmon/models/project_model.dart';
import 'package:taskmon/services/firestore_database.dart';
import 'package:provider/provider.dart';

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
  TextEditingController _projectTglDeadlineController;
  TextEditingController _projectTglStartController;
  TextEditingController _projectPersenActivityController;
  TextEditingController _projectDescriptionController;
  TextEditingController _projectNameController;
  TextEditingController _projectStatusController;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final ProjectModel _projectModel =
        ModalRoute.of(context).settings.arguments;
    if (_projectModel != null) {
      _project = _projectModel;
    }

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
    _projectDescriptionController = TextEditingController(
        text: _project != null ? _project.projectDescription : '');
    _projectNameController = TextEditingController(
        text: _project != null ? _project.projectName : '');
    _projectStatusController = TextEditingController(
        text: _project != null ? _project.projectStatus : '');
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
                    projectDescription: _projectDescriptionController.text,
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
      body: Center(
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
    _projectDescriptionController.dispose();
    _projectNameController.dispose();
    _projectStatusController.dispose();
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
                    labelText: 'Nama Project',
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
                    labelText: 'Tanggal Deadline Project',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: TextFormField(
                  controller: _projectDescriptionController,
                  // enabled: false,
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
                  controller: _appUserUidController,
                  // enabled: false,
                  // style: Theme.of(context).textTheme.body1,
                  // validator: (value) =>
                  //     value.isEmpty ? 'Nama Barang tidak boleh kosong' : null,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).iconTheme.color,
                            width: 2)),
                    labelText: 'User Yang Handle',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

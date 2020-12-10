import 'package:flutter/material.dart';
// import 'package:taskmon/app_localizations.dart';
// import 'package:taskmon/models/todo_model.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:taskmon/services/firestore_database.dart';
import 'package:provider/provider.dart';
// import 'package:taskmon/models/stok_brg_keluar_model.dart';
// import 'package:taskmon/models/stok_brg_aktif_model.dart';
import 'package:taskmon/models/app_user_model.dart';

class CreateEditUserScreen extends StatefulWidget {
  @override
  _CreateEditUserScreenState createState() => _CreateEditUserScreenState();
}

class _CreateEditUserScreenState extends State<CreateEditUserScreen> {
  //init
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  AppUserModel _appUser;
  TextEditingController _appUserUidController;
  TextEditingController _appUserEmailController;
  TextEditingController _appUserRoleController;
  TextEditingController _appUserFcmIdController;
  TextEditingController _appUserDisplayNameController;
  TextEditingController _appUserNoHapeController;
  TextEditingController _appUserGenderController;
  TextEditingController _appUserAlamatController;
  TextEditingController _appUserFlagActivityController;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // print(ModalRoute.of(context).settings.arguments.runtimeType);
    // print(ModalRoute.of(context).settings.arguments);
    final AppUserModel _appUserModel =
        ModalRoute.of(context).settings.arguments;
    // print(_appUserModel.appUserEmail);
    if (_appUserModel != null) {
      _appUser = _appUserModel;
    }

    _appUserUidController = TextEditingController(
        text: _appUser != null ? _appUser.appUserUid : '');
    _appUserEmailController = TextEditingController(
        text: _appUser != null ? _appUser.appUserEmail : '');
    _appUserRoleController = TextEditingController(
        text: _appUser != null ? _appUser.appUserRole : '');
    _appUserFcmIdController = TextEditingController(
        text: _appUser != null ? _appUser.appUserFcmId : '');
    _appUserDisplayNameController = TextEditingController(
        text: _appUser != null ? _appUser.appUserDisplayName : '');
    _appUserNoHapeController = TextEditingController(
        text: _appUser != null ? _appUser.appUserNoHape : '');
    _appUserGenderController = TextEditingController(
        text: _appUser != null ? _appUser.appUserGender : '');
    _appUserAlamatController = TextEditingController(
        text: _appUser != null ? _appUser.appUserAlamat : '');
    _appUserFlagActivityController = TextEditingController(
        text: _appUser != null ? _appUser.appUserFlagActivity : '');
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
        title: Text('Profile'),
        actions: <Widget>[
          FlatButton(
            child: Text("Simpan"),
            onPressed: () async {
              if (_formKey.currentState.validate()) {
                FocusScope.of(context).unfocus();

                final firestoreDatabase =
                    Provider.of<FirestoreDatabase>(context, listen: false);

                // final _uid = _appUser != null ? _appUser.id : generateUid();

                firestoreDatabase.setAppUser(AppUserModel(
                  // id: _appUser != null
                  //     ? _appUser.id
                  //     : documentIdFromCurrentDate(),
                  appUserUid: _appUserUidController.text,
                  appUserEmail: _appUserEmailController.text,
                  appUserRole: _appUserRoleController.text,
                  appUserFcmId: _appUserFcmIdController.text,
                  appUserDisplayName: _appUserDisplayNameController.text,
                  appUserNoHape: _appUserNoHapeController.text,
                  appUserGender: _appUserGenderController.text,
                  appUserAlamat: _appUserAlamatController.text,
                  appUserFlagActivity: _appUserFlagActivityController.text,
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
    _appUserUidController.dispose();
    _appUserEmailController.dispose();
    _appUserRoleController.dispose();
    _appUserFcmIdController.dispose();
    _appUserDisplayNameController.dispose();
    _appUserNoHapeController.dispose();
    _appUserGenderController.dispose();
    _appUserAlamatController.dispose();
    _appUserFlagActivityController.dispose();

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
                  controller: _appUserDisplayNameController,
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
                  controller: _appUserEmailController,
                  enabled: false,
                  // style: Theme.of(context).textTheme.body1,
                  // validator: (value) =>
                  //     value.isEmpty ? 'Nama Barang tidak boleh kosong' : null,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).iconTheme.color,
                            width: 2)),
                    labelText: 'Email',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: TextFormField(
                  controller: _appUserNoHapeController,
                  // enabled: false,
                  // style: Theme.of(context).textTheme.body1,
                  // validator: (value) =>
                  //     value.isEmpty ? 'Nama Barang tidak boleh kosong' : null,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).iconTheme.color,
                            width: 2)),
                    labelText: 'Nomor Handphone',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: TextFormField(
                  controller: _appUserGenderController,
                  // enabled: false,
                  // style: Theme.of(context).textTheme.body1,
                  // validator: (value) =>
                  //     value.isEmpty ? 'Nama Barang tidak boleh kosong' : null,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).iconTheme.color,
                            width: 2)),
                    labelText: 'Jenis Kelamin',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: TextFormField(
                  controller: _appUserAlamatController,
                  // enabled: false,
                  // style: Theme.of(context).textTheme.body1,
                  // validator: (value) =>
                  //     value.isEmpty ? 'Nama Barang tidak boleh kosong' : null,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).iconTheme.color,
                            width: 2)),
                    labelText: 'Alamat',
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

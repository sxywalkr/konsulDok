import 'package:flutter/material.dart';
// import 'package:konsuldok/models/project_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:konsuldok/services/firestore_database.dart';
import 'package:provider/provider.dart';
import 'package:konsuldok/models/absensi_setting_model.dart';
import 'package:konsuldok/providers/app_access_level_provider.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:konsuldok/routes.dart';

class CreateEditAbsensiSettingScreen extends StatefulWidget {
  @override
  _CreateEditAbsensiSettingScreenState createState() =>
      _CreateEditAbsensiSettingScreenState();
}

class _CreateEditAbsensiSettingScreenState
    extends State<CreateEditAbsensiSettingScreen> {
  //init
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  AbsensiSettingModel _absensiSetting;
  TextEditingController _absensiSettingIdController;
  TextEditingController _absensiSettingOfficeLongController;
  TextEditingController _absensiSettingOfficeLatController;
  TextEditingController _absensiSettingOfficeWorkHourController;
  TextEditingController _absensiSettingHomeLatController;
  TextEditingController _absensiSettingSiteLongController;
  TextEditingController _absensiSettingSiteLatController;
  TextEditingController _absensiSettingOfficeRadiusController;
  TextEditingController _absensiSettingHomeRadiusController;
  TextEditingController _absensiSettingSiteRadiusController;
  bool _isInit = true;

  Future<AbsensiSettingModel> _getOffice() async {
    final dbReference = Firestore.instance;

    // Map<String, dynamic> data1 = {};
    final qSnap1 = await dbReference
        .collection("absensiSetting")
        .document('Office')
        .get()
        .then((DocumentSnapshot ds) => ds.data);
    _absensiSetting = AbsensiSettingModel.fromMap(qSnap1, '');
    return _absensiSetting;
  }

  @override
  void initState() {
    super.initState();
    if (_isInit) {
      _isInit = false;
    }
    print('initState');
  }

  @override
  void didChangeDependencies() async {
    print('didChangeDependencies');
    super.didChangeDependencies();
    // await _getOffice();
    final AbsensiSettingModel _absensiSettingModel =
        // ModalRoute.of(context).settings.arguments;
        await _getOffice();
    if (mounted) {
      setState(() {});
    }
    if (_absensiSettingModel != null) {
      _absensiSetting = _absensiSettingModel;
    }

    _absensiSettingIdController = TextEditingController(
        text: _absensiSetting != null ? _absensiSetting.absensiSettingId : '');
    _absensiSettingOfficeLongController = TextEditingController(
        text: _absensiSetting != null
            ? _absensiSetting.absensiSettingOfficeLong
            : '');
    _absensiSettingOfficeLatController = TextEditingController(
        text: _absensiSetting != null
            ? _absensiSetting.absensiSettingOfficeLat
            : '');
    _absensiSettingOfficeWorkHourController = TextEditingController(
        text: _absensiSetting != null
            ? _absensiSetting.absensiSettingOfficeWorkHour
            : '');
    _absensiSettingHomeLatController = TextEditingController(
        text: _absensiSetting != null
            ? _absensiSetting.absensiSettingHomeLat
            : '');
    _absensiSettingSiteLongController = TextEditingController(
        text: _absensiSetting != null
            ? _absensiSetting.absensiSettingSiteLong
            : '');
    _absensiSettingSiteLatController = TextEditingController(
        text: _absensiSetting != null
            ? _absensiSetting.absensiSettingSiteLat
            : '');
    _absensiSettingOfficeRadiusController = TextEditingController(
        text: _absensiSetting != null
            ? _absensiSetting.absensiSettingOfficeRadius
            : '');
    _absensiSettingHomeRadiusController = TextEditingController(
        text: _absensiSetting != null
            ? _absensiSetting.absensiSettingHomeRadius
            : '');
    _absensiSettingSiteRadiusController = TextEditingController(
        text: _absensiSetting != null
            ? _absensiSetting.absensiSettingSiteRadius
            : '');
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
                // final appUserData =
                //     Provider.of<AppAccessLevelProvider>(context, listen: false);
                // final dbReference = Firestore.instance;

                firestoreDatabase.setAbsensiSetting(AbsensiSettingModel(
                  absensiSettingId: _absensiSetting != null
                      ? _absensiSetting.absensiSettingId
                      : 'Office',
                  absensiSettingOfficeLong:
                      _absensiSettingOfficeLongController.text,
                  absensiSettingOfficeLat:
                      _absensiSettingOfficeLatController.text,
                  absensiSettingOfficeWorkHour:
                      _absensiSettingOfficeWorkHourController.text,
                  absensiSettingHomeLat: _absensiSettingHomeLatController.text,
                  absensiSettingSiteLong:
                      _absensiSettingSiteLongController.text,
                  absensiSettingSiteLat: _absensiSettingSiteLatController.text,
                  absensiSettingOfficeRadius:
                      _absensiSettingOfficeRadiusController.text,
                  absensiSettingHomeRadius:
                      _absensiSettingHomeRadiusController.text,
                  absensiSettingSiteRadius:
                      _absensiSettingSiteRadiusController.text,
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
    _absensiSettingIdController.dispose();
    _absensiSettingOfficeLongController.dispose();
    _absensiSettingOfficeLatController.dispose();
    _absensiSettingOfficeWorkHourController.dispose();
    _absensiSettingHomeLatController.dispose();
    _absensiSettingSiteLongController.dispose();
    _absensiSettingSiteLatController.dispose();
    _absensiSettingOfficeRadiusController.dispose();
    _absensiSettingHomeRadiusController.dispose();
    _absensiSettingSiteRadiusController.dispose();

    super.dispose();
  }

  Widget _buildForm(BuildContext context) {
    // final appUserProvider =
    //     Provider.of<AppAccessLevelProvider>(context, listen: false);
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              RaisedButton(
                onPressed: () => _getOfficeLongLat(context),
                child: Text("Koordinat Kantor"),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: TextFormField(
                  controller: _absensiSettingOfficeLongController,
                  // enabled: _absensiSetting != null ? false : true,
                  // style: Theme.of(context).textTheme.body1,
                  // validator: (value) =>
                  //     value.isEmpty ? 'Nama Barang tidak boleh kosong' : null,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).iconTheme.color,
                            width: 2)),
                    labelText: 'Office Long',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: TextFormField(
                  controller: _absensiSettingOfficeLatController,
                  // enabled: _absensiSetting != null ? false : true,
                  // style: Theme.of(context).textTheme.body1,
                  // validator: (value) =>
                  //     value.isEmpty ? 'Nama Barang tidak boleh kosong' : null,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).iconTheme.color,
                            width: 2)),
                    labelText: 'Office Lat',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: TextFormField(
                  controller: _absensiSettingOfficeRadiusController,
                  // enabled: _absensiSetting != null ? false : true,
                  // style: Theme.of(context).textTheme.body1,
                  // validator: (value) =>
                  //     value.isEmpty ? 'Nama Barang tidak boleh kosong' : null,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).iconTheme.color,
                            width: 2)),
                    labelText: 'Office Radius (m)',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: TextFormField(
                  controller: _absensiSettingHomeRadiusController,
                  // enabled: _absensiSetting != null ? false : true,
                  // style: Theme.of(context).textTheme.body1,
                  // validator: (value) =>
                  //     value.isEmpty ? 'Nama Barang tidak boleh kosong' : null,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).iconTheme.color,
                            width: 2)),
                    labelText: 'Home Radius (m)',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: TextFormField(
                  controller: _absensiSettingOfficeWorkHourController,
                  // enabled: _absensiSetting != null ? false : true,
                  // style: Theme.of(context).textTheme.body1,
                  // validator: (value) =>
                  //     value.isEmpty ? 'Nama Barang tidak boleh kosong' : null,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).iconTheme.color,
                            width: 2)),
                    labelText: 'Total Jam Kerja',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _getOfficeLongLat(BuildContext context) {
    showPlatformDialog(
        context: context,
        builder: (_) => PlatformAlertDialog(
              android: (_) => MaterialAlertDialogData(
                  backgroundColor: Theme.of(context).buttonColor),
              title: Text('Mendapatkan Koordinat Kantor'),
              content: Text('Klik Proses untuk mendapatkan koordinat Kantor'),
              actions: <Widget>[
                PlatformDialogAction(
                  child: Text('Batal'),
                  onPressed: () => Navigator.pop(context),
                ),
                PlatformDialogAction(
                  child: Text('Proses'),
                  onPressed: () async {
                    final aa = await Geolocator.getCurrentPosition();
                    setState(() {
                      _absensiSettingOfficeLongController =
                          TextEditingController(text: aa.longitude.toString());
                      _absensiSettingOfficeLatController =
                          TextEditingController(text: aa.latitude.toString());
                    });
                    Navigator.pop(context);
                    // Navigator.of(context).pushNamedAndRemoveUntil(
                    //     Routes.home21, ModalRoute.withName(Routes.home21));
                  },
                )
              ],
            ));
  }
}

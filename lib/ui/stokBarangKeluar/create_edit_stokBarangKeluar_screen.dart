import 'package:flutter/material.dart';
// import 'package:hecxd/app_localizations.dart';
// import 'package:hecxd/models/todo_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hecxd/services/firestore_database.dart';
import 'package:provider/provider.dart';
import 'package:hecxd/models/stok_brg_keluar_model.dart';
import 'package:hecxd/models/stok_brg_aktif_model.dart';
import 'package:hecxd/providers/app_access_level_provider.dart';

class CreateEditStokBarangKeluarScreen extends StatefulWidget {
  @override
  _CreateEditStokBarangKeluarScreenState createState() =>
      _CreateEditStokBarangKeluarScreenState();
}

class _CreateEditStokBarangKeluarScreenState
    extends State<CreateEditStokBarangKeluarScreen> {
  //init
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  StokBarangKeluarModel _stokBarangKeluar;
  String ___uid = '';
  String ___mode = '';

  Map<String, dynamic> argUser = {};
  TextEditingController _cbxStokBarangAktifController;
  TextEditingController _namaBarangController;
  TextEditingController _jumlahController;
  TextEditingController _harga1Controller;
  TextEditingController _harga2Controller;
  TextEditingController _tanggalBeliController;
  TextEditingController _tag1Controller;
  TextEditingController _tag2Controller;
  TextEditingController _orderByUserController;
  TextEditingController _orderStatusController;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // print(ModalRoute.of(context).settings.arguments.runtimeType);
    if (ModalRoute.of(context).settings.arguments.runtimeType !=
        StokBarangKeluarModel) {
      argUser = ModalRoute.of(context).settings.arguments;
    } else {
      final StokBarangKeluarModel _stokBarangKeluarModel =
          ModalRoute.of(context).settings.arguments;
      if (_stokBarangKeluarModel != null) {
        _stokBarangKeluar = _stokBarangKeluarModel;
      }
    }
    _cbxStokBarangAktifController = TextEditingController(text: 'New');

    _namaBarangController = TextEditingController(
        text: _stokBarangKeluar != null ? _stokBarangKeluar.namaBarang : '');
    _jumlahController = TextEditingController(
        text: _stokBarangKeluar != null
            ? _stokBarangKeluar.jumlah.toString()
            : '');
    _harga1Controller = TextEditingController(
        text: _stokBarangKeluar != null
            ? _stokBarangKeluar.harga1.toStringAsFixed(0)
            : '');
    _harga2Controller = TextEditingController(
        text: _stokBarangKeluar != null
            ? _stokBarangKeluar.harga2.toStringAsFixed(0)
            : '');
    _tanggalBeliController = TextEditingController(
        text: _stokBarangKeluar != null
            ? _stokBarangKeluar.tanggalJual
            : DateTime.now().toIso8601String());
    _tag1Controller = TextEditingController(
        text: _stokBarangKeluar != null ? _stokBarangKeluar.tag1 : '');
    _tag2Controller = TextEditingController(
        text: _stokBarangKeluar != null ? _stokBarangKeluar.tag2 : '');
    _orderByUserController = TextEditingController(
        text: _stokBarangKeluar != null ? _stokBarangKeluar.orderByUser : '');
    _orderStatusController = TextEditingController(
        text: _stokBarangKeluar != null ? _stokBarangKeluar.orderStatus : '');
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
        title: Text('Form Pemesanan'),
        actions: <Widget>[
          _stokBarangKeluar != null
              ? Container()
              : FlatButton(
                  child: Text("Simpan"),
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      FocusScope.of(context).unfocus();
                      final firestoreDatabase = Provider.of<FirestoreDatabase>(
                          context,
                          listen: false);
                      if (argUser['status'] == 'permintaan diproses') {
                        firestoreDatabase
                            .setStokBarangKeluar(StokBarangKeluarModel(
                          id: _stokBarangKeluar != null
                              ? _stokBarangKeluar.id
                              : documentIdFromCurrentDate(),
                          uidBarang: ___uid,
                          namaBarang: _namaBarangController.text,
                          jumlah: int.tryParse(_jumlahController.text),
                          harga1: double.tryParse(_harga1Controller.text),
                          harga2: double.tryParse(_harga1Controller.text),
                          tanggalJual: _tanggalBeliController.text,
                          tag1: 'tag1',
                          tag2: 'tag2',
                          orderByUser: argUser['userUid'],
                          orderStatus: argUser['status'],
                        ));

                        // notif gudang
                        print('notif gudang ada request');
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
    _cbxStokBarangAktifController.dispose();
    _namaBarangController.dispose();
    _jumlahController.dispose();
    _harga1Controller.dispose();
    _harga2Controller.dispose();
    _tanggalBeliController.dispose();
    _tag1Controller.dispose();
    _tag2Controller.dispose();
    _orderByUserController.dispose();
    _orderStatusController.dispose();

    super.dispose();
  }

  Widget _buildForm(BuildContext context) {
    final appAccessLevelProvider =
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
              _stokBarangKeluar != null
                  ? Container()
                  : _cbxstokBarangAktif(context),
              if (_stokBarangKeluar == null)
                Text(
                  'Pilih barang yang di pesan',
                  style: Theme.of(context).textTheme.caption,
                ),
              if (_stokBarangKeluar != null &&
                  (appAccessLevelProvider.appxUserRole == 'App Gudang' ||
                      appAccessLevelProvider.appxUserRole == 'App Debug'))
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        FlatButton(
                          onPressed: () async {
                            final firestoreDatabase =
                                Provider.of<FirestoreDatabase>(context,
                                    listen: false);
                            await _updateStok(
                              firestoreDatabase,
                              int.tryParse(_jumlahController.text),
                              'permintaan disetujui',
                              _stokBarangKeluar.id,
                              _stokBarangKeluar.uidBarang,
                            );
                            Navigator.of(context).pop();
                          },
                          child: Text('Setuju'),
                          color: Theme.of(context).primaryColor,
                        ),
                        FlatButton(
                          onPressed: () async {
                            final firestoreDatabase =
                                Provider.of<FirestoreDatabase>(context,
                                    listen: false);
                            await _updateStok(
                              firestoreDatabase,
                              int.tryParse(_jumlahController.text),
                              'permintaan ditolak',
                              _stokBarangKeluar.id,
                              _stokBarangKeluar.uidBarang,
                            );
                            Navigator.of(context).pop();
                          },
                          child: Text('Tolak'),
                          // color: Theme.of(context).,
                        ),
                      ],
                    )),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: TextFormField(
                  controller: _namaBarangController,
                  enabled: false,
                  // style: Theme.of(context).textTheme.body1,
                  // validator: (value) =>
                  //     value.isEmpty ? 'Nama Barang tidak boleh kosong' : null,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).iconTheme.color,
                            width: 2)),
                    labelText: 'Nama Barang',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: TextFormField(
                  controller: _jumlahController,
                  enabled: _stokBarangKeluar != null ||
                          ___mode == '' ||
                          ___mode == 'add'
                      ? false
                      : true,
                  // style: Theme.of(context).textTheme.body1,
                  validator: (value) =>
                      value.isEmpty ? 'Jumlah Barang tidak boleh kosong' : null,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).iconTheme.color,
                            width: 2)),
                    labelText: 'Jumlah Barang',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: TextFormField(
                  controller: _tanggalBeliController,
                  enabled: false,
                  // style: Theme.of(context).textTheme.body1,
                  // validator: (value) => value.isEmpty
                  //     ? 'Jumlah Barang tidak boleh kosong'
                  //     : null,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).iconTheme.color,
                            width: 2)),
                    labelText: 'Tanggal Beli Barang',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: TextFormField(
                  controller: _orderStatusController,
                  enabled: false,
                  // style: Theme.of(context).textTheme.body1,
                  // validator: (value) =>
                  //     value.isEmpty ? 'Nama Barang tidak boleh kosong' : null,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).iconTheme.color,
                            width: 2)),
                    labelText: 'Status',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _cbxstokBarangAktif(BuildContext context) {
    final firestoreDatabase =
        Provider.of<FirestoreDatabase>(context, listen: false);

    return StreamBuilder(
      stream: firestoreDatabase.stokBarangAktifsStream(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<StokBarangAktifModel> stokBarangAktif = snapshot.data;
          if (stokBarangAktif.isNotEmpty) {
            final aa = <String>['New'];
            stokBarangAktif.forEach((element) {
              aa.add(element.namaBarang);
            });
            // print(aa);
            return DropdownButton<String>(
              value: _cbxStokBarangAktifController.text,
              onChanged: (String newValue) async {
                if (newValue != null) {
                  Map<String, dynamic> data1 = {};
                  final qSnap1 = await Firestore.instance
                      .collection('stokBarangAktifs')
                      .where('namaBarang', isEqualTo: newValue)
                      .getDocuments();
                  for (DocumentSnapshot ds in qSnap1.documents) {
                    data1 = ds.data;
                  }
                  _namaBarangController.text =
                      newValue != 'New' ? data1['namaBarang'] : '';
                  _jumlahController.text = '';
                  _harga1Controller.text = newValue != 'New'
                      ? data1['harga1'].toStringAsFixed(0)
                      : '';
                  _tanggalBeliController.text =
                      DateTime.now().toIso8601String();

                  setState(() {
                    _cbxStokBarangAktifController.text = newValue;
                    ___uid = data1['uidBarang'];
                    ___mode = newValue != 'New' ? 'update' : 'add';
                  });
                  // print(___uid);
                }
              },
              items: aa.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            );
          }
        }
        // return Center(child: CircularProgressIndicator());
        return Center(child: Container());
      },
    );
  }

  Future<void> _updateStok(
    FirestoreDatabase firestoreDatabase,
    int jumlah,
    String statusPermintaan,
    String idStokBarangKeluar,
    String uidBarangKeluar,
  ) async {
    if (___mode == '') {
      final dbReference = Firestore.instance;
      // status approve, kurangi stok, update status pemesanan
      if (statusPermintaan == 'permintaan disetujui') {
        Map<String, dynamic> data1 = {};
        final qSnap1 = await dbReference
            .collection("stokBarangAktifs")
            .where('uidBarang', isEqualTo: uidBarangKeluar)
            .getDocuments();
        for (DocumentSnapshot ds in qSnap1.documents) {
          data1 = ds.data;
        }
        dbReference
            .collection('stokBarangAktifs')
            .document(uidBarangKeluar)
            .updateData(
          {
            'jumlah': data1['jumlah'] - jumlah,
          },
        );
      }
      // update status pemesanan
      dbReference
          .collection('stokBarangKeluars')
          .document(idStokBarangKeluar)
          .updateData(
        {
          'orderStatus': statusPermintaan,
        },
      );
    }
  }
}

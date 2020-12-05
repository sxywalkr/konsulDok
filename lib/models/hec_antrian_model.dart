class HecAntrianModel {
  String hecAntrianId;
  String appUserUid;
  String hecAntrianTglAntri;
  String hecAntrianNomorAntri;
  String hecAntrianStatusAntri;

  HecAntrianModel({
    this.hecAntrianId,
    this.appUserUid,
    this.hecAntrianTglAntri,
    this.hecAntrianNomorAntri,
    this.hecAntrianStatusAntri,
  });

  factory HecAntrianModel.fromMap(
      Map<String, dynamic> data, String documentId) {
    if (data == null) {
      return null;
    }

    String hecAntrianId = data['hecAntrianId'];
    String appUserUid = data['appUserUid'];
    String hecAntrianTglAntri = data['hecAntrianTglAntri'];
    String hecAntrianNomorAntri = data['hecAntrianNomorAntri'];
    String hecAntrianStatusAntri = data['hecAntrianStatusAntri'];

    return HecAntrianModel(
      hecAntrianId: hecAntrianId,
      appUserUid: appUserUid,
      hecAntrianTglAntri: hecAntrianTglAntri,
      hecAntrianNomorAntri: hecAntrianNomorAntri,
      hecAntrianStatusAntri: hecAntrianStatusAntri,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'hecAntrianId': hecAntrianId,
      'appUserUid': appUserUid,
      'hecAntrianTglAntri': hecAntrianTglAntri,
      'hecAntrianNomorAntri': hecAntrianNomorAntri,
      'hecAntrianStatusAntri': hecAntrianStatusAntri,
    };
  }
}

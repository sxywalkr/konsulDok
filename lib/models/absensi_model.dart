class AbsensiModel {
  String absensiId;
  String appUserUid;
  String absensiWaktuDatang;
  String absensiWaktuPulang;
  String absensiLong;
  String absensiLat;
  String absensiStatus;

  AbsensiModel({
    this.absensiId,
    this.appUserUid,
    this.absensiWaktuDatang,
    this.absensiWaktuPulang,
    this.absensiLong,
    this.absensiLat,
    this.absensiStatus,
  });

  factory AbsensiModel.fromMap(Map<String, dynamic> data, String documentId) {
    if (data == null) {
      return null;
    }

    String absensiId = data['absensiId'];
    String appUserUid = data['appUserUid'];
    String absensiWaktuDatang = data['absensiWaktuDatang'];
    String absensiWaktuPulang = data['absensiWaktuPulang'];
    String absensiLong = data['absensiLong'];
    String absensiLat = data['absensiLat'];
    String absensiStatus = data['absensiStatus'];

    return AbsensiModel(
      absensiId: absensiId,
      appUserUid: appUserUid,
      absensiWaktuDatang: absensiWaktuDatang,
      absensiWaktuPulang: absensiWaktuPulang,
      absensiLong: absensiLong,
      absensiLat: absensiLat,
      absensiStatus: absensiStatus,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'absensiId': absensiId,
      'appUserUid': appUserUid,
      'absensiWaktuDatang': absensiWaktuDatang,
      'absensiWaktuPulang': absensiWaktuPulang,
      'absensiLong': absensiLong,
      'absensiLat': absensiLat,
      'absensiStatus': absensiStatus,
    };
  }
}

class AbsensiSettingModel {
  String absensiSettingId;
  String absensiSettingOfficeLong;
  String absensiSettingOfficeLat;
  String absensiSettingOfficeWorkHour;
  String absensiSettingHomeLat;
  String absensiSettingSiteLong;
  String absensiSettingSiteLat;
  String absensiSettingOfficeRadius;
  String absensiSettingHomeRadius;
  String absensiSettingSiteRadius;

  AbsensiSettingModel({
    this.absensiSettingId,
    this.absensiSettingOfficeLong,
    this.absensiSettingOfficeLat,
    this.absensiSettingOfficeWorkHour,
    this.absensiSettingHomeLat,
    this.absensiSettingSiteLong,
    this.absensiSettingSiteLat,
    this.absensiSettingOfficeRadius,
    this.absensiSettingHomeRadius,
    this.absensiSettingSiteRadius,
  });

  factory AbsensiSettingModel.fromMap(
      Map<String, dynamic> data, String documentId) {
    if (data == null) {
      return null;
    }

    String absensiSettingId = data['absensiSettingId'];
    String absensiSettingOfficeLong = data['absensiSettingOfficeLong'];
    String absensiSettingOfficeLat = data['absensiSettingOfficeLat'];
    String absensiSettingOfficeWorkHour = data['absensiSettingOfficeWorkHour'];
    String absensiSettingHomeLat = data['absensiSettingHomeLat'];
    String absensiSettingSiteLong = data['absensiSettingSiteLong'];
    String absensiSettingSiteLat = data['absensiSettingSiteLat'];
    String absensiSettingOfficeRadius = data['absensiSettingOfficeRadius'];
    String absensiSettingHomeRadius = data['absensiSettingHomeRadius'];
    String absensiSettingSiteRadius = data['absensiSettingSiteRadius'];

    return AbsensiSettingModel(
      absensiSettingId: absensiSettingId,
      absensiSettingOfficeLong: absensiSettingOfficeLong,
      absensiSettingOfficeLat: absensiSettingOfficeLat,
      absensiSettingOfficeWorkHour: absensiSettingOfficeWorkHour,
      absensiSettingHomeLat: absensiSettingHomeLat,
      absensiSettingSiteLong: absensiSettingSiteLong,
      absensiSettingSiteLat: absensiSettingSiteLat,
      absensiSettingOfficeRadius: absensiSettingOfficeRadius,
      absensiSettingHomeRadius: absensiSettingHomeRadius,
      absensiSettingSiteRadius: absensiSettingSiteRadius,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'absensiSettingId': absensiSettingId,
      'absensiSettingOfficeLong': absensiSettingOfficeLong,
      'absensiSettingOfficeLat': absensiSettingOfficeLat,
      'absensiSettingOfficeWorkHour': absensiSettingOfficeWorkHour,
      'absensiSettingHomeLat': absensiSettingHomeLat,
      'absensiSettingSiteLong': absensiSettingSiteLong,
      'absensiSettingSiteLat': absensiSettingSiteLat,
      'absensiSettingOfficeRadius': absensiSettingOfficeRadius,
      'absensiSettingHomeRadius': absensiSettingHomeRadius,
      'absensiSettingSiteRadius': absensiSettingSiteRadius,
    };
  }
}

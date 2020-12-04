class AppUserModel {
  String appUserUid;
  String appUserEmail;
  String appUserRole;
  String appUserFcmId;
  String appUserDisplayName;
  String appUserNoRmHec;
  String appUserNoKtp;
  String appUserNoBpjs;
  String appUserNoHape;
  String appUserGender;
  String appUserAlamat;
  String appUserTglLahir;
  String appUserStatusRm; // Bpjs atau Umum
  String appUserFlagActivity;
  String appUserTglAntri;
  String appUserNoAntri;

  AppUserModel({
    this.appUserUid,
    this.appUserEmail,
    this.appUserRole,
    this.appUserFcmId,
    this.appUserDisplayName,
    this.appUserNoRmHec,
    this.appUserNoKtp,
    this.appUserNoBpjs,
    this.appUserNoHape,
    this.appUserGender,
    this.appUserAlamat,
    this.appUserTglLahir,
    this.appUserStatusRm,
    this.appUserFlagActivity,
    this.appUserTglAntri,
    this.appUserNoAntri,
  });

  AppUserModel.fromJson(Map<String, dynamic> parsedJSON)
      : appUserUid = parsedJSON['appUserUid'],
        appUserEmail = parsedJSON['appUserEmail'],
        appUserRole = parsedJSON['appUserRole'],
        appUserFcmId = parsedJSON['appUserFcmId'],
        appUserDisplayName = parsedJSON['appUserDisplayName'],
        appUserNoRmHec = parsedJSON['appUserNoRmHec'],
        appUserNoKtp = parsedJSON['appUserNoKtp'],
        appUserNoBpjs = parsedJSON['appUserNoBpjs'],
        appUserNoHape = parsedJSON['appUserNoHape'],
        appUserGender = parsedJSON['appUserGender'],
        appUserAlamat = parsedJSON['appUserAlamat'],
        appUserTglLahir = parsedJSON['appUserTglLahir'],
        appUserStatusRm = parsedJSON['appUserStatusRm'],
        appUserFlagActivity = parsedJSON['appUserFlagActivity'],
        appUserTglAntri = parsedJSON['appUserTglAntri'],
        appUserNoAntri = parsedJSON['appUserNoAntri'];

  factory AppUserModel.fromMap(Map<String, dynamic> data, String documentId) {
    if (data == null) {
      return null;
    }

    String appUserUid = data['appUserUid'];
    String appUserEmail = data['appUserEmail'];
    String appUserRole = data['appUserRole'];
    String appUserFcmId = data['appUserFcmId'];
    String appUserDisplayName = data['appUserDisplayName'];
    String appUserNoRmHec = data['appUserNoRmHec'];
    String appUserNoKtp = data['appUserNoKtp'];
    String appUserNoBpjs = data['appUserNoBpjs'];
    String appUserNoHape = data['appUserNoHape'];
    String appUserGender = data['appUserGender'];
    String appUserAlamat = data['appUserAlamat'];
    String appUserTglLahir = data['appUserTglLahir'];
    String appUserStatusRm = data['appUserStatusRm'];
    String appUserFlagActivity = data['appUserFlagActivity'];
    String appUserTglAntri = data['appUserTglAntri'];
    String appUserNoAntri = data['appUserNoAntri'];

    return AppUserModel(
      appUserUid: appUserUid,
      appUserEmail: appUserEmail,
      appUserRole: appUserRole,
      appUserFcmId: appUserFcmId,
      appUserDisplayName: appUserDisplayName,
      appUserNoRmHec: appUserNoRmHec,
      appUserNoKtp: appUserNoKtp,
      appUserNoBpjs: appUserNoBpjs,
      appUserNoHape: appUserNoHape,
      appUserGender: appUserGender,
      appUserAlamat: appUserAlamat,
      appUserTglLahir: appUserTglLahir,
      appUserStatusRm: appUserStatusRm,
      appUserFlagActivity: appUserFlagActivity,
      appUserTglAntri: appUserTglAntri,
      appUserNoAntri: appUserNoAntri,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'appUserUid': appUserUid,
      'appUserEmail': appUserEmail,
      'appUserRole': appUserRole,
      'appUserFcmId': appUserFcmId,
      'appUserDisplayName': appUserDisplayName,
      'appUserNoRmHec': appUserNoRmHec,
      'appUserNoKtp': appUserNoKtp,
      'appUserNoBpjs': appUserNoBpjs,
      'appUserNoHape': appUserNoHape,
      'appUserGender': appUserGender,
      'appUserAlamat': appUserAlamat,
      'appUserTglLahir': appUserTglLahir,
      'appUserStatusRm': appUserStatusRm,
      'appUserFlagActivity': appUserFlagActivity,
      'appUserTglAntri': appUserTglAntri,
      'appUserNoAntri': appUserNoAntri,
    };
  }
}

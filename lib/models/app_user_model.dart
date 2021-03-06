class AppUserModel {
  String appUserUid;
  String appUserEmail;
  String appUserRole;
  String appUserFcmId;
  String appUserDisplayName;
  String appUserNoHape;
  String appUserGender;
  String appUserAlamat;
  String appUserFlagActivity;
  String appUserTotalJamKerja;
  String appUserPhotoUrl;

  AppUserModel({
    this.appUserUid,
    this.appUserEmail,
    this.appUserRole,
    this.appUserFcmId,
    this.appUserDisplayName,
    this.appUserNoHape,
    this.appUserGender,
    this.appUserAlamat,
    this.appUserFlagActivity,
    this.appUserTotalJamKerja,
    this.appUserPhotoUrl,
  });

  AppUserModel.fromJson(Map<String, dynamic> parsedJSON)
      : appUserUid = parsedJSON['appUserUid'],
        appUserEmail = parsedJSON['appUserEmail'],
        appUserRole = parsedJSON['appUserRole'],
        appUserFcmId = parsedJSON['appUserFcmId'],
        appUserDisplayName = parsedJSON['appUserDisplayName'],
        appUserNoHape = parsedJSON['appUserNoHape'],
        appUserGender = parsedJSON['appUserGender'],
        appUserAlamat = parsedJSON['appUserAlamat'],
        appUserFlagActivity = parsedJSON['appUserFlagActivity'],
        appUserTotalJamKerja = parsedJSON['appUserTotalJamKerja'],
        appUserPhotoUrl = parsedJSON['appUserPhotoUrl'];

  factory AppUserModel.fromMap(Map<String, dynamic> data, String documentId) {
    if (data == null) {
      return null;
    }

    String appUserUid = data['appUserUid'];
    String appUserEmail = data['appUserEmail'];
    String appUserRole = data['appUserRole'];
    String appUserFcmId = data['appUserFcmId'];
    String appUserDisplayName = data['appUserDisplayName'];
    String appUserNoHape = data['appUserNoHape'];
    String appUserGender = data['appUserGender'];
    String appUserAlamat = data['appUserAlamat'];
    String appUserFlagActivity = data['appUserFlagActivity'];
    String appUserTotalJamKerja = data['appUserTotalJamKerja'];
    String appUserPhotoUrl = data['appUserPhotoUrl'];

    return AppUserModel(
      appUserUid: appUserUid,
      appUserEmail: appUserEmail,
      appUserRole: appUserRole,
      appUserFcmId: appUserFcmId,
      appUserDisplayName: appUserDisplayName,
      appUserNoHape: appUserNoHape,
      appUserGender: appUserGender,
      appUserAlamat: appUserAlamat,
      appUserFlagActivity: appUserFlagActivity,
      appUserTotalJamKerja: appUserTotalJamKerja,
      appUserPhotoUrl: appUserPhotoUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'appUserUid': appUserUid,
      'appUserEmail': appUserEmail,
      'appUserRole': appUserRole,
      'appUserFcmId': appUserFcmId,
      'appUserDisplayName': appUserDisplayName,
      'appUserNoHape': appUserNoHape,
      'appUserGender': appUserGender,
      'appUserAlamat': appUserAlamat,
      'appUserFlagActivity': appUserFlagActivity,
      'appUserTotalJamKerja': appUserTotalJamKerja,
      'appUserPhotoUrl': appUserPhotoUrl,
    };
  }
}

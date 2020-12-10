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
        appUserFlagActivity = parsedJSON['appUserFlagActivity'];

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
    };
  }
}

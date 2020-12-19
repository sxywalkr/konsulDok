class ProjectModel {
  String projectId;
  String appUserUid;
  String projectName;
  String projectTglDeadline;
  String projectTglStart;
  String projectPersenActivity;
  String projectFungsi;
  String projectStatus;
  String projectLuasLahan;
  String projectJumlahLantai;
  String projectLuasLantai1;
  String projectLuasLantai2;
  String projectLuasLantai3;
  String projectLuasLantai4;
  String projectLuasLantai5;
  String projectLuasLantai6;
  String projectLuasLantai7;
  String projectLuasLantai8;
  String projectLuasLantai9;
  String projectLuasLantai10;
  String projectLuasLantai11;
  String projectLuasLantai12;
  String projectLuasLantai13;
  String projectLuasLantai14;
  String projectLuasLantai15;
  String projectLuasBangunan;

  ProjectModel({
    this.projectId,
    this.appUserUid,
    this.projectName,
    this.projectTglDeadline,
    this.projectTglStart,
    this.projectPersenActivity,
    this.projectFungsi,
    this.projectStatus,
    this.projectLuasLahan,
    this.projectJumlahLantai,
    this.projectLuasLantai1,
    this.projectLuasLantai2,
    this.projectLuasLantai3,
    this.projectLuasLantai4,
    this.projectLuasLantai5,
    this.projectLuasLantai6,
    this.projectLuasLantai7,
    this.projectLuasLantai8,
    this.projectLuasLantai9,
    this.projectLuasLantai10,
    this.projectLuasLantai11,
    this.projectLuasLantai12,
    this.projectLuasLantai13,
    this.projectLuasLantai14,
    this.projectLuasLantai15,
    this.projectLuasBangunan,
  });

  factory ProjectModel.fromMap(Map<String, dynamic> data, String documentId) {
    if (data == null) {
      return null;
    }

    String projectId = data['projectId'];
    String appUserUid = data['appUserUid'];
    String projectName = data['projectName'];
    String projectTglDeadline = data['projectTglDeadline'];
    String projectTglStart = data['projectTglStart'];
    String projectPersenActivity = data['projectPersenActivity'];
    String projectFungsi = data['projectFungsi'];
    String projectStatus = data['projectStatus'];
    String projectLuasLahan = data['projectLuasLahan'];
    String projectJumlahLantai = data['projectJumlahLantai'];
    String projectLuasLantai1 = data['projectLuasLantai1'];
    String projectLuasLantai2 = data['projectLuasLantai2'];
    String projectLuasLantai3 = data['projectLuasLantai3'];
    String projectLuasLantai4 = data['projectLuasLantai4'];
    String projectLuasLantai5 = data['projectLuasLantai5'];
    String projectLuasLantai6 = data['projectLuasLantai6'];
    String projectLuasLantai7 = data['projectLuasLantai7'];
    String projectLuasLantai8 = data['projectLuasLantai8'];
    String projectLuasLantai9 = data['projectLuasLantai9'];
    String projectLuasLantai10 = data['projectLuasLantai10'];
    String projectLuasLantai11 = data['projectLuasLantai11'];
    String projectLuasLantai12 = data['projectLuasLantai12'];
    String projectLuasLantai13 = data['projectLuasLantai13'];
    String projectLuasLantai14 = data['projectLuasLantai14'];
    String projectLuasLantai15 = data['projectLuasLantai15'];
    String projectLuasBangunan = data['projectLuasBangunan'];

    return ProjectModel(
      projectId: projectId,
      appUserUid: appUserUid,
      projectName: projectName,
      projectTglDeadline: projectTglDeadline,
      projectTglStart: projectTglStart,
      projectPersenActivity: projectPersenActivity,
      projectFungsi: projectFungsi,
      projectStatus: projectStatus,
      projectLuasLahan: projectLuasLahan,
      projectJumlahLantai: projectJumlahLantai,
      projectLuasLantai1: projectLuasLantai1,
      projectLuasLantai2: projectLuasLantai2,
      projectLuasLantai3: projectLuasLantai3,
      projectLuasLantai4: projectLuasLantai4,
      projectLuasLantai5: projectLuasLantai5,
      projectLuasLantai6: projectLuasLantai6,
      projectLuasLantai7: projectLuasLantai7,
      projectLuasLantai8: projectLuasLantai8,
      projectLuasLantai9: projectLuasLantai9,
      projectLuasLantai10: projectLuasLantai10,
      projectLuasLantai11: projectLuasLantai11,
      projectLuasLantai12: projectLuasLantai12,
      projectLuasLantai13: projectLuasLantai13,
      projectLuasLantai14: projectLuasLantai14,
      projectLuasLantai15: projectLuasLantai15,
      projectLuasBangunan: projectLuasBangunan,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'projectId': projectId,
      'appUserUid': appUserUid,
      'projectName': projectName,
      'projectTglDeadline': projectTglDeadline,
      'projectTglStart': projectTglStart,
      'projectPersenActivity': projectPersenActivity,
      'projectFungsi': projectFungsi,
      'projectStatus': projectStatus,
      'projectLuasLahan': projectLuasLahan,
      'projectJumlahLantai': projectJumlahLantai,
      'projectLuasLantai1': projectLuasLantai1,
      'projectLuasLantai2': projectLuasLantai2,
      'projectLuasLantai3': projectLuasLantai3,
      'projectLuasLantai4': projectLuasLantai4,
      'projectLuasLantai5': projectLuasLantai5,
      'projectLuasLantai6': projectLuasLantai6,
      'projectLuasLantai7': projectLuasLantai7,
      'projectLuasLantai8': projectLuasLantai8,
      'projectLuasLantai9': projectLuasLantai9,
      'projectLuasLantai10': projectLuasLantai10,
      'projectLuasLantai11': projectLuasLantai11,
      'projectLuasLantai12': projectLuasLantai12,
      'projectLuasLantai13': projectLuasLantai13,
      'projectLuasLantai14': projectLuasLantai14,
      'projectLuasLantai15': projectLuasLantai15,
      'projectLuasBangunan': projectLuasBangunan,
    };
  }
}

class ProjectModel {
  String projectId;
  String appUserUid;
  String projectName;
  String projectTglDeadline;
  String projectTglStart;
  String projectPersenActivity;
  String projectDescription;
  String projectStatus;

  ProjectModel({
    this.projectId,
    this.appUserUid,
    this.projectName,
    this.projectTglDeadline,
    this.projectTglStart,
    this.projectPersenActivity,
    this.projectDescription,
    this.projectStatus,
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
    String projectDescription = data['projectDescription'];
    String projectStatus = data['projectStatus'];

    return ProjectModel(
      projectId: projectId,
      appUserUid: appUserUid,
      projectName: projectName,
      projectTglDeadline: projectTglDeadline,
      projectTglStart: projectTglStart,
      projectPersenActivity: projectPersenActivity,
      projectDescription: projectDescription,
      projectStatus: projectStatus,
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
      'projectDescription': projectDescription,
      'projectStatus': projectStatus,
    };
  }
}

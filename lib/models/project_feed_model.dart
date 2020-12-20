class ProjectFeedModel {
  String projectFeedId;
  String appUserUid;
  String appUserDisplayName;
  String projectId;
  String projectName;
  String projectFeedMainTask;
  String projectFeedPersentase;
  String projectFeedActivityDescription;
  String projectFeedDateSubmit;
  String projectFeedDateApproval;
  String projectFeedStatus;
  String projectFeedPersentaseApproval;
  String projectFeedActivityDescriptionApproval;

  ProjectFeedModel({
    this.projectFeedId,
    this.appUserUid,
    this.appUserDisplayName,
    this.projectId,
    this.projectName,
    this.projectFeedMainTask,
    this.projectFeedPersentase,
    this.projectFeedActivityDescription,
    this.projectFeedDateSubmit,
    this.projectFeedDateApproval,
    this.projectFeedStatus,
    this.projectFeedPersentaseApproval,
    this.projectFeedActivityDescriptionApproval,
  });

  factory ProjectFeedModel.fromMap(
      Map<String, dynamic> data, String documentId) {
    if (data == null) {
      return null;
    }

    String projectFeedId = data['projectFeedId'];
    String appUserUid = data['appUserUid'];
    String appUserDisplayName = data['appUserDisplayName'];
    String projectId = data['projectId'];
    String projectName = data['projectName'];
    String projectFeedMainTask = data['projectFeedMainTask'];
    String projectFeedPersentase = data['projectFeedPersentase'];
    String projectFeedActivityDescription =
        data['projectFeedActivityDescription'];
    String projectFeedDateSubmit = data['projectFeedDateSubmit'];
    String projectFeedDateApproval = data['projectFeedDateApproval'];
    String projectFeedStatus = data['projectFeedStatus'];
    String projectFeedPersentaseApproval =
        data['projectFeedPersentaseApproval'];
    String projectFeedActivityDescriptionApproval =
        data['projectFeedActivityDescriptionApproval'];

    return ProjectFeedModel(
      projectFeedId: projectFeedId,
      appUserUid: appUserUid,
      appUserDisplayName: appUserDisplayName,
      projectId: projectId,
      projectName: projectName,
      projectFeedMainTask: projectFeedMainTask,
      projectFeedPersentase: projectFeedPersentase,
      projectFeedActivityDescription: projectFeedActivityDescription,
      projectFeedDateSubmit: projectFeedDateSubmit,
      projectFeedDateApproval: projectFeedDateApproval,
      projectFeedStatus: projectFeedStatus,
      projectFeedPersentaseApproval: projectFeedPersentaseApproval,
      projectFeedActivityDescriptionApproval:
          projectFeedActivityDescriptionApproval,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'projectFeedId': projectFeedId,
      'appUserUid': appUserUid,
      'appUserDisplayName': appUserDisplayName,
      'projectId': projectId,
      'projectName': projectName,
      'projectFeedMainTask': projectFeedMainTask,
      'projectFeedPersentase': projectFeedPersentase,
      'projectFeedActivityDescription': projectFeedActivityDescription,
      'projectFeedDateSubmit': projectFeedDateSubmit,
      'projectFeedDateApproval': projectFeedDateApproval,
      'projectFeedStatus': projectFeedStatus,
      'projectFeedPersentaseApproval': projectFeedPersentaseApproval,
      'projectFeedActivityDescriptionApproval':
          projectFeedActivityDescriptionApproval,
    };
  }
}

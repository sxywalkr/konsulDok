/*
This class defines all the possible read/write locations from the Firestore database.
In future, any new path can be added here.
This class work together with FirestoreService and FirestoreDatabase.
 */

class FirestorePath {
  static String todo(String uid, String todoId) => 'users/$uid/todos/$todoId';
  static String todos(String uid) => 'users/$uid/todos';

  static String appUser(String uid, String itemId) => 'appUsers/$itemId';
  static String appUsers(String uid) => 'appUsers';

  static String absensi(String itemId) => 'absensi/$itemId';
  static String absensis() => 'absensi';

  static String project(String itemId) => 'project/$itemId';
  static String projects() => 'project';

  static String projectFeed(String itemId) => 'projectFeed/$itemId';
  static String projectFeeds() => 'projectFeed';

  static String absensiSetting(String itemId) => 'absensiSetting/$itemId';
  static String absensiSettings() => 'absensiSetting';
}

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:taskmon/models/todo_model.dart';
import 'package:taskmon/services/firestore_path.dart';
import 'package:taskmon/services/firestore_service.dart';
import 'package:uuid/uuid.dart';
import 'package:taskmon/models/app_user_model.dart';
import 'package:taskmon/models/hec_antrian_model.dart';
import 'package:taskmon/models/absensi_model.dart';
import 'package:taskmon/models/project_model.dart';

String documentIdFromCurrentDate() => DateTime.now().toIso8601String();
String generateUid() => Uuid().v4();

/*
This is the main class access/call for any UI widgets that require to perform
any CRUD activities operation in Firestore database.
This class work hand-in-hand with FirestoreService and FirestorePath.

Notes:
For cases where you need to have a special method such as bulk update specifically
on a field, then is ok to use custom code and write it here. For example,
setAllTodoComplete is require to change all todos item to have the complete status
changed to true.

 */
class FirestoreDatabase {
  FirestoreDatabase({@required this.uid}) : assert(uid != null);
  final String uid;

  final _firestoreService = FirestoreService.instance;

  // String _appUserRole;
  // final dbReference = Firestore.instance;
  String get appxUserUid {
    return uid;
  }

  // String get appxUserRole {
  //   return _appUserRole;
  // }

  // Future<void> getRole() async {
  //   Map<String, dynamic> data1 = {};
  //   final qSnap1 = await dbReference
  //       .collection("appUsers")
  //       .where('appUserUid', isEqualTo: uid)
  //       .getDocuments();
  //   for (DocumentSnapshot ds in qSnap1.documents) {
  //     data1 = ds.data;
  //   }
  //   print('get role');
  //   _appUserRole = data1['appRole'];
  //   // notifyListeners();
  // }

  //Method to create/update todoModel
  Future<void> setTodo(TodoModel todo) async => await _firestoreService.setData(
        path: FirestorePath.todo(uid, todo.id),
        data: todo.toMap(),
      );

  //Method to delete todoModel entry
  Future<void> deleteTodo(TodoModel todo) async {
    await _firestoreService.deleteData(path: FirestorePath.todo(uid, todo.id));
  }

  //Method to retrieve todoModel object based on the given todoId
  Stream<TodoModel> todoStream({@required String todoId}) =>
      _firestoreService.documentStream(
        path: FirestorePath.todo(uid, todoId),
        builder: (data, documentId) => TodoModel.fromMap(data, documentId),
      );

  //Method to retrieve all todos item from the same user based on uid
  Stream<List<TodoModel>> todosStream() => _firestoreService.collectionStream(
        path: FirestorePath.todos(uid),
        builder: (data, documentId) => TodoModel.fromMap(data, documentId),
      );

  //Method to mark all todoModel to be complete
  Future<void> setAllTodoComplete() async {
    final batchUpdate = Firestore.instance.batch();

    final querySnapshot = await Firestore.instance
        .collection(FirestorePath.todos(uid))
        .getDocuments();

    for (DocumentSnapshot ds in querySnapshot.documents) {
      batchUpdate.updateData(ds.reference, {'complete': true});
    }
    await batchUpdate.commit();
  }

  Future<void> deleteAllTodoWithComplete() async {
    final batchDelete = Firestore.instance.batch();

    final querySnapshot = await Firestore.instance
        .collection(FirestorePath.todos(uid))
        .where('complete', isEqualTo: true)
        .getDocuments();

    for (DocumentSnapshot ds in querySnapshot.documents) {
      batchDelete.delete(ds.reference);
    }
    await batchDelete.commit();
  }

  // appUsers
  //Method to create/update appUserModel
  Future<void> setAppUser(AppUserModel appUser) async =>
      await _firestoreService.setData(
        path: FirestorePath.appUser(uid, appUser.appUserUid),
        data: appUser.toMap(),
      );

  //Method to delete appUserModel entry
  Future<void> deleteAppUser(AppUserModel appUser) async {
    await _firestoreService.deleteData(
        path: FirestorePath.appUser(uid, appUser.appUserUid));
  }

  //Method to retrieve AppUserModel object based on the given appUserId
  Stream<AppUserModel> appUserStream({@required String appUserId}) =>
      _firestoreService.documentStream(
        path: FirestorePath.appUser(uid, appUserId),
        builder: (data, documentId) => AppUserModel.fromMap(data, documentId),
      );

  //Method to retrieve all appUsers item from the same user based on uid
  Stream<List<AppUserModel>> appUsersStream() =>
      _firestoreService.collectionStream(
        path: FirestorePath.appUsers(uid),
        builder: (data, documentId) => AppUserModel.fromMap(data, documentId),
      );

  // hecAntrians
  //Method to create/update all HecAntrianModel
  Future<void> setHecAntrian(HecAntrianModel hecAntrian) async =>
      await _firestoreService.setData(
        path: FirestorePath.hecAntrian(hecAntrian.hecAntrianId),
        data: hecAntrian.toMap(),
      );

  //Method to update partial HecAntrianModel
  Future<void> updateHecAntrian(HecAntrianModel hecAntrian) async =>
      await _firestoreService.updateData(
        path: FirestorePath.hecAntrian(hecAntrian.hecAntrianId),
        data: hecAntrian.toMap(),
      );

  //Method to delete HecAntrianModel entry
  Future<void> deleteHecAntrian(HecAntrianModel hecAntrian) async {
    await _firestoreService.deleteData(
        path: FirestorePath.hecAntrian(hecAntrian.hecAntrianId));
  }

  //Method to retrieve HecAntrianModel object based on the given HecAntrianId
  Stream<HecAntrianModel> hecAntrianStream({@required String hecAntrianId}) =>
      _firestoreService.documentStream(
        path: FirestorePath.hecAntrian(hecAntrianId),
        builder: (data, documentId) =>
            HecAntrianModel.fromMap(data, documentId),
      );

  //Method to retrieve all HecAntrians item from the same user based on uid
  Stream<List<HecAntrianModel>> hecAntriansStream() =>
      _firestoreService.collectionStream(
        path: FirestorePath.hecAntrians(),
        builder: (data, documentId) =>
            HecAntrianModel.fromMap(data, documentId),
      );

  //Method to retrieve todoModel object based on the given todoId
  Stream<List<HecAntrianModel>> hecAntrianModelQbyUserIdStream(
          {@required String query1}) =>
      _firestoreService.collectionStream(
        path: FirestorePath.hecAntrians(),
        queryBuilder: query1 != null
            ? (query) => query.where('orderByUser', isEqualTo: query1)
            : null,
        builder: (data, documentId) =>
            HecAntrianModel.fromMap(data, documentId),
      );

  //Method to retrieve todoModel object based on the given todoId
  Stream<List<HecAntrianModel>> hecAntrianModelQryByDateStream(
          {@required String query1}) =>
      _firestoreService.collectionStream(
        path: FirestorePath.hecAntrians(),
        queryBuilder: query1 != null
            ? (query) => query.where('hecAntrianTglAntri', isEqualTo: query1)
            : null,
        builder: (data, documentId) =>
            HecAntrianModel.fromMap(data, documentId),
      );

  // absensis
  //Method to create/update all absensiModel
  Future<void> setabsensi(AbsensiModel absensi) async =>
      await _firestoreService.setData(
        path: FirestorePath.absensi(absensi.absensiId),
        data: absensi.toMap(),
      );

  //Method to update partial absensiModel
  Future<void> updateabsensi(AbsensiModel absensi) async =>
      await _firestoreService.updateData(
        path: FirestorePath.absensi(absensi.absensiId),
        data: absensi.toMap(),
      );

  //Method to delete absensiModel entry
  Future<void> deleteabsensi(AbsensiModel absensi) async {
    await _firestoreService.deleteData(
        path: FirestorePath.absensi(absensi.absensiId));
  }

  //Method to retrieve absensiModel object based on the given absensiId
  Stream<AbsensiModel> absensiStream({@required String absensiId}) =>
      _firestoreService.documentStream(
        path: FirestorePath.absensi(absensiId),
        builder: (data, documentId) => AbsensiModel.fromMap(data, documentId),
      );

  //Method to retrieve all absensis item from the same user based on uid
  Stream<List<AbsensiModel>> absensisStream() =>
      _firestoreService.collectionStream(
        path: FirestorePath.absensis(),
        builder: (data, documentId) => AbsensiModel.fromMap(data, documentId),
      );

  //Method to retrieve todoModel object based on the given todoId
  Stream<List<AbsensiModel>> absensiModelQbyUserIdStream(
          {@required String query1}) =>
      _firestoreService.collectionStream(
        path: FirestorePath.absensis(),
        queryBuilder: query1 != null
            ? (query) => query.where('orderByUser', isEqualTo: query1)
            : null,
        builder: (data, documentId) => AbsensiModel.fromMap(data, documentId),
      );

  //Method to retrieve todoModel object based on the given todoId
  Stream<List<AbsensiModel>> absensiModelQryByDateStream(
          {@required String query1}) =>
      _firestoreService.collectionStream(
        path: FirestorePath.absensis(),
        queryBuilder: query1 != null
            ? (query) => query.where('absensiTglAntri', isEqualTo: query1)
            : null,
        builder: (data, documentId) => AbsensiModel.fromMap(data, documentId),
      );

// projects
  //Method to create/update all projectModel
  Future<void> setProject(ProjectModel project) async =>
      await _firestoreService.setData(
        path: FirestorePath.project(project.projectId),
        data: project.toMap(),
      );

  //Method to update partial projectModel
  Future<void> updateProject(ProjectModel project) async =>
      await _firestoreService.updateData(
        path: FirestorePath.project(project.projectId),
        data: project.toMap(),
      );

  //Method to delete projectModel entry
  Future<void> deleteProject(ProjectModel project) async {
    await _firestoreService.deleteData(
        path: FirestorePath.project(project.projectId));
  }

  //Method to retrieve projectModel object based on the given projectId
  Stream<ProjectModel> projectStream({@required String projectId}) =>
      _firestoreService.documentStream(
        path: FirestorePath.project(projectId),
        builder: (data, documentId) => ProjectModel.fromMap(data, documentId),
      );

  //Method to retrieve all projects item from the same user based on uid
  Stream<List<ProjectModel>> projectsStream() =>
      _firestoreService.collectionStream(
        path: FirestorePath.projects(),
        builder: (data, documentId) => ProjectModel.fromMap(data, documentId),
      );

  //Method to retrieve todoModel object based on the given todoId
  Stream<List<ProjectModel>> projectModelQbyUserIdStream(
          {@required String query1}) =>
      _firestoreService.collectionStream(
        path: FirestorePath.projects(),
        queryBuilder: query1 != null
            ? (query) => query.where('orderByUser', isEqualTo: query1)
            : null,
        builder: (data, documentId) => ProjectModel.fromMap(data, documentId),
      );

  //Method to retrieve todoModel object based on the given todoId
  Stream<List<ProjectModel>> projectModelQryByDateStream(
          {@required String query1}) =>
      _firestoreService.collectionStream(
        path: FirestorePath.projects(),
        queryBuilder: query1 != null
            ? (query) => query.where('projectTglAntri', isEqualTo: query1)
            : null,
        builder: (data, documentId) => ProjectModel.fromMap(data, documentId),
      );
}

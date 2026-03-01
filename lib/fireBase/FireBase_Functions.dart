import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:evently_new/model/task_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseFunctions {
  static CollectionReference<TaskModel> getTasksCollection() {
    return FirebaseFirestore.instance
        .collection('tasks')
        .withConverter<TaskModel>(
      fromFirestore: (snapshot, options) {
        return TaskModel.fromJson(snapshot.data()!);
      },
      toFirestore: (value, options) {
        return value.toJson();
      },
    );
  }

  static Future<void> createTask(TaskModel task) {
    var collection = getTasksCollection();
    var docRef = collection.doc();
    task.id = docRef.id;
    return docRef.set(task);
  }

  static Future<void> updateTask(TaskModel task) {
    return getTasksCollection().doc(task.id).update(task.toJson());
  }

  static Stream<QuerySnapshot<TaskModel>> getTasks() {
    return getTasksCollection().snapshots();
  }

  static Stream<QuerySnapshot<TaskModel>> getFavoriteTasks() {
    return getTasksCollection()
        .where('isFavorite', isEqualTo: true)
        .snapshots();
  }

  static sendPasswordReset(
    String emailAddress,
    Function OnSuccess,
    Function OnError,
  ) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: emailAddress);
      OnSuccess();
    } on FirebaseAuthException catch (e) {
      OnError('OnError'.tr());
    } catch (e) {
      OnError('OnError'.tr());
    }
  }

  static createUserWithEmailAndPassword(
    String emailAddress,
    String password,
    String name,
    Function OnSuccess,
    Function OnError,
  ) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      await credential.user!.updateDisplayName(name);
      await credential.user!.sendEmailVerification();
      OnSuccess();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        OnError('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        OnError('The account already exists for that email.');
      } else {
        OnError(e.message ?? 'Error');
      }
    } catch (e) {
      OnError(e.toString());
    }
  }

  static signInWithEmailAndPassword(
    String emailAddress,
    String password,
    Function OnSuccess,
    Function OnError,
  ) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      if (credential.user!.emailVerified) {
        OnSuccess();
      } else {
        OnError('Please verify your email'.tr());
      }
    } on FirebaseAuthException catch (e) {
      OnError(e.message ?? 'Error');
    }
  }
}

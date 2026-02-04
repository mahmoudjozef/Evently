import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:evently_new/model/task_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseFunctions {

  static final TaskCollection = FirebaseFirestore.instance.collection('TaskCollection').withConverter<TaskModel>(
    fromFirestore: (snapshot, _) => TaskModel.fromJson(snapshot.data()!),
    toFirestore: (value, options) => value.toJson(),
  );
  static Future<void> createTask(TaskModel task) async {
    try {
      var docRef = TaskCollection.doc();
      task.id = docRef.id;
      await docRef.set(task);
      print("Task added successfully!");
    } catch (e) {
      print("Error creating task: $e");
      rethrow;
    }
  }
  // static CollectionReference <TaskModel> getTaskCollection() {
  //   return FirebaseFirestore.instance
  //       .collection('Task')
  //       .withConverter(
  //         fromFirestore: (snapshot, options) =>
  //             TaskModel.fromJson(snapshot.data()!),
  //         toFirestore: (value, options) => value.toJson(),
  //       );
  // }
  //
  // static craeteTask(TaskModel task) {
  //   var Collection = getTaskCollection();
  //   var dec = Collection.doc();
  //   task.id = dec.id;
  //   return dec.set(task);
  // }

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
      credential.user!.sendEmailVerification();
      OnSuccess();
    } on FirebaseAuthException catch (e) {
      OnError('OnError'.tr());
      print('Thames Error');
    } catch (e) {
      OnError('OnError'.tr());
      print('Thames Error');
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
      OnError('OnError'.tr());
    }
  }
}

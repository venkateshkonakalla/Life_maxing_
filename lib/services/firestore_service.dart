import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirestoreService {
  static final users = FirebaseFirestore.instance.collection("users");
  static final looks = FirebaseFirestore.instance.collection("looks_metrics");
  static final body = FirebaseFirestore.instance.collection("body_metrics");
  static final mind = FirebaseFirestore.instance.collection("mind_metrics");
  static final taskLogs = FirebaseFirestore.instance.collection("task_logs");
  static final routines = FirebaseFirestore.instance.collection("routines");
  static final weekly = FirebaseFirestore.instance.collection("weekly_reports");

  // ✅ Create User
  static Future<void> createUser(dynamic user) async {
    await users.doc(user.uid).set({
      "email": user.email,
      "name": user.displayName ?? "",
      "photo": user.photoURL ?? "",
      "createdAt": DateTime.now(),
    });
  }

  // ✅ Save Looks Metrics
  static Future<void> saveLooksScores(String uid, Map data) async {
    await looks.add({...data, "userId": uid, "timestamp": DateTime.now()});
  }

  // ✅ Save Body Metrics
  static Future<void> saveBodyMetrics(String uid, Map data) async {
    await body.add({...data, "userId": uid, "timestamp": DateTime.now()});
  }

  // ✅ Save Mind Metrics
  static Future<void> saveMindMetrics(String uid, Map data) async {
    await mind.add({...data, "userId": uid, "timestamp": DateTime.now()});
  }

  // ✅ Log Task Completion
  static Future<void> logTask(String uid, String taskName, String category) async {
    await taskLogs.add({
      "userId": uid,
      "taskName": taskName,
      "category": category,
      "completedAt": DateTime.now(),
    });
  }

  // ✅ Save Weekly AI Report
  static Future<void> saveWeeklyReport(String uid, Map data) async {
    await weekly.add({...data, "userId": uid, "timestamp": DateTime.now()});
  }

  // ✅ Delete All User Data
  static Future<void> deleteAllUserData(String uid) async {
    await users.doc(uid).delete();

    await _delete("looks_metrics", uid);
    await _delete("body_metrics", uid);
    await _delete("mind_metrics", uid);
    await _delete("task_logs", uid);
    await _delete("routines", uid);
    await _delete("weekly_reports", uid);

    // ✅ Delete user storage folder
    final ref = FirebaseStorage.instance.ref().child("users/$uid");
    final files = await ref.listAll();
    for (var f in files.items) {
      await f.delete();
    }
  }

  static Future<void> _delete(String collection, String uid) async {
    final snap = await FirebaseFirestore.instance
        .collection(collection)
        .where("userId", isEqualTo: uid)
        .get();

    for (var doc in snap.docs) {
      await doc.reference.delete();
    }
  }
}
``

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Firebase Init
  await Firebase.initializeApp();

  // Hive Init
  await Hive.initFlutter();
  await Hive.openBox("user_local");
  await Hive.openBox("task_logs");
  await Hive.openBox("sync_queue");
  await Hive.openBox("local_cache");

  runApp(const LifeMaxApp());
}

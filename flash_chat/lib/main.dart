import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flash_chat/firebase_options.dart';
import 'package:flash_chat/pages/home/home_page.dart';
import 'package:flash_chat/pages/welcome/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp(prefs: prefs));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.prefs});

  final SharedPreferences prefs;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: prefs.getString('token') != null && prefs.getString('token') != ''
          ? HomePage(password: prefs.getString('password') ?? '')
          : const WelcomePage(),
    );
  }
}

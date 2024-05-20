import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_18/pages/auth_page.dart';
import 'package:firebase_auth_18/pages/home_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailCtl = TextEditingController();
  final passwordCtl = TextEditingController();

  Future<void> login({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (credential.user != null) {
        log(credential.user!.email!);
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(
              email: credential.user!.email!,
              password: password,
            ),
          ),
          (route) => false,
        );
      } else {
        log('мындай аккаунт жок');
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        log('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        log('Wrong password provided for that user.');
      } else {
        showDialog<void>(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text(
                'Ката',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.red),
              ),
              content: const Text(
                'Мындай аккаунт жок\n'
                'Email же Пароль туура эмес\n',
                textAlign: TextAlign.center,
              ),
              actions: <Widget>[
                TextButton(
                  style: TextButton.styleFrom(
                    textStyle: Theme.of(context).textTheme.labelLarge,
                  ),
                  child: const Text('Артка кайтуу'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    textStyle: Theme.of(context).textTheme.labelLarge,
                  ),
                  child: const Text('Регистрация жасоо'),
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const AuthPage()),
                      (route) => false,
                    );
                  },
                ),
              ],
            );
          },
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Instagram',
                style: TextStyle(fontSize: 40),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 46,
                child: TextField(
                  controller: emailCtl,
                  decoration: const InputDecoration(
                    hintText: 'Enter your email address',
                    contentPadding: EdgeInsets.only(left: 10),
                    border: OutlineInputBorder(),
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 46,
                child: TextField(
                  controller: passwordCtl,
                  decoration: const InputDecoration(
                    suffixIcon: Icon(Icons.visibility_off),
                    hintText: 'Password',
                    contentPadding: EdgeInsets.only(left: 10),
                    border: OutlineInputBorder(),
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 14),
              const Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'Forgotten password?',
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 140, 255),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    if (emailCtl.text.isNotEmpty &&
                        passwordCtl.text.isNotEmpty) {
                      await login(
                        email: emailCtl.text,
                        password: passwordCtl.text,
                      );
                      emailCtl.clear();
                      passwordCtl.clear();
                    } else {
                      log('email is null');
                      log('password is null');
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2),
                    ),
                    backgroundColor: const Color.fromARGB(255, 0, 140, 255),
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(border: Border(top: BorderSide())),
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Don't have an account? "),
            InkWell(
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const AuthPage()),
                  (route) => false,
                );
              },
              child: const Text(
                "Sign Up",
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 140, 255),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

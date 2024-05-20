import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_18/pages/home_page.dart';
import 'package:firebase_auth_18/pages/login_page.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final emailCtl = TextEditingController();
  final passwordCtl = TextEditingController();

  Future<void> register({
    required String email,
    required String password,
  }) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (credential.user != null) {
        log(credential.user!.email.toString());
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
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
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
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    if (emailCtl.text.isNotEmpty &&
                        passwordCtl.text.isNotEmpty) {
                      await register(
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
                    'Sign Up',
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
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                  (route) => false,
                );
              },
              child: const Text(
                "Log in",
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

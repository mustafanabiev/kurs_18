import 'dart:developer';

import 'package:api_lesson_6/pages/profile_page.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ProfileDeletePage extends StatefulWidget {
  const ProfileDeletePage({super.key});

  @override
  State<ProfileDeletePage> createState() => _ProfileDeletePageState();
}

class _ProfileDeletePageState extends State<ProfileDeletePage> {
  Future<void> deleteAccount() async {
    try {
      final dio = Dio();
      final response = await dio.delete('https://reqres.in/api/users/2');
      if (response.statusCode == 204) {
        showDialog<void>(
          // ignore: use_build_context_synchronously
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text(
                'Ийгиликтүү ишке ашты',
                style: TextStyle(color: Colors.green),
              ),
              content: const Icon(
                Icons.check,
                color: Colors.green,
                size: 160,
              ),
              actions: <Widget>[
                TextButton(
                  style: TextButton.styleFrom(
                    textStyle: Theme.of(context).textTheme.labelLarge,
                  ),
                  child: const Text('Артка кайтуу'),
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProfilePage(),
                      ),
                      (route) => false,
                    );
                  },
                ),
              ],
            );
          },
        );
      } else {
        log('error');
      }
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Аккаунтту өчүрүү',
          style: TextStyle(color: Colors.red),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Сиз чын эле аккаунтуңузду өчүрүүнү каалап жатасызбы?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                      ),
                      child: const Text('Жок'),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        deleteAccount();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                      ),
                      child: const Text('Ооба'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

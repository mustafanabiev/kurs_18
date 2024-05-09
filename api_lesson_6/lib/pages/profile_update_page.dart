import 'dart:developer';

import 'package:api_lesson_6/model/user_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ProfileUpdatePage extends StatefulWidget {
  const ProfileUpdatePage({super.key});

  @override
  State<ProfileUpdatePage> createState() => _ProfileUpdatePageState();
}

class _ProfileUpdatePageState extends State<ProfileUpdatePage> {
  final nameCtl = TextEditingController();
  final jobCtl = TextEditingController();

  Future<UserModel?> updateUserData(UserModel userModel) async {
    try {
      final dio = Dio();
      final response = await dio.patch(
        'https://reqres.in/api/users/2',
        data: userModel.toJson(),
      );
      if (response.statusCode == 200) {
        return UserModel.fromJson(response.data);
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Профилди өзгөртүү'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 60, 30, 0),
        child: Column(
          children: [
            TextFormField(
              controller: nameCtl,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Атыңызды жазыңыз ...',
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: jobCtl,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Жумушуңузду жазыңыз ...',
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                onPressed: () async {
                  if (nameCtl.text.isNotEmpty && jobCtl.text.isNotEmpty) {
                    final userData = await updateUserData(
                      UserModel(name: nameCtl.text, job: jobCtl.text),
                    );
                    if (userData != null) {
                      showDialog<void>(
                        // ignore: use_build_context_synchronously
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text(
                              'Ийгиликтүү ишке ашты',
                              style: TextStyle(color: Colors.green),
                            ),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(
                                  Icons.check,
                                  color: Colors.green,
                                  size: 160,
                                ),
                                Text(
                                  'name: ${userData.name}\n'
                                  'job: ${userData.job}\n'
                                  'updatedAt: ${userData.updatedAt}\n',
                                ),
                              ],
                            ),
                            actions: <Widget>[
                              TextButton(
                                style: TextButton.styleFrom(
                                  textStyle:
                                      Theme.of(context).textTheme.labelLarge,
                                ),
                                child: const Text('Артка кайтуу'),
                                onPressed: () {
                                  nameCtl.clear();
                                  jobCtl.clear();
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    }
                  } else {
                    const snackBar = SnackBar(
                      content: Text('Атыңызды жана жумушуңузду жазыңыз ...'),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
                child: const Text('Оңдоо'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'dart:developer';

import 'package:api_lesson_5/models/user_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final nameCtl = TextEditingController();
  final jobCtl = TextEditingController();

  Future<UserModel?> updateData({required UserModel userModel}) async {
    try {
      final dio = Dio();
      final response = await dio.put(
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
      appBar: AppBar(title: const Text('API 5')),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 60, 30, 0),
        child: Column(
          children: [
            const Text(
              'Профиль',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: nameCtl,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Атыңызды кийириңиз ...',
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: jobCtl,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Жумушуңузду кийириңиз ...',
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                onPressed: () async {
                  if (nameCtl.text.isNotEmpty && jobCtl.text.isNotEmpty) {
                    final userData = await updateData(
                      userModel: UserModel(
                        name: nameCtl.text,
                        job: jobCtl.text,
                      ),
                    );
                    if (userData != null) {
                      showDialog<void>(
                        // ignore: use_build_context_synchronously
                        context: context,
                        builder: (BuildContext context) {
                          Future<void> closeDialog() async {
                            await Future.delayed(const Duration(seconds: 6));
                            nameCtl.clear();
                            jobCtl.clear();
                            Navigator.pop(context);
                          }

                          closeDialog();
                          return AlertDialog(
                            title: const Text('Ийгиликтүү өзгөрдү'),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(
                                  Icons.check,
                                  color: Colors.green,
                                  size: 160,
                                ),
                                const SizedBox(height: 20),
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
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Атыңызды жана жумушуңызду кийирииз ...'),
                    ));
                  }
                },
                child: const Text(
                  'Жаңылоо',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

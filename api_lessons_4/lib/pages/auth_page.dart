import 'dart:developer';

import 'package:api_lessons_4/model/user_model.dart';
import 'package:api_lessons_4/pages/home_page.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final nameCtl = TextEditingController();
  final jobCtl = TextEditingController();
  bool isAuth = false;

  Future<void> create({
    required String name,
    required String job,
  }) async {
    try {
      setState(() {
        isAuth = true;
      });
      final dio = Dio();
      final response = await dio.post(
        'https://reqres.in/api/users',
        data: {
          "name": name,
          "job": job,
        },
      );
      if (response.statusCode == 201) {
        final userData = UserModel.fromJson(response.data);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return HomePage(userModel: userData);
            },
          ),
        );
        setState(() {
          isAuth = false;
        });
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
      backgroundColor: const Color.fromARGB(255, 165, 198, 255),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 165, 198, 255),
        title: const Text('Каттоо баракчасы'),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(40, 100, 40, 0),
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
                onPressed: () {
                  if (nameCtl.text.isNotEmpty && jobCtl.text.isNotEmpty) {
                    create(name: nameCtl.text, job: jobCtl.text);
                    nameCtl.clear();
                    jobCtl.clear();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Атыңызды жана жумушуңузду толук жазыңыз !!!',
                        ),
                      ),
                    );
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Каттоо',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                    if (isAuth)
                      const Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(),
                        ),
                      )
                    else
                      const SizedBox(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'dart:developer';

import 'package:api_lesson_3/model/user_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ApiPage extends StatelessWidget {
  const ApiPage({super.key});

  Future<List<UserModel>?> getUserData() async {
    List<UserModel> users = [];
    try {
      final dio = Dio();
      final response = await dio.get('https://reqres.in/api/users?delay=3');
      if (response.statusCode == 200) {
        for (var element in response.data['data']) {
          final data = UserModel.fromJson(element);
          users.add(data);
        }
        return users;
      } else {
        log(response.statusCode.toString());
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Api')),
      body: FutureBuilder(
        future: getUserData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final user = snapshot.data![index];
                return Card(
                  child: ListTile(
                    leading: Text(user.id.toString()),
                    title: Text(user.firstName),
                    subtitle: Text('${user.lastName} || ${user.email}'),
                    trailing: Image.network(user.avatar),
                  ),
                );
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

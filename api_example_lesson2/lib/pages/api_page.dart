import 'package:api_example_lesson2/model/user_model.dart';
import 'package:api_example_lesson2/pages/info_page.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ApiPage extends StatefulWidget {
  const ApiPage({super.key});

  // @override
  // State<StatefulWidget> createState() => _ApiPageState();

  @override
  State<StatefulWidget> createState() {
    return _ApiPageState();
  }
}

class _ApiPageState extends State<ApiPage> {
  List<UserModel> userData = [];

  Future<void> getUserData() async {
    final dio = Dio();
    final response = await dio.get('https://reqres.in/api/users?page=2');
    if (response.statusCode == 200) {
      for (var user in response.data['data']) {
        // final userModel = UserModel(
        //   id: element['id'],
        //   email: element['email'],
        //   firstName: element['first_name'],
        //   lastName: element['last_name'],
        //   avatar: element['avatar'],
        // );
        setState(() {
          userData.add(UserModel(
            id: user['id'],
            email: user['email'],
            firstName: user['first_name'],
            lastName: user['last_name'],
            avatar: user['avatar'],
          ));
        });
      }
    }
  }

  @override
  void initState() {
    getUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('API'),
      ),
      body: userData.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: 6,
              itemBuilder: (context, index) {
                final item = userData[index];
                return Card(
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => InfoPage(userModel: item),
                        ),
                      );
                    },
                    leading: Text('${++index}'),
                    title: Text(item.firstName),
                    subtitle: Text(item.lastName),
                    trailing: Image.network(item.avatar),
                  ),
                );
              },
            ),
    );
  }
}

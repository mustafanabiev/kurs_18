import 'package:api_lessons_4/model/user_model.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.userModel});

  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 165, 198, 255),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 165, 198, 255),
        title: const Text('Башкы баракча'),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 80),
            const Text(
              'Ийгиликтүү түзүлдү',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w700,
              ),
            ),
            const Icon(
              Icons.check,
              color: Colors.green,
              size: 120,
            ),
            const SizedBox(height: 10),
            Card(
              child: ListTile(
                title: Text(userModel.name),
                subtitle: Text(userModel.job),
                leading: Text(userModel.id),
                trailing: Text(userModel.createdAt),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:api_lesson_6/pages/profile_delete_page.dart';
import 'package:api_lesson_6/pages/profile_update_page.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Профиль'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Card(
            child: ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProfileUpdatePage(),
                  ),
                );
              },
              title: const Text('Профилди өзгөртүү'),
            ),
          ),
          Card(
            child: ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProfileDeletePage(),
                  ),
                );
              },
              title: const Text(
                'Аккаунтту өчүрүү',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

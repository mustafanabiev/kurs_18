import 'package:api_example_lesson2/model/user_model.dart';
import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({
    super.key,
    required this.userModel,
  });

  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Info Page'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'name: ${userModel.firstName}',
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            'last name: ${userModel.lastName}',
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            'email: ${userModel.email}',
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 10),
          Image.network(userModel.avatar),
        ],
      ),
    );
  }
}

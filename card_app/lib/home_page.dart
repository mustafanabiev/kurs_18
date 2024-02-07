import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
    required this.nameLastName,
    required this.kesibi,
    required this.phone,
    required this.email,
  });

  final String nameLastName;
  final String kesibi;
  final String phone;
  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff056C5C),
      appBar: AppBar(
        title: const Text('Тапшырма 4'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 90,
              backgroundImage: AssetImage('assets/download.jpeg'),
            ),
            Text(
              nameLastName,
              style: const TextStyle(
                fontFamily: 'Pacifico',
                fontSize: 48,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              '$kesibi Developer',
              style: const TextStyle(
                fontSize: 32,
                color: Colors.white,
              ),
            ),
            const Divider(
              indent: 65,
              endIndent: 65,
              height: 0,
              thickness: 2,
              color: Colors.white,
            ),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              height: 50,
              color: Colors.white,
              child: Row(
                children: [
                  const SizedBox(width: 50),
                  const Icon(
                    Icons.phone_outlined,
                    color: Color(0xff056C5C),
                    size: 28,
                  ),
                  const SizedBox(width: 20),
                  Text(
                    phone,
                    style: const TextStyle(
                      color: Color(0xff056C5C),
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              height: 50,
              color: Colors.white,
              child: Row(
                children: [
                  const SizedBox(width: 50),
                  const Icon(
                    Icons.email_outlined,
                    color: Color(0xff056C5C),
                    size: 28,
                  ),
                  const SizedBox(width: 20),
                  Text(
                    email,
                    style: const TextStyle(
                      color: Color(0xff056C5C),
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class MyStateLessWidget extends StatelessWidget {
  MyStateLessWidget({super.key});

  int san = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyStateLessWidget'),
      ),
      body: Center(
        child: Text(
          '$san',
          style: TextStyle(fontSize: 60),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          san++;
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

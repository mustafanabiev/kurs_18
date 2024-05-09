import 'package:flutter/material.dart';

class MyStateFulWidget extends StatefulWidget {
  const MyStateFulWidget({super.key});

  @override
  State<MyStateFulWidget> createState() => _MyStateFulWidgetState();
}

class _MyStateFulWidgetState extends State<MyStateFulWidget> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('MyStateFulWidget')),
      body: Center(
        child: Text(
          '$count',
          style: TextStyle(fontSize: 60),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            count++;
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

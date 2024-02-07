import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({
    required this.count,
    super.key,
  });

  final int count;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Тапшырма 2'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          width: 320,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            color: Color(0xCCAAAAAAA),
          ),
          child: Center(
            child: Text(
              'Сан: $count',
              style: TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

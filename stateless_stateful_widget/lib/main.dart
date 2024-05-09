import 'package:flutter/material.dart';
import 'package:stateless_stateful_widget/state_ful_widget.dart';
import 'package:stateless_stateful_widget/state_less_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyStateFulWidget(),
      // home: MyStateLessWidget(),
    );
  }
}

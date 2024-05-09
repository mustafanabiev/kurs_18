import 'package:flutter/material.dart';
import 'package:quiz_app/pages/home_page.dart';

class MeninTirkemem extends StatelessWidget {
  const MeninTirkemem({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const BashkyBarakcha(),
    );
  }
}

import 'dart:math';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int solJakKubik = 1;
  int onJakKubik = 4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFE93B),
      appBar: AppBar(
        title: const Text(
          'Тапшырма 5',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Row(
          children: [
            const SizedBox(width: 20),
            Expanded(
              child: InkWell(
                onTap: () {
                  setState(() {
                    solJakKubik = Random().nextInt(6) + 1;
                  });
                },
                child: Image.asset('assets/dice$solJakKubik.png'),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: InkWell(
                onTap: () {
                  setState(() {
                    onJakKubik = Random().nextInt(7);
                    // if (onJakKubik == 0) onJakKubik = 1;
                    // if (onJakKubik == 0) {
                    //   onJakKubik = 1;
                    // }
                  });
                },
                child: Image.asset(
                  'assets/dice${onJakKubik == 0 ? 1 : onJakKubik}.png',
                ),
                // child: Image.asset('assets/dice$onJakKubik.png'),
              ),
            ),
            const SizedBox(width: 20),
          ],
        ),
      ),
    );
  }
}

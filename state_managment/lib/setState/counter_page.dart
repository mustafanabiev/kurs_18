import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:state_managment/setState/second_page.dart';

class CounterSetStatePage extends StatefulWidget {
  const CounterSetStatePage({super.key});

  @override
  State<CounterSetStatePage> createState() => _CounterSetStatePageState();
}

class _CounterSetStatePageState extends State<CounterSetStatePage> {
  int count = 0;

  void increment() {
    setState(() {
      count++;
    });
  }

  void decrement() {
    setState(() {
      count--;
    });
  }

  @override
  Widget build(BuildContext context) {
    log('build');
    return Scaffold(
      appBar: AppBar(title: const Text('SetState')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () async {
                count = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SecondSetStatePage(
                      san: count,
                    ),
                  ),
                );
                setState(() {});
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10),
                ),
                width: 300,
                height: 70,
                child: Center(
                  child: Text(
                    '$count',
                    style: const TextStyle(fontSize: 50),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: decrement,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  child: const Icon(
                    Icons.remove,
                    color: Colors.white,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    increment();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

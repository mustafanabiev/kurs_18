import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SecondSetStatePage extends StatefulWidget {
  SecondSetStatePage({super.key, required this.san});

  int san;

  @override
  State<SecondSetStatePage> createState() => _SecondSetStatePageState();
}

class _SecondSetStatePageState extends State<SecondSetStatePage> {
  void decrement() {
    setState(() {
      widget.san--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SetState')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${widget.san}',
              style: const TextStyle(fontSize: 50),
            ),
            const SizedBox(height: 20),
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
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, widget.san);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
              child: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

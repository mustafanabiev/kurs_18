import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/pages/home_page.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final ctlTitle = TextEditingController();
  final ctlDesc = TextEditingController();
  final ctlDate = TextEditingController();

  Future<void> addDataToFirebase({
    required String title,
    required String description,
    required String date,
  }) async {
    try {
      final db = FirebaseFirestore.instance;
      final work = <String, dynamic>{
        "title": title,
        "description": description,
        "date": date,
      };
      db.collection("todo").add(work);
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
        title: const Text('Add new work'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          children: [
            TextFormField(
              controller: ctlTitle,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Title',
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: ctlDesc,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Description',
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: ctlDate,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Date',
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  if (ctlTitle.text.isNotEmpty &&
                      ctlDesc.text.isNotEmpty &&
                      ctlDate.text.isNotEmpty) {
                    addDataToFirebase(
                      title: ctlTitle.text,
                      description: ctlDesc.text,
                      date: ctlDate.text,
                    );
                    ctlTitle.clear();
                    ctlDesc.clear();
                    ctlDate.clear();
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomePage(),
                      ),
                      (route) => false,
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Бош орун калбоо керек!!!')),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  backgroundColor: Colors.blue,
                ),
                child: const Text(
                  'Add',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

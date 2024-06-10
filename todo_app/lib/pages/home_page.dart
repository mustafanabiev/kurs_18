import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/model/todo_model.dart';
import 'package:todo_app/pages/add_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<TodoModel> todoModel = [];

  Future<void> getTodos() async {
    try {
      final db = FirebaseFirestore.instance;
      await db.collection("todo").get().then((event) {
        for (var doc in event.docs) {
          final data = TodoModel.fromJson(doc.data());
          todoModel.add(data);
        }
        setState(() {});
      });
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  void initState() {
    getTodos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Todo App',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: todoModel.isEmpty
          ? const Center(
              child: Text(
                'Эч кандай тапшырма жок...',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                ),
              ),
            )
          : ListView.builder(
              itemCount: todoModel.length,
              itemBuilder: (context, index) {
                final item = todoModel[index];
                return Card(
                  color: Colors.blue,
                  child: ListTile(
                    title: Text(
                      item.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    subtitle: Text(
                      item.description,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    trailing: Text(
                      item.date,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddPage(),
            ),
          );
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}

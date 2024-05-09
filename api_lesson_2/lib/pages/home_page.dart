import 'package:api_lesson_2/model/comment_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CommentModel? commentModel;

  Future<void> getComments() async {
    final dio = Dio();
    final response =
        await dio.get('https://jsonplaceholder.typicode.com/comments');
    if (response.statusCode == 200) {
      setState(() {
        commentModel = CommentModel(
          postId: response.data[0]['postId'],
          id: response.data[0]['id'],
          name: response.data[0]['name'],
          email: response.data[0]['email'],
          body: response.data[0]['body'],
        );
      });
    }
  }

  @override
  void initState() {
    getComments();
    super.initState();
  }

  // void koshuu() {
  //   1 + 1;
  // }

  // int koshuu2() {
  //   return 1 + 1;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Api Example'),
      ),
      body: commentModel == null
          ? const Center(child: CircularProgressIndicator())
          : Center(
              child: Card(
                child: ListTile(
                  leading: Text(commentModel!.postId.toString()),
                  title: Text(commentModel!.name),
                  subtitle: Text(commentModel!.body),
                  trailing: Text(commentModel!.email),
                ),
              ),
            ),
    );
  }
}

import 'dart:async';

import 'package:dio/dio.dart';

Future<void> main() async {
  final dio = Dio();
  final response = await dio.get('https://jsonplaceholder.typicode.com/users');
  print(response);
}

// async
// await

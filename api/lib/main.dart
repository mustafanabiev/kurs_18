import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<dynamic>? maalymattar;

  Future<void> fetchData() async {
    final dio = Dio();
    final response =
        await dio.get('https://jsonplaceholder.typicode.com/users');
    // await Future.delayed(const Duration(seconds: 9));
    setState(() {
      maalymattar = response.data;
    });
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('API'),
      ),
      body: maalymattar == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: maalymattar?.length,
              itemBuilder: (context, index) {
                final item = maalymattar?[index];
                return Card(
                  child: ListTile(
                    leading: Text(item['id'].toString()),
                    title: Text(item['name']),
                    subtitle: Text(item['username']),
                    trailing: Text(item['phone']),
                  ),
                );
              },
            ),
    );
  }
}

// class _MyHomePageState extends State<MyHomePage> {
//   String? name;

//   Future<void> fetchData() async {
//     final dio = Dio();
//     final response =
//         await dio.get('https://jsonplaceholder.typicode.com/users');
//     setState(() {
//       name = response.data[0]['phone'];
//     });
//   }

//   @override
//   void initState() {
//     fetchData();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: const Text('API'),
//       ),
//       body: name == null
//           ? const Center(
//               child: CircularProgressIndicator(),
//             )
//           : Center(
//               child: Text(name!),
//             ),
//     );
//   }
// }

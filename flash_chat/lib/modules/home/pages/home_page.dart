import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/components/message_widget.dart';
import 'package:flash_chat/model/user_model.dart';
import 'package:flash_chat/modules/home/cubit/home_cubit.dart';
import 'package:flash_chat/modules/welcome/welcome_page.dart';
import 'package:flash_chat/service/auth_service.dart';
import 'package:flash_chat/service/home_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum SampleItem { delete, logout }

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.password});

  final String password;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = TextEditingController();
  SampleItem? selectedItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 204, 233, 230),
      appBar: AppBar(
        surfaceTintColor: const Color.fromARGB(255, 204, 233, 230),
        title: const Text('Chat'),
        backgroundColor: const Color.fromARGB(255, 204, 233, 230),
        actions: [
          PopupMenuButton<SampleItem>(
            initialValue: selectedItem,
            onSelected: (SampleItem item) async {
              setState(() {
                selectedItem = item;
              });
              if (item == SampleItem.logout) {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const WelcomePage(),
                  ),
                  (route) => false,
                );
                final SharedPreferences prefs =
                    await SharedPreferences.getInstance();
                await prefs.remove('token');
                await prefs.remove('password');
              } else {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const WelcomePage(),
                  ),
                  (route) => false,
                );
                final SharedPreferences prefs =
                    await SharedPreferences.getInstance();
                await prefs.remove('token');
                await prefs.remove('password');
                await AuthService().deleteUser(widget.password);
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<SampleItem>>[
              const PopupMenuItem<SampleItem>(
                value: SampleItem.delete,
                child: Text('Delete account'),
              ),
              const PopupMenuItem<SampleItem>(
                value: SampleItem.logout,
                child: Text(
                  'Logout',
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ],
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: StreamBuilder(
              stream: HomeService.streamMessage(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final message =
                      (snapshot.data!.docs.reversed as Iterable).map(
                    (e) => UserModel.fromMap(
                      e.data(),
                    )..isMe = e.data()['user'] ==
                        FirebaseAuth.instance.currentUser!.email,
                  );
                  return ListView(
                    children: message
                        .map((e) => MessageWidget(userModel: e))
                        .toList(),
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 10),
            height: 60,
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: const InputDecoration(
                      hintText: 'Текст жазыңыз ...',
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    final text = controller.text;
                    if (controller.text.isNotEmpty) {
                      controller.clear();
                      context.read<HomeCubit>().sendMassage(text);
                      setState(() {});
                    }
                  },
                  icon: const Icon(Icons.near_me),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

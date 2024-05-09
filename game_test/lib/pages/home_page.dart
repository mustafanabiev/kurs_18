import 'package:flutter/material.dart';
import 'package:game_test/components/custom_card.dart';
import 'package:game_test/constants/app_colors.dart';
import 'package:game_test/constants/app_text.dart';
import 'package:game_test/model/continents_model.dart';
import 'package:game_test/pages/test_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {},
            icon: const Icon(
              Icons.settings_outlined,
              color: AppColors.blueIconColor,
            ),
          ),
          IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {},
            icon: const Icon(
              Icons.more_vert,
            ),
          ),
        ],
        title: const Text(
          AppText.appBarText,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        flexibleSpace: const Padding(
          padding: EdgeInsets.only(top: 70),
          child: Divider(
            indent: 10,
            endIndent: 10,
            color: AppColors.black,
          ),
        ),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 40,
          crossAxisSpacing: 20,
        ),
        padding: const EdgeInsets.all(8),
        itemCount: continents.length,
        itemBuilder: (context, index) {
          final continent = continents[index];
          return InkWell(
            onTap: () {
              if (continent.suroo != null) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TestPage(suroo: continent.suroo!),
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Бул континентте суроо жок!!!')),
                );
              }
            },
            child: CustomCard(
              text: continent.text,
              icon: continent.icon,
              color: continent.color,
            ),
          );
        },
      ),
    );
  }
}

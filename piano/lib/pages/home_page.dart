import 'package:flutter/material.dart';
import 'package:piano/widgets/custom_black_button.dart';
import 'package:piano/widgets/custom_white_button.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff202637),
        title: const Text(
          'My Piano App',
          style: TextStyle(
            color: Colors.white,
            fontSize: 32,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 80,
            color: Colors.white,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 3,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return const Stack(
                  children: [
                    Row(
                      children: [
                        CustomWhiteButton(
                          title: 'f1',
                          nota: 'anthem-of-kyrgyzstan',
                        ),
                        CustomWhiteButton(title: 'f2', nota: 're'),
                        CustomWhiteButton(title: 'f3', nota: 'mi'),
                        CustomWhiteButton(title: 'f4', nota: 'fa'),
                        CustomWhiteButton(title: 'f5', nota: 'sol'),
                        CustomWhiteButton(title: 'f6', nota: 'lya'),
                        CustomWhiteButton(title: 'f7', nota: 'si'),
                      ],
                    ),
                    Positioned(
                      left: 35,
                      right: 0,
                      top: 0,
                      child: Row(
                        children: [
                          CustomBlackButton(title: 'f1', nota: 'do'),
                          CustomBlackButton(title: 'f2', nota: 're'),
                          CustomBlackButton(
                            title: 'f3',
                            visible: false,
                            nota: 'mi',
                          ),
                          CustomBlackButton(title: 'f4', nota: 'fa'),
                          CustomBlackButton(title: 'f5', nota: 'sol'),
                          CustomBlackButton(title: 'f6', nota: 'lya'),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

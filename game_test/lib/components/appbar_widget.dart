import 'package:flutter/material.dart';
import 'package:game_test/model/suroo_model.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    super.key,
    required this.suroolordunSany,
    required this.tuuraJoop,
    required this.kataJoop,
  });

  final int suroolordunSany;
  final int tuuraJoop;
  final int kataJoop;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Card(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            child: Row(
              children: [
                Text(
                  kataJoop.toString(),
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.red,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Text(
                    asiaQuestions.length.toString(),
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Text(
                  tuuraJoop.toString(),
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ),
        ),
        Text('$suroolordunSany', style: const TextStyle(fontSize: 22)),
        Row(
          children: [
            SizedBox(
              width: 70,
              height: 30,
              child: ListView.builder(
                itemCount: 3,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return const Icon(Icons.favorite, color: Colors.red);
                },
              ),
            ),
            // Icon(Icons.favorite, color: Colors.red),
            // Icon(Icons.favorite, color: Colors.red),
            // Icon(Icons.favorite, color: Colors.red),
            const Icon(Icons.more_vert),
          ],
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:game_test/model/suroo_model.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.jooptor,
    required this.onTap,
  });

  final List<Joop> jooptor;
  final Function(bool) onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 160,
        ),
        itemCount: 4,
        itemBuilder: (context, index) {
          final item = jooptor[index];
          return InkWell(
            onTap: () {
              onTap(item.isTrue);
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(1),
              ),
              color: const Color(0xffB4B4B4),
              child: Center(
                child: Text(
                  item.text,
                  style: const TextStyle(fontSize: 24),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
